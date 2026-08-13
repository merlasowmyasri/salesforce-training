@IsTest
private class CandidateSyncQueueableTest {

    /*
     * SUCCESS MOCK
     */
    private class SuccessMock implements HttpCalloutMock {

        public HttpResponse respond(HttpRequest request) {

            HttpResponse response = new HttpResponse();

            response.setStatusCode(201);
            response.setHeader(
                'Content-Type',
                'application/json'
            );

            response.setBody(
                '{"candidateId":"EXT001","status":"created"}'
            );

            return response;
        }
    }


    /*
     * SERVER ERROR MOCK
     */
    private class ServerErrorMock implements HttpCalloutMock {

        public HttpResponse respond(HttpRequest request) {

            HttpResponse response = new HttpResponse();

            response.setStatusCode(500);
            response.setHeader(
                'Content-Type',
                'application/json'
            );

            response.setBody(
                '{"error":"Internal Server Error"}'
            );

            return response;
        }
    }


    /*
     * AUTHENTICATION ERROR MOCK
     */
    private class AuthenticationErrorMock
        implements HttpCalloutMock {

        public HttpResponse respond(HttpRequest request) {

            HttpResponse response = new HttpResponse();

            response.setStatusCode(401);
            response.setHeader(
                'Content-Type',
                'application/json'
            );

            response.setBody(
                '{"error":"Authentication Failure"}'
            );

            return response;
        }
    }


    /*
     * BAD REQUEST MOCK
     */
    private class BadRequestMock
        implements HttpCalloutMock {

        public HttpResponse respond(HttpRequest request) {

            HttpResponse response = new HttpResponse();

            response.setStatusCode(400);
            response.setHeader(
                'Content-Type',
                'application/json'
            );

            response.setBody(
                '{"error":"Bad Request"}'
            );

            return response;
        }
    }


    /*
     * IDEMPOTENCY MOCK
     *
     * This mock verifies that Salesforce sends:
     *
     * 1. Idempotency-Key HTTP header
     * 2. applicationId in JSON
     * 3. idempotencyKey in JSON
     */
    private class IdempotencyMock
        implements HttpCalloutMock {

        private Id expectedApplicationId;

        public IdempotencyMock(Id applicationId) {
            this.expectedApplicationId = applicationId;
        }

        public HttpResponse respond(HttpRequest request) {

            /*
             * Check HTTP header
             */
            System.assertEquals(
                String.valueOf(expectedApplicationId),
                request.getHeader('Idempotency-Key')
            );


            /*
             * Read JSON request body
             */
            Map<String, Object> requestBody =
                (Map<String, Object>)
                JSON.deserializeUntyped(
                    request.getBody()
                );


            /*
             * Check applicationId
             */
            System.assertEquals(
                String.valueOf(expectedApplicationId),
                String.valueOf(
                    requestBody.get('applicationId')
                )
            );


            /*
             * Check idempotencyKey
             */
            System.assertEquals(
                String.valueOf(expectedApplicationId),
                String.valueOf(
                    requestBody.get('idempotencyKey')
                )
            );


            /*
             * Return successful response
             */
            HttpResponse response =
                new HttpResponse();

            response.setStatusCode(201);

            response.setHeader(
                'Content-Type',
                'application/json'
            );

            response.setBody(
                '{"candidateId":"EXT-IDEMPOTENT-001","status":"created"}'
            );

            return response;
        }
    }


    /*
     * CREATE TEST APPLICATION
     */
    private static Application__c createTestApplication() {

        Student__c student = new Student__c(
            Name = 'Test Student',
            CGPA__c = 8.5,
            Active_Backlogs__c = 0,
            Branch__c = 'CSE'
        );

        insert student;


        Job__c job = new Job__c(
            Name = 'Test Job',
            Minimum_CGPA__c = 7.0,
            Allowed_Backlogs__c = 2,
            Eligible_Branches__c = 'CSE'
        );

        insert job;


        Application__c application =
            new Application__c(
                Student__c = student.Id,
                Job__c = job.Id,
                Status__c = 'Selected'
            );

        insert application;

        return application;
    }


    /*
     * TEST 1
     * Successful Candidate Sync
     */
    @IsTest
    static void testSuccessfulCandidateSync() {

        Application__c application =
            createTestApplication();


        Test.setMock(
            HttpCalloutMock.class,
            new SuccessMock()
        );


        Test.startTest();

        System.enqueueJob(
            new CandidateSyncQueueable(
                application.Id
            )
        );

        Test.stopTest();


        Application__c result = [
            SELECT Id,
                   Status__c,
                   Integration_Status__c,
                   External_Candidate_Id__c,
                   Last_Integration_Attempt__c,
                   Integration_Error__c
            FROM Application__c
            WHERE Id = :application.Id
        ];


        System.assertEquals(
            'Selected',
            result.Status__c
        );


        System.assertEquals(
            'Sent',
            result.Integration_Status__c
        );


        System.assertEquals(
            'EXT001',
            result.External_Candidate_Id__c
        );


        System.assertNotEquals(
            null,
            result.Last_Integration_Attempt__c
        );


        System.assertEquals(
            null,
            result.Integration_Error__c
        );
    }


    /*
     * TEST 2
     * Server Error → Retry Required
     */
    @IsTest
    static void testServerErrorRetry() {

        Application__c application =
            createTestApplication();


        Test.setMock(
            HttpCalloutMock.class,
            new ServerErrorMock()
        );


        Test.startTest();

        System.enqueueJob(
            new CandidateSyncQueueable(
                application.Id
            )
        );

        Test.stopTest();


        Application__c result = [
            SELECT Id,
                   Integration_Status__c,
                   Integration_Error__c,
                   Retry_Count__c
            FROM Application__c
            WHERE Id = :application.Id
        ];


        System.assertEquals(
            'Retry Required',
            result.Integration_Status__c
        );


        System.assert(
            result.Integration_Error__c.contains(
                'Server Error'
            )
        );


        System.assertEquals(
            1,
            result.Retry_Count__c
        );
    }


    /*
     * TEST 3
     * Authentication Failure
     */
    @IsTest
    static void testAuthenticationFailure() {

        Application__c application =
            createTestApplication();


        Test.setMock(
            HttpCalloutMock.class,
            new AuthenticationErrorMock()
        );


        Test.startTest();

        System.enqueueJob(
            new CandidateSyncQueueable(
                application.Id
            )
        );

        Test.stopTest();


        Application__c result = [
            SELECT Id,
                   Integration_Status__c,
                   Integration_Error__c
            FROM Application__c
            WHERE Id = :application.Id
        ];


        System.assertEquals(
            'Failed',
            result.Integration_Status__c
        );


        System.assert(
            result.Integration_Error__c.contains(
                'Authentication Failure'
            )
        );
    }


    /*
     * TEST 4
     * Bad Request
     */
    @IsTest
    static void testBadRequest() {

        Application__c application =
            createTestApplication();


        Test.setMock(
            HttpCalloutMock.class,
            new BadRequestMock()
        );


        Test.startTest();

        System.enqueueJob(
            new CandidateSyncQueueable(
                application.Id
            )
        );

        Test.stopTest();


        Application__c result = [
            SELECT Id,
                   Integration_Status__c,
                   Integration_Error__c
            FROM Application__c
            WHERE Id = :application.Id
        ];


        System.assertEquals(
            'Failed',
            result.Integration_Status__c
        );


        System.assert(
            result.Integration_Error__c.contains(
                'Bad Request'
            )
        );
    }


    /*
     * TEST 5
     * Idempotency Key Verification
     */
    @IsTest
    static void testIdempotencyKey() {

        Application__c application =
            createTestApplication();


        Test.setMock(
            HttpCalloutMock.class,
            new IdempotencyMock(
                application.Id
            )
        );


        Test.startTest();

        System.enqueueJob(
            new CandidateSyncQueueable(
                application.Id
            )
        );

        Test.stopTest();


        Application__c result = [
            SELECT Id,
                   Integration_Status__c,
                   External_Candidate_Id__c
            FROM Application__c
            WHERE Id = :application.Id
        ];


        /*
         * The request passed all
         * idempotency assertions.
         */
        System.assertEquals(
            'Sent',
            result.Integration_Status__c
        );


        System.assertEquals(
            'EXT-IDEMPOTENT-001',
            result.External_Candidate_Id__c
        );
    }
}
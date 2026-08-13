public class CandidateSyncQueueable implements Queueable, Database.AllowsCallouts {

    private Id applicationId;

    public CandidateSyncQueueable(Id applicationId) {
        this.applicationId = applicationId;
    }

    public void execute(QueueableContext context) {

        Application__c app = [
            SELECT Id,
                   Status__c,
                   Student__c,
                   Job__c,
                   Retry_Count__c,
                   Student__r.Name,
                   Student__r.Email__c,
                   Student__r.Branch__c,
                   Student__r.CGPA__c,
                   Job__r.Name,
                   Job__r.Company__c,
                   Job__r.Role__c
            FROM Application__c
            WHERE Id = :applicationId
            LIMIT 1
        ];

        if (app.Status__c != 'Selected') {
            return;
        }

        // Track the integration attempt in memory.
        // No DML before the HTTP callout.
        app.Last_Integration_Attempt__c = System.now();


        // Build candidate payload
        Map<String, Object> candidate =
            new Map<String, Object>();


        // Unique Salesforce business transaction identifier
        candidate.put(
            'applicationId',
            String.valueOf(app.Id)
        );


        // Idempotency key
        // The same Application Id is used for retries
        candidate.put(
            'idempotencyKey',
            String.valueOf(app.Id)
        );


        candidate.put(
            'studentId',
            String.valueOf(app.Student__c)
        );

        candidate.put(
            'name',
            app.Student__r.Name
        );

        candidate.put(
            'email',
            app.Student__r.Email__c
        );

        candidate.put(
            'branch',
            app.Student__r.Branch__c
        );

        candidate.put(
            'cgpa',
            app.Student__r.CGPA__c
        );

        candidate.put(
            'jobId',
            String.valueOf(app.Job__c)
        );

        candidate.put(
            'company',
            app.Job__r.Company__c
        );

        candidate.put(
            'role',
            app.Job__r.Role__c
        );

        candidate.put(
            'selectionDate',
            String.valueOf(Date.today())
        );


        // HTTP Request
        HttpRequest request =
            new HttpRequest();

        request.setEndpoint(
            'callout:Recruitment_API/candidates'
        );

        request.setMethod('POST');

        request.setHeader(
            'Content-Type',
            'application/json'
        );


        // Idempotency key sent as HTTP header
        request.setHeader(
            'Idempotency-Key',
            String.valueOf(app.Id)
        );


        request.setBody(
            JSON.serialize(candidate)
        );


        Http http = new Http();


        try {

            HttpResponse response =
                http.send(request);

            Integer statusCode =
                response.getStatusCode();


            // SUCCESS
            if (
                statusCode == 200 ||
                statusCode == 201
            ) {

                app.Integration_Status__c =
                    'Sent';

                app.Integration_Error__c =
                    null;


                try {

                    Map<String, Object> responseData =
                        (Map<String, Object>)
                        JSON.deserializeUntyped(
                            response.getBody()
                        );


                    if (
                        responseData.containsKey(
                            'candidateId'
                        )
                    ) {

                        app.External_Candidate_Id__c =
                            String.valueOf(
                                responseData.get(
                                    'candidateId'
                                )
                            );
                    }

                } catch (Exception jsonException) {

                    // Response body is optional
                    // for this prototype.
                }
            }


            // BAD REQUEST
            else if (statusCode == 400) {

                app.Integration_Status__c =
                    'Failed';

                app.Integration_Error__c =
                    'Bad Request: ' +
                    response.getBody();
            }


            // AUTHENTICATION FAILURE
            else if (statusCode == 401) {

                app.Integration_Status__c =
                    'Failed';

                app.Integration_Error__c =
                    'Authentication Failure: ' +
                    response.getBody();
            }


            // FORBIDDEN
            else if (statusCode == 403) {

                app.Integration_Status__c =
                    'Failed';

                app.Integration_Error__c =
                    'Forbidden: ' +
                    response.getBody();
            }


            // SERVER ERROR → RETRY REQUIRED
            else if (statusCode == 500) {

                markRetryRequired(
                    app,
                    'Server Error: ' +
                    response.getBody()
                );

                return;
            }


            // UNEXPECTED RESPONSE
            else {

                app.Integration_Status__c =
                    'Failed';

                app.Integration_Error__c =
                    'Unexpected Response (' +
                    statusCode +
                    '): ' +
                    response.getBody();
            }


        } catch (Exception e) {

            markRetryRequired(
                app,
                e.getMessage()
            );

            return;
        }


        // Single DML after callout
        update app;
    }


    private void markRetryRequired(
        Application__c app,
        String errorMessage
    ) {

        Integer retryCount =
            app.Retry_Count__c == null
            ? 0
            : Integer.valueOf(
                app.Retry_Count__c
            );


        // Maximum 3 retry attempts
        if (retryCount < 3) {

            app.Retry_Count__c =
                retryCount + 1;

            app.Integration_Status__c =
                'Retry Required';

            app.Integration_Error__c =
                errorMessage;

        } else {

            app.Integration_Status__c =
                'Failed';

            app.Integration_Error__c =
                'Maximum retry attempts reached. ' +
                errorMessage;
        }


        update app;
    }
}
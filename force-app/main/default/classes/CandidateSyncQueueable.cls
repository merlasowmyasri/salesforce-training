public class CandidateSyncQueueable implements Queueable, Database.AllowsCallouts {

    private Id applicationId;

    public CandidateSyncQueueable(Id applicationId) {
        this.applicationId = applicationId;
    }

    public void execute(QueueableContext context) {

        Application__c applicationRecord = [
            SELECT Id,
                   Application_Date__c,
                   Status__c,
                   CGPA__c,
                   Student__c,
                   Student__r.Name,
                   Student__r.Email__c,
                   Student__r.Branch__c,
                   Student__r.CGPA__c,
                   Job__c,
                   Job__r.Name,
                   Job__r.Company__c,
                   Job__r.Role__c,
                   Integration_Status__c,
                   External_Candidate_Id__c,
                   Last_Integration_Attempt__c,
                   Integration_Error__c
            FROM Application__c
            WHERE Id = :applicationId
            LIMIT 1
        ];

        applicationRecord.Integration_Status__c = 'Pending';
        applicationRecord.Last_Integration_Attempt__c = System.now();

        try {

            Map<String, Object> candidate = new Map<String, Object>();

            candidate.put(
                'studentId',
                String.valueOf(applicationRecord.Student__c)
            );

            candidate.put(
                'name',
                applicationRecord.Student__r.Name
            );

            candidate.put(
                'email',
                applicationRecord.Student__r.Email__c
            );

            candidate.put(
                'branch',
                applicationRecord.Student__r.Branch__c
            );

            candidate.put(
                'cgpa',
                applicationRecord.Student__r.CGPA__c
            );

            candidate.put(
                'jobId',
                String.valueOf(applicationRecord.Job__c)
            );

            candidate.put(
                'company',
                applicationRecord.Job__r.Company__c
            );

            candidate.put(
                'role',
                applicationRecord.Job__r.Role__c
            );

            candidate.put(
                'selectionDate',
                applicationRecord.Application_Date__c
            );

            HttpRequest request = new HttpRequest();

            request.setEndpoint(
                'callout:Recruitment_API/candidates'
            );

            request.setMethod('POST');

            request.setHeader(
                'Content-Type',
                'application/json'
            );

            request.setBody(
                JSON.serialize(candidate)
            );

            Http http = new Http();

            HttpResponse response = http.send(request);

            Integer statusCode = response.getStatusCode();

            if (statusCode == 200 ||
                statusCode == 201 ||
                statusCode == 204) {

                applicationRecord.Integration_Status__c = 'Sent';
                applicationRecord.Integration_Error__c = null;

                if (statusCode != 204 &&
                    String.isNotBlank(response.getBody())) {

                    Map<String, Object> responseData =
                        (Map<String, Object>)
                        JSON.deserializeUntyped(response.getBody());

                    if (responseData.containsKey('candidateId')) {

                        applicationRecord.External_Candidate_Id__c =
                            String.valueOf(
                                responseData.get('candidateId')
                            );
                    }
                }

            } else {

                applicationRecord.Integration_Status__c =
                    'Retry Required';

                applicationRecord.Integration_Error__c =
                    'HTTP ' +
                    statusCode +
                    ': ' +
                    response.getBody();
            }

        } catch (Exception e) {

            applicationRecord.Integration_Status__c =
                'Retry Required';

            applicationRecord.Integration_Error__c =
                e.getMessage();
        }

        update applicationRecord;
    }
}
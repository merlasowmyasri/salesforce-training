public class OfferPostProcessingJob implements Queueable {

    private Id applicationId;

    public OfferPostProcessingJob(Id applicationId) {
        this.applicationId = applicationId;
    }

    public void execute(QueueableContext context) {

        Application__c app = [
            SELECT Id,
                   Status__c,
                   Integration_Status__c
            FROM Application__c
            WHERE Id = :applicationId
            LIMIT 1
        ];

        app.Status__c = 'Selected';

        app.Integration_Status__c = 'Pending';

        update app;

        System.enqueueJob(
            new CandidateSyncQueueable(applicationId)
        );
    }
}
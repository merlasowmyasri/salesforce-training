public class ExternalPlacementSyncJob implements Queueable {

    private Id offerId;

    public ExternalPlacementSyncJob(Id offerId){
        this.offerId = offerId;
    }

    public void execute(QueueableContext context){

        System.debug('===== External Placement Sync Started =====');
        System.debug('Offer Id : ' + offerId);

        // Simulate External API Call
        System.debug('Sending offer details to external placement system...');

        System.debug('External Synchronization Successful');

        // Chain Next Queueable Job
        System.enqueueJob(new PlacementNotificationJob(offerId));

        System.debug('PlacementNotificationJob Submitted');
    }
}
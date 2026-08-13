public class PlacementNotificationJob implements Queueable {

    private Id offerId;

    public PlacementNotificationJob(Id offerId){
        this.offerId = offerId;
    }

    public void execute(QueueableContext context){

        System.debug('===== Placement Notification Started =====');
        System.debug('Offer Id : ' + offerId);

        // Simulate Notification
        System.debug('Preparing Email Notification...');
        System.debug('Preparing SMS Notification...');
        System.debug('Preparing Student Alert...');

        System.debug('===== Notification Processing Completed =====');
    }
}
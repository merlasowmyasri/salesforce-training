public class ExpiredJobScheduler implements Schedulable {

    public void execute(SchedulableContext sc) {

        System.debug('===== Scheduled Job Started =====');

        // Start the Batch Job
        Database.executeBatch(new PlacementCategoryBatch(), 10);

        System.debug('Batch Job Submitted Successfully');

    }
}
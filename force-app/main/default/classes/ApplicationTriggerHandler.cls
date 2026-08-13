public class ApplicationTriggerHandler {

    public static void beforeInsert(List<Application__c> applications) {
        ApplicationService.validateEligibility(applications);
    }

}
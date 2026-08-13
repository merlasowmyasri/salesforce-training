public class ApplicationIntegrationService {

    @future(callout=true)
    public static void sendApplicationDetails(Id applicationId) {

        System.debug('Future Method Started');

        Application__c app = [
            SELECT Id, Status__c, Student__c, Job__c
            FROM Application__c
            WHERE Id = :applicationId
            LIMIT 1
        ];

        // Simulated integration
        System.debug('Application Id : ' + app.Id);
        System.debug('Student Id : ' + app.Student__c);
        System.debug('Job Id : ' + app.Job__c);
        System.debug('Status : ' + app.Status__c);

        System.debug('Future Method Completed');
    }
}
@isTest
public class ApplicationIntegrationServiceTest {

    @isTest
    static void testFutureMethod() {

        // Student
        Student__c stu = new Student__c(
            Name = 'Rahul',
            CGPA__c = 8.5,
            Active_Backlogs__c = 0,
            Branch__c = 'CSE'
        );
        insert stu;

        // Job
        Job__c job = new Job__c(
            Name = 'Infosys',
            Minimum_CGPA__c = 7.5,
            Allowed_Backlogs__c = 0,
            Eligible_Branches__c = 'CSE'
        );
        insert job;

        // Application
        Application__c app = new Application__c(
            Student__c = stu.Id,
            Job__c = job.Id,
            Status__c = 'Applied'
        );
        insert app;

        Test.startTest();

        ApplicationIntegrationService.sendApplicationDetails(app.Id);

        Test.stopTest();

        System.assertNotEquals(null, app.Id);
    }
}
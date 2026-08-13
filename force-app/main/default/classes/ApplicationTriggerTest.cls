@isTest
public class ApplicationTriggerTest {

    @isTest
    static void testApplicationTrigger() {

        // Create Student
        Student__c stu = new Student__c();
        stu.Name = 'Rahul';
        stu.CGPA__c = 8.5;
        stu.Active_Backlogs__c = 0;
        stu.Branch__c = 'CSE';
        insert stu;

        // Create Job
        Job__c job = new Job__c();
        job.Name = 'TCS';
        job.Minimum_CGPA__c = 7.5;
        job.Allowed_Backlogs__c = 0;
        job.Eligible_Branches__c = 'CSE';
        insert job;

        // Create Application
        Application__c app = new Application__c();
        app.Student__c = stu.Id;
        app.Job__c = job.Id;
        app.Status__c = 'Applied';

        Test.startTest();
        insert app;
        Test.stopTest();

        System.assertNotEquals(null, app.Id);
    }
}
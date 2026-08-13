@isTest
public class OfferPostProcessingJobTest {

    @isTest
    static void testQueueableJob() {

        // Create Student
        Student__c stu = new Student__c(
            Name = 'Rahul',
            CGPA__c = 8.5,
            Active_Backlogs__c = 0,
            Branch__c = 'CSE'
        );
        insert stu;

        // Create Job
        Job__c job = new Job__c(
            Name = 'TCS',
            Minimum_CGPA__c = 7.5,
            Allowed_Backlogs__c = 0,
            Eligible_Branches__c = 'CSE'
        );
        insert job;

        // Create Application
        Application__c app = new Application__c(
            Student__c = stu.Id,
            Job__c = job.Id,
            Status__c = 'Applied'
        );
        insert app;

        Test.startTest();

        System.enqueueJob(new OfferPostProcessingJob(app.Id));

        Test.stopTest();

        // Verify record exists
        Application__c result = [
            SELECT Status__c
            FROM Application__c
            WHERE Id = :app.Id
        ];

        System.assertNotEquals(null, result);
        System.assertEquals('Selected', result.Status__c);
    }
}
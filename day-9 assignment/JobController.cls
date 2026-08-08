public with sharing class JobController {

    @AuraEnabled(cacheable=true)
    public static List<Job__c> getJobs() {

        Student__c student = [
            SELECT Id
            FROM Student__c
            LIMIT 1
        ];

        return ApplicationService.getEligibleJobs(student.Id);
    }


    @AuraEnabled
    public static Id submitApplication(Id jobId) {

        return ApplicationService.submitApplication(jobId);
    }
}
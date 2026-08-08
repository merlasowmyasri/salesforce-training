public class ApplicationService {

    public static void validateEligibility(List<Application__c> applications) {

        Set<Id> studentIds = new Set<Id>();
        Set<Id> jobIds = new Set<Id>();

        for (Application__c app : applications) {

            if (app.Student__c != null) {
                studentIds.add(app.Student__c);
            }

            if (app.Job__c != null) {
                jobIds.add(app.Job__c);
            }
        }

        Map<Id, Student__c> studentMap = new Map<Id, Student__c>(
            [
                SELECT Id, CGPA__c, Active_Backlogs__c, Branch__c
                FROM Student__c
                WHERE Id IN :studentIds
            ]
        );

        Map<Id, Job__c> jobMap = new Map<Id, Job__c>(
            [
                SELECT Id,
                       Minimum_CGPA__c,
                       Allowed_Backlogs__c,
                       Eligible_Branches__c,
                       Closing_Date__c
                FROM Job__c
                WHERE Id IN :jobIds
            ]
        );

        for (Application__c app : applications) {

            Student__c stu = studentMap.get(app.Student__c);
            Job__c job = jobMap.get(app.Job__c);

            if (stu == null || job == null) {
                continue;
            }

            if (
                job.Closing_Date__c != null &&
                job.Closing_Date__c < Date.today()
            ) {
                app.addError('Applications for this job are closed.');
                continue;
            }

            if (
                stu.CGPA__c == null ||
                job.Minimum_CGPA__c == null ||
                stu.CGPA__c < job.Minimum_CGPA__c
            ) {
                app.addError('CGPA is below minimum requirement.');
            }

            if (
                stu.Active_Backlogs__c == null ||
                job.Allowed_Backlogs__c == null ||
                stu.Active_Backlogs__c > job.Allowed_Backlogs__c
            ) {
                app.addError('Backlogs exceed the allowed limit.');
            }

            if (
                String.isBlank(stu.Branch__c) ||
                String.isBlank(job.Eligible_Branches__c) ||
                !job.Eligible_Branches__c
                    .toLowerCase()
                    .contains(stu.Branch__c.toLowerCase())
            ) {
                app.addError('Branch is not eligible.');
            }
        }
    }


    public static List<Job__c> getEligibleJobs(Id studentId) {

        Student__c student = [
            SELECT Id, CGPA__c, Active_Backlogs__c, Branch__c
            FROM Student__c
            WHERE Id = :studentId
            LIMIT 1
        ];

        List<Job__c> allJobs = [
            SELECT Id,
                   Name,
                   Minimum_CGPA__c,
                   Allowed_Backlogs__c,
                   Eligible_Branches__c,
                   Closing_Date__c
            FROM Job__c
            WHERE Closing_Date__c >= :Date.today()
        ];

        List<Job__c> eligibleJobs = new List<Job__c>();

        for (Job__c job : allJobs) {

            Boolean cgpaEligible =
                student.CGPA__c != null &&
                job.Minimum_CGPA__c != null &&
                student.CGPA__c >= job.Minimum_CGPA__c;

            Boolean backlogEligible =
                student.Active_Backlogs__c != null &&
                job.Allowed_Backlogs__c != null &&
                student.Active_Backlogs__c <= job.Allowed_Backlogs__c;

            Boolean branchEligible =
                !String.isBlank(student.Branch__c) &&
                !String.isBlank(job.Eligible_Branches__c) &&
                job.Eligible_Branches__c
                    .toLowerCase()
                    .contains(student.Branch__c.toLowerCase());

            if (
                cgpaEligible &&
                backlogEligible &&
                branchEligible
            ) {
                eligibleJobs.add(job);
            }
        }

        return eligibleJobs;
    }


    public static Id submitApplication(Id jobId) {

        if (jobId == null) {
            throw new AuraHandledException(
                'Job Id cannot be null.'
            );
        }

        Student__c student = [
            SELECT Id,
                   CGPA__c,
                   Active_Backlogs__c,
                   Branch__c
            FROM Student__c
            LIMIT 1
        ];

        Job__c job = [
            SELECT Id,
                   Name,
                   Minimum_CGPA__c,
                   Allowed_Backlogs__c,
                   Eligible_Branches__c,
                   Closing_Date__c
            FROM Job__c
            WHERE Id = :jobId
            LIMIT 1
        ];


        // Check closing date first
        if (
            job.Closing_Date__c != null &&
            job.Closing_Date__c < Date.today()
        ) {
            throw new AuraHandledException(
                'Applications for this job are closed.'
            );
        }


        // Check duplicate application
        List<Application__c> existingApplications = [
            SELECT Id
            FROM Application__c
            WHERE Student__c = :student.Id
            AND Job__c = :job.Id
            LIMIT 1
        ];

        if (!existingApplications.isEmpty()) {
            throw new AuraHandledException(
                'You have already applied for this job.'
            );
        }


        // Check CGPA
        if (
            student.CGPA__c == null ||
            job.Minimum_CGPA__c == null ||
            student.CGPA__c < job.Minimum_CGPA__c
        ) {
            throw new AuraHandledException(
                'CGPA is below the minimum requirement.'
            );
        }


        // Check backlogs
        if (
            student.Active_Backlogs__c == null ||
            job.Allowed_Backlogs__c == null ||
            student.Active_Backlogs__c > job.Allowed_Backlogs__c
        ) {
            throw new AuraHandledException(
                'Backlogs exceed the allowed limit.'
            );
        }


        // Check branch safely
        if (
            String.isBlank(student.Branch__c) ||
            String.isBlank(job.Eligible_Branches__c)
        ) {
            throw new AuraHandledException(
                'Student branch or eligible branch information is missing.'
            );
        }

        if (
            !job.Eligible_Branches__c
                .toLowerCase()
                .contains(student.Branch__c.toLowerCase())
        ) {
            throw new AuraHandledException(
                'Branch is not eligible for this job.'
            );
        }


        // Create Application
        Application__c application = new Application__c(
            Student__c = student.Id,
            Job__c = job.Id
        );

        insert application;

        return application.Id;
    }
}
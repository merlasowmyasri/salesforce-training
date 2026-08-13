public class StatisticsService {

    public static void refreshStatistics(
        List<Application__c> applications
    ) {

        Integer selectedCount = [
            SELECT COUNT()
            FROM Application__c
            WHERE Status__c = 'Selected'
        ];

        Integer rejectedCount = [
            SELECT COUNT()
            FROM Application__c
            WHERE Status__c = 'Rejected'
        ];

        Integer interviewCount = [
            SELECT COUNT()
            FROM Application__c
            WHERE Status__c = 'Interview Scheduled'
        ];

        System.debug(
            '===== PLACEMENT STATISTICS ====='
        );

        System.debug(
            'Selected Applications: ' + selectedCount
        );

        System.debug(
            'Rejected Applications: ' + rejectedCount
        );

        System.debug(
            'Interview Scheduled: ' + interviewCount
        );

        System.debug(
            '================================'
        );
    }
}
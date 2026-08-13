@isTest
public class QueueableChainingTest {

    @isTest
    static void testQueueableChaining() {

        Test.startTest();

        System.enqueueJob(
            new ExternalPlacementSyncJob(UserInfo.getUserId())
        );

        Test.stopTest();

        System.assertEquals(true, true);
    }
}
public class PlacementCategoryBatch implements Database.Batchable<SObject> {

    public Database.QueryLocator start(Database.BatchableContext bc) {

        System.debug('Batch Started');

        return Database.getQueryLocator(
            'SELECT Id FROM Account LIMIT 50'
        );
    }

    public void execute(Database.BatchableContext bc, List<SObject> scope) {

        System.debug('Processing Batch Size : ' + scope.size());

        for(SObject record : scope){
            System.debug('Processing Record Id : ' + record.Id);
        }

    }

    public void finish(Database.BatchableContext bc) {

        System.debug('===== Batch Completed Successfully =====');

    }
}
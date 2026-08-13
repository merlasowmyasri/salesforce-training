public with sharing class PrescriptionController {

    @AuraEnabled(cacheable=true)
    public static Prescription__c getPrescription(Id prescriptionId) {

        return [
            SELECT Id, Name, Medicine__c
            FROM Prescription__c
            WHERE Id = :prescriptionId
            LIMIT 1
        ];
    }
}
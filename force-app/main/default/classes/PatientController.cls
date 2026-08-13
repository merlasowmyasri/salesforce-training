/**
 * Controller used by the Patient List Lightning Web Component.
 */
public with sharing class PatientController {

    /**
     * Returns Patient records for display in the LWC.
     *
     * @return List of Patient__c records.
     */
    @AuraEnabled(cacheable=true)
    public static List<Patient__c> getPatients() {

        if (!Schema.sObjectType.Patient__c.isAccessible()) {
            return new List<Patient__c>();
        }

        return [
            SELECT Id, Name, Gender__c
            FROM Patient__c
            ORDER BY Name
        ];
    }
}
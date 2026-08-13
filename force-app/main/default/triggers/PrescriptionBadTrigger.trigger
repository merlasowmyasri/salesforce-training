trigger PrescriptionBadTrigger on Prescription__c (after insert) {

    Set<Id> prescriptionIds = new Set<Id>();

    // Collect all record IDs
    for(Prescription__c prescription : Trigger.new) {
        prescriptionIds.add(prescription.Id);
    }

    // Query all records with ONE SOQL query
    Map<Id, Prescription__c> prescriptionMap = new Map<Id, Prescription__c>(
        [
            SELECT Id, Name
            FROM Prescription__c
            WHERE Id IN :prescriptionIds
        ]
    );

    // Process all records
    for(Prescription__c prescription : Trigger.new) {

        Prescription__c currentPrescription =
            prescriptionMap.get(prescription.Id);

        System.debug('Prescription processed: ' + currentPrescription.Name);
    }

    System.debug('Total prescriptions processed: ' + Trigger.new.size());
}
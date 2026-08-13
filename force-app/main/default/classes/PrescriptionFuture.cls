public class PrescriptionFuture {

    @future
    public static void updatePrescription(Id prescriptionId) {

        Prescription__c prescription = [
            SELECT Id, Medicine__c
            FROM Prescription__c
            WHERE Id = :prescriptionId
            LIMIT 1
        ];

        prescription.Medicine__c = 'Updated Medicine';

        update prescription;
    }
}
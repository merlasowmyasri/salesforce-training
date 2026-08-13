public class AppointmentTriggerHandler {

    public static void preventDuplicateAppointments(List<Appointment__c> newAppointments) {

        Set<Id> patientIds = new Set<Id>();
        Set<Date> appointmentDates = new Set<Date>();

        for (Appointment__c app : newAppointments) {
            if (app.Patient__c != null && app.Appointment_Date__c != null) {
                patientIds.add(app.Patient__c);
                appointmentDates.add(app.Appointment_Date__c);
            }
        }

        if (patientIds.isEmpty() || appointmentDates.isEmpty()) {
            return;
        }

        for (Appointment__c existingApp : [
            SELECT Id, Patient__c, Appointment_Date__c
            FROM Appointment__c
            WHERE Patient__c IN :patientIds
        ]) {

            if (existingApp.Appointment_Date__c != null &&
                appointmentDates.contains(existingApp.Appointment_Date__c)) {

                for (Appointment__c newApp : newAppointments) {

                    if (newApp.Patient__c == existingApp.Patient__c &&
                        newApp.Appointment_Date__c != null &&
                        newApp.Appointment_Date__c == existingApp.Appointment_Date__c) {

                        newApp.addError(
                            'Duplicate appointment: This patient already has an appointment on this date.'
                        );
                    }
                }
            }
        }
    }


    public static void updatePatientStatus(List<Appointment__c> appointments) {

        Map<Id, String> patientStatusMap = new Map<Id, String>();

        for (Appointment__c app : appointments) {

            if (app.Patient__c != null && app.Status__c != null) {
                patientStatusMap.put(app.Patient__c, app.Status__c);
            }
        }

        if (patientStatusMap.isEmpty()) {
            return;
        }

        List<Patient__c> patientsToUpdate = [
            SELECT Id, Last_Visit_Status__c
            FROM Patient__c
            WHERE Id IN :patientStatusMap.keySet()
        ];

        for (Patient__c patient : patientsToUpdate) {
            patient.Last_Visit_Status__c = patientStatusMap.get(patient.Id);
        }

        update patientsToUpdate;
    }
}
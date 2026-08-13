trigger AppointmentTrigger on Appointment__c (before insert, after update) {

    if (Trigger.isBefore && Trigger.isInsert) {
        AppointmentTriggerHandler.preventDuplicateAppointments(Trigger.new);
    }

    if (Trigger.isAfter && Trigger.isUpdate) {
        AppointmentTriggerHandler.updatePatientStatus(Trigger.new);
    }
}
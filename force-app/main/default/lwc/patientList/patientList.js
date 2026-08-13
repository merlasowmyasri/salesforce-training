import { LightningElement, wire } from 'lwc';
import getPatients from '@salesforce/apex/PatientController.getPatients';

export default class PatientList extends LightningElement {

    @wire(getPatients)
    patients;

}
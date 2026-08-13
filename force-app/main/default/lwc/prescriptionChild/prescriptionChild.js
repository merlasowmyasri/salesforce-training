import { LightningElement, api, wire } from 'lwc';
import getPrescription from '@salesforce/apex/PrescriptionController.getPrescription';

export default class PrescriptionChild extends LightningElement {

    @api recordId;

    medicine;

    @wire(getPrescription, { prescriptionId: '$recordId' })
    prescriptionHandler({ data, error }) {

        if (data) {
            this.medicine = data.Medicine__c;
        }

        if (error) {
            console.error(error);
        }
    }

    handleChildButton() {

        const event = new CustomEvent('childmessage', {
            detail: 'Message from Child: Prescription received successfully!'
        });

        this.dispatchEvent(event);
    }
}
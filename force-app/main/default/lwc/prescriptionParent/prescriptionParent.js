import { LightningElement } from 'lwc';

export default class PrescriptionParent extends LightningElement {

    recordId = '';
    message = '';

    handleRecordIdChange(event) {
        this.recordId = event.target.value;
    }

    handleSendToChild() {
        console.log('Record Id sent to child:', this.recordId);
    }

    handleChildMessage(event) {
        this.message = event.detail;
    }
}
import { LightningElement, api } from 'lwc';

export default class StudentProfile extends LightningElement {

    @api recordId;

    objectApiName = 'Student__c';

    isSaving = false;

    successMessage;

    errorMessage;


    handleSuccess(event) {

        this.isSaving = false;

        this.errorMessage = undefined;

        this.successMessage =
            'Profile updated successfully.';


        this.dispatchEvent(
            new CustomEvent('profilesaved')
        );

    }


    handleError(event) {

        this.isSaving = false;

        this.successMessage = undefined;

        this.errorMessage =
            event?.detail?.message ||
            'We could not update your profile. Please review the fields and try again.';

    }

}
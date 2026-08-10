import { LightningElement, api } from 'lwc';

export default class StudentPortal extends LightningElement {

    @api recordId;


    handleProfileSaved() {

        const eligibleJobs =
            this.template.querySelector('c-eligible-jobs');


        if (eligibleJobs) {

            eligibleJobs.refreshJobs();

        }

    }

}
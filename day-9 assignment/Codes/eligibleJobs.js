import { LightningElement, wire } from 'lwc';

import getJobs from '@salesforce/apex/JobController.getJobs';
import submitApplication from '@salesforce/apex/JobController.submitApplication';

export default class EligibleJobs extends LightningElement {

    jobs = [];
    error;
    successMessage;
    isLoading = true;

    @wire(getJobs)
    wiredJobs({ data, error }) {

        if (data) {
            this.jobs = data;
            this.error = undefined;
            this.isLoading = false;

        } else if (error) {
            this.jobs = [];
            this.error =
                error?.body?.message ||
                error?.message ||
                'Unable to load jobs.';
            this.isLoading = false;
        }
    }

    handleApply(event) {

        const jobId = event.currentTarget.value;

        this.error = undefined;
        this.successMessage = undefined;

        if (!jobId) {
            this.error =
                'Selected Job Id was not received. Please refresh the page and try again.';
            return;
        }

        this.isLoading = true;

        submitApplication({
            jobId: jobId
        })
        .then(result => {

            this.successMessage =
                'Application submitted successfully.';

            this.error = undefined;
        })
        .catch(error => {

            this.error =
                error?.body?.message ||
                error?.message ||
                'Unable to submit application.';

            this.successMessage = undefined;
        })
        .finally(() => {

            this.isLoading = false;
        });
    }
}
import { LightningElement, wire, api } from 'lwc';
import { refreshApex } from '@salesforce/apex';

import getJobs from '@salesforce/apex/JobController.getJobs';
import submitApplication from '@salesforce/apex/JobController.submitApplication';

export default class EligibleJobs extends LightningElement {

    jobs = [];

    error;

    successMessage;

    isLoading = true;

    wiredJobsResult;


    @wire(getJobs)
    wiredJobs(result) {

        this.wiredJobsResult = result;

        const { data, error } = result;

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


    get hasJobs() {

        return this.jobs && this.jobs.length > 0;

    }


    get showEmptyState() {

        return !this.isLoading &&
               !this.error &&
               (!this.jobs || this.jobs.length === 0);

    }


    @api
    refreshJobs() {

        if (this.wiredJobsResult) {

            this.isLoading = true;

            refreshApex(this.wiredJobsResult)

                .finally(() => {

                    this.isLoading = false;

                });
        }
    }


    handleUpdateProfile() {

        this.dispatchEvent(
            new CustomEvent('updateprofile')
        );

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
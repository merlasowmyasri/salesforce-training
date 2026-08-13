import { LightningElement } from 'lwc';
import VISHNU_LOGO from '@salesforce/resourceUrl/VishnuLogo';

export default class PlacementHome extends LightningElement {

    // Student Information
    studentName = 'Merla Sowmya Sri';
    rollNumber = '23PA1A05F1';
    department = 'CSE';

    // Dashboard Numbers
    numberOfStudents = 120;
    numberOfCompanies = 20;
    numberOfJobs = 60;
    applicationsSubmitted = 10;

    // Logo
    logoUrl = VISHNU_LOGO;

}

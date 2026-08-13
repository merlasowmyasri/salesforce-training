# Student Placement Portal – Salesforce LWC Project

## Project Overview

The Student Placement Portal is a Salesforce-based web application developed using Lightning Web Components (LWC), Apex Classes, Apex Triggers, and Salesforce Lightning Experience.

The application provides a centralized platform for students to access placement-related information such as eligible jobs, student profiles, job cards, and portal features. The project demonstrates reusable LWC components, parent-child communication, Salesforce automation, backend Apex logic, metadata retrieval, deployment, and application verification.

## Objectives

- Develop a Student Placement Portal using Salesforce.
- Create reusable Lightning Web Components.
- Display eligible placement opportunities.
- Provide student profile information.
- Display job information using reusable Job Card components.
- Demonstrate parent-child communication between LWCs.
- Implement backend business logic using Apex.
- Implement automation using Apex Triggers.
- Retrieve Salesforce metadata using Salesforce CLI.
- Deploy LWC components successfully.
- Verify the application in Salesforce Lightning Experience.

## Technologies Used

| Technology | Purpose |
|---|---|
| Salesforce | Application platform |
| Lightning Web Components | Frontend UI development |
| Apex | Backend business logic |
| Apex Triggers | Salesforce automation |
| SOQL | Data querying |
| JavaScript | LWC functionality |
| HTML | Component structure |
| CSS | UI styling |
| Salesforce CLI | Metadata retrieval and deployment |
| Visual Studio Code | Development environment |
| Lightning App Builder | Salesforce page development |
| Git & GitHub | Source code management |

## Project Structure

HospitalLWC/
- force-app/
  - main/
    - default/
      - applications/
      - aura/
      - classes/
      - contentassets/
      - flexipages/
      - layouts/
      - lwc/
      - objects/
      - permissionsets/
      - staticresources/
      - tabs/
      - triggers/
- README.md

## Lightning Web Components

### 1. Eligible Jobs

Displays placement opportunities that are suitable for students and helps students identify eligible job opportunities.

### 2. Student Profile

Displays student information in a structured and user-friendly interface.

### 3. Patient List

Displays patient-related records in a list format and demonstrates Salesforce data retrieval.

### 4. Prescription Parent

Acts as the parent component for prescription-related functionality and communicates with the child component.

### 5. Prescription Child

Works with the Prescription Parent component and demonstrates parent-child communication in LWC.

### 6. Job Card

Displays individual job information using a reusable card-based interface.

### 7. Empty State

Displays an appropriate message when no records or data are available.

### 8. Student Portal

Provides the main student-facing portal interface for accessing placement-related functionality.

### 9. Placement Home

Acts as the main home/dashboard interface of the Student Placement Portal.

## LWC Components Available in Project

- eligibleJobs
- emptyState
- jobCard
- patientList
- placementHome
- prescriptionChild
- prescriptionParent
- studentPortal
- studentProfile

Each component contains the required HTML, JavaScript, and metadata configuration files. Some components also contain CSS and Jest test files.

## Apex Classes

The project contains multiple Apex Classes used for backend business logic, data processing, testing, scheduling, and placement-related functionality.

Important Apex Classes retrieved from the Salesforce org include:

- AccountHandler
- AccountTriggerHandler
- AccountUtils
- ApplicationIntegrationService
- ApplicationService
- ApplicationTriggerHandler
- AppointmentTriggerHandler
- CandidateSyncQueueable
- ContactAndLeadSearch
- ContactSearch
- ExpiredJobScheduler
- ExternalPlacementSyncJob
- JobController
- OfferPostProcessingJob
- PatientController
- PlacementCategoryBatch
- PlacementNotificationJob
- PrescriptionController
- PrescriptionFuture
- QueueableChainingTest
- RandomContactFactory
- StatisticsService
- StringListTest
- TestRestrictContactByName
- TestVerifyDate
- VerifyDate

These classes demonstrate Salesforce backend concepts such as business logic, database operations, SOQL, Queueable Apex, Batch Apex, Future methods, Scheduled Apex, integration processing, and testing.

## Apex Triggers

The following Apex Triggers were successfully retrieved:

- AccountAddressTrigger
- AccountTrigger
- ApplicationTrigger
- AppointmentTrigger
- ClosedOpportunityTrigger
- OrderEventTrigger
- PrescriptionBadTrigger
- RestrictContactByName

These triggers demonstrate Salesforce automation based on record events.

## Salesforce Features Used

- Salesforce Lightning Experience
- Lightning Web Components
- Apex Classes
- Apex Triggers
- SOQL
- Lightning App Builder
- FlexiPages
- Salesforce Objects
- Permission Sets
- Custom Tabs
- Static Resources
- Content Assets
- Salesforce CLI
- Metadata API
- Visual Studio Code

## Salesforce CLI Commands

### Retrieve Apex Classes

sf project retrieve start --target-org placement-dev --metadata ApexClass

Result: Status: Succeeded

### Retrieve Apex Triggers

sf project retrieve start --target-org placement-dev --metadata ApexTrigger

Result: Status: Succeeded

### Open Salesforce Org

sf org open --target-org placement-dev

The Salesforce org was successfully opened in Lightning Experience.

### Deploy LWC Components

sf project deploy start --target-org placement-dev --source-dir force-app/main/default/lwc

Result: Status: Succeeded

## Deployment Verification

The LWC components were successfully deployed to the Salesforce org.

Deployment Result:

Status: Succeeded

Target Org: placement-dev

Final Application Status: Working

Errors: None

## Testing and Verification

The application was opened in Salesforce Lightning Experience and the following components were manually verified.

| Component | Status |
|---|---|
| Eligible Jobs | Working |
| Student Profile | Working |
| Patient List | Working |
| Prescription Parent | Working |
| Prescription Child | Working |
| Job Card | Working |
| Empty State | Working |
| Student Portal | Working |
| Placement Home | Working |

Final verification result:

- Deployment: Successful
- Application: Working
- Errors: None
- Final Verification: Successful

## Project Questions and Answers

### Q1. What is Lightning Web Component?

Lightning Web Component (LWC) is Salesforce's modern framework for building reusable and efficient user interfaces using standard web technologies such as HTML, JavaScript, and CSS.

### Q2. Why was LWC used in this project?

LWC was used to create reusable, modular, efficient, and user-friendly interfaces for the Student Placement Portal.

### Q3. What is Apex?

Apex is Salesforce's strongly typed, object-oriented programming language used to implement server-side business logic and interact with Salesforce data.

### Q4. What is an Apex Trigger?

An Apex Trigger is a piece of Apex code that executes automatically before or after specific database operations such as insert, update, delete, or undelete.

### Q5. What is SOQL?

SOQL stands for Salesforce Object Query Language. It is used to retrieve records from Salesforce objects.

### Q6. What is the difference between LWC and Apex?

LWC is mainly used for creating the frontend user interface, while Apex is used for backend business logic and database operations.

### Q7. What is parent-child communication in LWC?

Parent-child communication allows data and events to be passed between Lightning Web Components. The Prescription Parent and Prescription Child components demonstrate this concept.

### Q8. What is Salesforce CLI?

Salesforce CLI is a command-line interface used by developers to interact with Salesforce orgs, retrieve metadata, deploy source code, and manage Salesforce development projects.

### Q9. How were Apex Classes retrieved?

The following command was used:

sf project retrieve start --target-org placement-dev --metadata ApexClass

The retrieval completed successfully.

### Q10. How were Apex Triggers retrieved?

The following command was used:

sf project retrieve start --target-org placement-dev --metadata ApexTrigger

The retrieval completed successfully.

### Q11. How were the LWC components deployed?

The following command was used:

sf project deploy start --target-org placement-dev --source-dir force-app/main/default/lwc

The deployment completed successfully with Status: Succeeded.

### Q12. How was the application tested?

The Student Placement Portal was opened in Salesforce Lightning Experience. Each LWC component was checked manually and the final application was verified without errors.

### Q13. What is the purpose of the Eligible Jobs component?

The Eligible Jobs component displays placement opportunities that are suitable for students.

### Q14. What is the purpose of the Job Card component?

The Job Card component provides a reusable card-based interface for displaying individual job information.

### Q15. What is the purpose of the Empty State component?

The Empty State component displays a suitable message when there are no records or data available.

### Q16. What is the main component of the application?

The Placement Home component acts as the main home/dashboard interface of the Student Placement Portal.

### Q17. Did the final deployment have any errors?

No. The final LWC deployment completed successfully with Status: Succeeded, and the application was verified without errors.

## Project Outcome

The Student Placement Portal successfully demonstrates the development and deployment of a Salesforce application using Lightning Web Components, Apex Classes, Apex Triggers, Salesforce CLI, and Lightning Experience.

The project demonstrates:

- Component-based UI development
- Salesforce backend development
- Apex programming
- Apex Triggers
- Parent-child LWC communication
- Salesforce CLI usage
- Metadata retrieval
- Source-based deployment
- Lightning Experience application development
- Application testing and verification

## Future Enhancements

Future versions of the application can include:

- Student login and authentication
- Job search and filtering
- Job application functionality
- Application status tracking
- Resume upload
- Company profiles
- Interview scheduling
- Placement notifications
- Admin dashboard
- Placement analytics
- Reports and dashboards
- Email notifications

## Final Project Status

| Item | Status |
|---|---|
| Salesforce Project | Completed |
| LWC Development | Completed |
| Apex Classes | Retrieved Successfully |
| Apex Triggers | Retrieved Successfully |
| LWC Deployment | Successful |
| Application Testing | Completed |
| Final Verification | Successful |
| Errors | None |
| Screenshots | Captured |
| Project Status | Completed |

## Final Submission Details

| Field | Details |
|---|---|
| Student Name | MERLA SOWMYA SRI |
| Roll No | 23PA1A05F1 |
| Branch | CSE |

## Conclusion

The Student Placement Portal project was successfully developed, deployed, tested, and verified using Salesforce Lightning Web Components and Apex.

All major LWC components were successfully deployed and verified in Salesforce Lightning Experience. The final application was tested without errors and the required screenshots were captured.

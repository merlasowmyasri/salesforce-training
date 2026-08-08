# Sprint-09-LWC – Student Placement Portal

---

## 1. Sprint Objective

The objective of Sprint-09 is to build an interactive Lightning Web Component that allows students to view eligible placement opportunities and apply for a selected job.

The sprint focuses on connecting the LWC with the existing Apex Controller and ApplicationService while keeping business logic in the service layer.

The main workflow implemented is:

**View Eligible Jobs → Select Job → Apply → Validate → Create Application → Show Result**

---

## 2. Business Problem

Students need a simple and user-friendly way to identify placement opportunities for which they are eligible and submit applications.

The Eligible Jobs component displays relevant job information such as:

- Job Name
- Minimum CGPA
- Allowed Backlogs
- Eligible Branches
- Closing Date
- Apply Button

The student can select a job and submit an application directly from the component.

---

## 3. Architecture

The application follows a layered Salesforce architecture:

**Student → LWC → Apex Controller → ApplicationService → Salesforce Database**

### LWC Layer

The Lightning Web Component is responsible for the user interface, displaying jobs, handling user actions and showing loading, success and error states.

### Apex Controller Layer

`JobController` acts as the bridge between the LWC and the backend service layer.

It provides methods for:

- Getting eligible jobs.
- Submitting an application.

### Service Layer

`ApplicationService` contains the main business logic.

It handles:

- Eligibility validation.
- Closing date validation.
- Duplicate application checking.
- CGPA validation.
- Backlog validation.
- Branch validation.
- Application creation.

### Database Layer

Salesforce stores the Student, Job and Application records.

The main principle followed is:

**The UI Requests. The Business Layer Decides.**

---

## 4. User Interaction Flow

The complete user interaction flow is:

**Student Opens Portal → Eligible Jobs Load → Student Clicks Apply → Job Id Is Received → Apex Is Called → ApplicationService Validates → Application Is Created → Result Is Returned → UI Shows Success/Error**

This makes the complete journey traceable from the student's action to the database operation.

---

## 5. Data Flow

The Eligible Jobs data flow is:

**Salesforce Job Data → ApplicationService.getEligibleJobs() → JobController.getJobs() → @wire → JavaScript → HTML → Job Cards**

The Apply data flow is:

**Apply Button → handleApply() → submitApplication(jobId) → JobController → ApplicationService → Application__c → Result → LWC**

The selected Job Id is passed from the Apply button to JavaScript and then to Apex.

---

## 6. Wire and Imperative Apex

Two different Apex invocation approaches are used based on the requirement.

### Wired Apex

The Eligible Jobs list is retrieved using the wire service because the component needs to receive and display job data reactively.

### Imperative Apex

The Apply operation is performed using imperative Apex because it is an explicit action initiated by the student.

Therefore:

**Get Eligible Jobs → Wire**

**Apply for Job → Imperative Apex**

This separation makes the component behaviour easier to understand and maintain.

---

## 7. Apply Workflow

The Apply workflow follows:

**Apply Button → Event Handler → Imperative Apex → JobController → ApplicationService → Application Created → Result Returned**

When the student clicks Apply:

1. The click event is handled by the LWC.
2. The selected Job Id is retrieved.
3. The LWC calls the Apex method imperatively.
4. `JobController` receives the Job Id.
5. `ApplicationService.submitApplication()` is called.
6. Student and Job details are retrieved.
7. Business validations are performed.
8. If all validations pass, an `Application__c` record is created.
9. The application Id is returned.
10. The LWC displays a success message.

---

## 8. Business Rules

The ApplicationService performs the important business validations before creating an application.

### Closing Date

Applications should not be submitted after the job closing date.

### Duplicate Application

The system checks whether the student has already applied for the selected job.

If a duplicate is found, the user receives:

**"You have already applied for this job."**

### CGPA Validation

The student's CGPA must meet or exceed the minimum CGPA required by the job.

### Backlog Validation

The student's active backlogs must be within the allowed backlog limit.

### Branch Validation

The student's branch must match one of the eligible branches specified for the job.

Keeping these validations in the service layer avoids duplicating business rules in JavaScript.

---

## 9. UI States

The component handles different states so that the student always receives meaningful feedback.

### Loading State

While the Apex request is being processed, a spinner or processing indication can be displayed.

### Success State

After successful application submission:

**"Application submitted successfully."**

### Error State

If the application fails, a meaningful message is displayed instead of a technical error.

Examples include:

- Applications for this job are closed.
- You have already applied for this job.
- CGPA is below the minimum requirement.
- Backlogs exceed the allowed limit.
- Branch is not eligible for this job.

### Empty State

If there are no eligible jobs, the component should clearly inform the student instead of showing an unexplained blank screen.

---

## 10. Duplicate Application Handling

Duplicate application handling is implemented in the backend.

Before creating an Application record, the service checks whether an Application already exists for the same Student and Job.

If an existing application is found, a new record is not created.

This provides data integrity even if the user accidentally clicks Apply more than once.

Frontend processing feedback can also reduce repeated clicks while the request is in progress.

---

## 11. Component Communication

The application can be divided into reusable components when the interface becomes larger.

For example:

**Parent Component → Job List → Job Card**

A parent component can pass job information to a child component using `@api`.

A child component can communicate an action such as Apply back to its parent using a custom event.

The communication pattern is:

**Parent → Child: Data / Properties**

**Child → Parent: Custom Events**

This keeps components loosely coupled and makes them easier to maintain and reuse.

---

## 12. Refresh and Stale Data

After a successful application, the database state changes.

For example, before applying the screen may show an Apply button. After the Application record is created, that displayed information may no longer represent the latest state.

Therefore, after a mutation, the application should consider which displayed information has become stale and refresh or update the required UI state.

Important principle:

**After Mutation, Ask What Became Stale.**

This helps maintain consistency between the Salesforce database and the user interface.

---

## 13. Engineering Decisions

### Business Logic in ApplicationService

Eligibility and application rules are kept in `ApplicationService` instead of JavaScript.

This provides a single source of truth and prevents different components from implementing different versions of the same business rule.

### Wire for Job Retrieval

Wired Apex is used for retrieving eligible jobs because the component needs the job data for display.

### Imperative Apex for Apply

Imperative Apex is used for the Apply operation because it is triggered directly by a student action.

### Backend Duplicate Protection

Duplicate validation is performed in the backend because frontend protection alone cannot guarantee data integrity.

### Clear UI States

Loading, success, error and empty states are considered so that the user always understands what is happening.

---

## 14. Challenges Faced

One challenge was connecting the LWC with the existing Apex and service-layer architecture without moving business logic into JavaScript.

Another challenge was correctly passing the selected Job Id from the UI to Apex.

Duplicate application handling was also important because the first application can be successfully created, while a second attempt for the same job must be rejected.

Testing different UI states also helped understand how the component behaves when Apex succeeds, fails or takes time to respond.

---

## 15. What I Learned

Through this sprint, I learned:

- How to create an interactive Lightning Web Component.
- How to handle button click events.
- How to retrieve the selected Job Id.
- How to use the LWC wire service.
- How to call Apex imperatively.
- How LWC communicates with Apex.
- How Apex Controller connects the UI with the service layer.
- How to reuse existing service-layer logic.
- Why business logic should not be duplicated in JavaScript.
- How to handle loading, success, error and empty states.
- How duplicate applications can be prevented.
- How parent and child components communicate.
- How custom events are used for child-to-parent communication.
- Why data can become stale after a database mutation.
- How to trace a complete request from the UI to the database and back.

---

## 16. Sprint Retrospective

### What does LWC add to the architecture?

LWC adds the user-facing interaction layer. It allows students to interact with the existing Apex, service and database architecture through Salesforce.

### Which was harder: writing the component or deciding responsibility?

Deciding responsibility was more important because putting business logic in the wrong layer can make the application difficult to maintain.

For example, eligibility rules belong in ApplicationService, while the LWC mainly handles presentation and interaction.

### Where could business logic be duplicated?

CGPA, backlog and branch eligibility could easily be implemented again in JavaScript. This was avoided by keeping the rules in ApplicationService.

### What happens if every component retrieves its own information?

It can lead to unnecessary server calls, duplicated logic and inconsistent data. Shared information should be retrieved by the appropriate component and passed to child components when required.

### What did I learn from designing different UI states?

A successful screen alone is not enough. A complete interface should handle loading, success, empty and error situations so that the user always knows what is happening.

### Can I trace one Apply click?

Yes.

**Student → LWC → Event Handler → Imperative Apex → JobController → ApplicationService → Validation → Application__c → Result → LWC → Student**

---

## 17. Debugging Approach

If the Apply button does not work, the complete flow can be checked step by step:

1. Check whether the click event is triggered.
2. Check whether `handleApply()` executes.
3. Check whether the correct Job Id is received.
4. Check whether the Apex method is called.
5. Check whether `JobController` executes.
6. Check whether `ApplicationService` executes.
7. Check whether validation passes.
8. Check whether the Application record is created.
9. Check whether Apex returns the result.
10. Check whether the LWC updates its UI state.

This provides a systematic debugging approach instead of changing code randomly.

---

## 18. Definition of Done

The Apply workflow is complete when:

- The correct Job Id reaches JavaScript.
- Apex receives the correct Job Id.
- Existing ApplicationService logic is reused.
- Business rules are not duplicated in JavaScript.
- Duplicate applications are prevented.
- Success is clearly communicated.
- Failure is clearly communicated.
- Accidental repeated actions are considered.
- The complete request can be traced from the Apply button to the database.

---

## 19. Screenshots / Evidence

The following screenshots will be included as evidence in the repository:

- Eligible Jobs screen.
- Job details with Apply button.
- Loading / Processing state.
- Successful application message.
- Duplicate application / Error state.

These screenshots demonstrate the working behaviour of the Sprint-09 LWC implementation.

---

## 20. Student Details

| Field | Details |
|---|---|
| Name | Merla Sowmya Sri |
| Roll No | 23PA1A05F1 |
| Branch | CSE |
| Project | Student Placement Portal |
| Assignment | Day-9 Assignment |

## 21. Repository Structure

The final GitHub repository contains the README, screenshots and complete Salesforce source code.

```text
Sprint-09-LWC/
│
├── README.md
├── screenshots/
│
└── force-app/
    └── main/
        └── default/
            ├── classes/
            ├── triggers/
            ├── objects/
            └── lwc/
                └── eligibleJobs/
                    ├── eligibleJobs.html
                    ├── eligibleJobs.js
                    └── eligibleJobs.js-meta.xml

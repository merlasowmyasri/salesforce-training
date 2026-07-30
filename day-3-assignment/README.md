# Salesforce Placement Management System

## Day 3 – Automation, Validation Rules, Flow, Trigger & Mini Project

---

# 1. Project Overview

This project is a Salesforce Placement Management System developed to manage student placement applications and automate important placement-related business processes.

The main purpose of this project is to reduce manual work for the Placement Cell, maintain data quality, prevent invalid applications, notify the Placement Officer automatically, and create Offer Letter records when students are selected.

## Salesforce Features Used

- Salesforce CRM
- Custom Objects
- Custom Fields
- Record-Triggered Flow
- Before-Save Flow
- After-Save Flow
- Assignment Element
- Decision Element
- Create Records
- Email Action
- Validation Rules
- Flow Debugging
- Apex Triggers
- Salesforce Order of Execution
- Declarative Automation
- Git
- GitHub

---

# 2. Business Scenario

The Placement Cell manages student applications for different job opportunities.

The main objects involved in the Placement Management System are:

- Student
- Job
- Application
- Offer Letter

An Application connects a Student with a Job and stores information such as:

- Student
- Job
- Application Date
- Status
- CGPA

The Placement Cell provided the following requirements:

1. Whenever a student submits an application, an email should be sent to the Placement Officer.
2. Whenever an application is created, the Application Date should automatically be populated.
3. If the student has already applied, the system should prevent the duplicate application.
4. If the student's CGPA is below the minimum requirement, the application should be rejected.
5. Whenever the Status changes to Selected, an Offer Letter record should automatically be created.

---

# 3. Part 1 – Conceptual Questions

## Q5. Can a Validation Rule update another field? Why or why not?

No.

A Validation Rule cannot update another field.

A Validation Rule is used to check whether the data entered into a record is valid.

If the Validation Rule formula evaluates to TRUE, Salesforce prevents the record from being saved and displays an error message.

For example, suppose the minimum CGPA required for a Job is 7.5 and the student's CGPA is 6.5.

The Validation Rule can check:

Student CGPA < Job Minimum CGPA

If this condition is TRUE, Salesforce prevents the Application from being saved.

However, a Validation Rule cannot automatically change:

Status = Rejected

If a field needs to be automatically updated, Flow or Apex should be used.

### Simple Difference

Validation Rule:

Data entered  
→ Check condition  
→ Invalid  
→ Prevent Save

Flow:

Record Created/Updated  
→ Flow Runs  
→ Field Updated

---

## Q6. Which executes first: Validation Rule, Flow, or Trigger?

Salesforce has a detailed Order of Execution, so it is not correct to simply say that every automation always executes in the order:

Validation Rule → Flow → Trigger.

Different types of Flow and Trigger execute at different stages.

A simplified understanding is:

Record Save Request  
→ Before-Save Flow  
→ Before Trigger  
→ Validation  
→ Record Save  
→ After Trigger  
→ After-Save Flow  
→ Other Automation / Commit Processing

The exact Salesforce Order of Execution contains additional steps.

Important points:

- Before-Save Flow runs before the record is saved.
- Before Trigger runs before the record is saved.
- Validation Rules validate the record before the transaction is committed.
- After Trigger runs after the record is saved.
- After-Save Flow runs after the record is saved.

For an interview, I would explain that Salesforce has a detailed Order of Execution and that the exact execution order depends on the type of automation being used.

---

## Q7. What is a Record-Triggered Flow?

A Record-Triggered Flow is a Flow that automatically runs when a Salesforce record is created, updated, or deleted according to the configured trigger conditions.

For example:

Application Status changes to Selected  
→ Record-Triggered Flow  
→ Create Offer Letter

Another example:

Application Created  
→ Record-Triggered Flow  
→ Populate Application Date  
→ Send Email Notification

---

# 4. Part 2 – Business Scenario

## Requirement 1 – Send Email to Placement Officer

Whenever a student submits an Application, an email should be sent to the Placement Officer.

### Solution

Use a Record-Triggered Flow with an Email Action.

### Process

Application Created  
→ Record-Triggered Flow  
→ Email Action  
→ Placement Officer receives notification

### Example Email

**Subject:**

New Student Application Submitted

**Body:**

A new student application has been submitted.

Please review the new application in Salesforce.

### Why Flow?

Flow can automatically send email notifications without requiring Apex code.

---

## Requirement 2 – Automatically Populate Application Date

Whenever an Application is created, the Application Date should automatically be populated.

### Solution

Use a Record-Triggered Flow.

For a simple update to the same record, a Before-Save Flow is appropriate.

### Process

Application Created  
→ Before-Save Flow  
→ Application Date = Current Date  
→ Record Saved

For example, if an Application is created on 30 July 2026:

Application Date = 30 July 2026

### Why Flow?

This is a simple automatic field update and Flow can handle it without Apex.

---

## Requirement 3 – Prevent Duplicate Applications

If a student has already applied for the same Job, the system should prevent another duplicate Application.

### Business Rule

The same Student should not be able to apply for the same Job more than once.

Example:

Existing Application:

Student = Student A  
Job = Salesforce Developer

If Student A tries to create another Application for Salesforce Developer, the system should prevent the duplicate.

### Possible Salesforce Solutions

Depending on the data model, duplicate prevention can be implemented using:

- Duplicate Rules
- Unique Field Strategy
- Flow-based Duplicate Checking
- Validation Rule when the required values are available

### Why?

Duplicate Applications represent invalid business data, so the system should prevent them from being accepted.

---

## Requirement 4 – Reject Low CGPA

If the student's CGPA is below the minimum CGPA required for the Job, the Application should be rejected.

### Solution

Use a Validation Rule when the required values are available to the formula.

Example:

Student CGPA = 6.5

Job Minimum CGPA = 7.5

Condition:

6.5 < 7.5

The condition is TRUE, so Salesforce prevents the Application from being saved.

### Error Message

Student CGPA must be greater than or equal to the Job's minimum CGPA.

### Why Validation Rule?

Validation Rules are specifically designed to prevent invalid data from being saved.

---

## Requirement 5 – Create Offer Letter When Status Becomes Selected

Whenever the Application Status changes to Selected, an Offer Letter record should automatically be created.

### Solution

Use an After-Save Record-Triggered Flow.

### Process

Application Updated  
→ Status = Selected  
→ After-Save Flow  
→ Create Records  
→ Offer Letter Created

Example:

Application = APP-0001  
Student = Student A  
Status = Selected

The Flow automatically creates:

Offer Letter  
Offer Letter Number = OFF-0001  
Application = APP-0001

### Why Flow?

Flow can create related records using the Create Records element.

---

# 5. Part 3 – Design Challenge

| Requirement | Validation Rule | Flow | Trigger | Recommended Solution | Reason |
|---|---|---|---|---|---|
| Reject duplicate applications | Possible | Possible | Possible | Duplicate Rule / Unique Design / Flow | Prevent duplicate data |
| Auto-fill Application Date | No | Yes | Possible | Flow | Simple automatic field update |
| Send Email | No | Yes | Possible | Flow | Flow supports email automation |
| Reject low CGPA | Yes | Possible | Possible | Validation Rule | Prevent invalid data |
| Create Offer Letter record | No | Yes | Possible | Flow | Flow can create related records |

## Design Principle

The simplest Salesforce automation tool that satisfies the requirement should be selected.

For simple declarative automation, Flow and Validation Rules should generally be preferred.

Apex Trigger should be used when the business logic is too complex for declarative automation.

---

# 6. Part 4 – Hands-on Assignment

## Objective

Build a Record-Triggered Flow that:

1. Automatically sets Application Date when a new Application is created.
2. Sends a confirmation email to the Placement Officer.
3. Demonstrates successful execution.

---

## Step 1 – Open Flow Builder

Salesforce Navigation:

Setup  
→ Quick Find  
→ Flows  
→ New Flow

Select:

Record-Triggered Flow

Click:

Create

---

## Step 2 – Configure Start Element

Object:

Application

Trigger:

A record is created

The Flow should run when a new Application record is created.

For the email action, an After-Save Flow is appropriate.

### Start Element Process

Application Created  
→ Start  
→ Flow Begins

---

## Step 3 – Assignment Element

Create an Assignment Element.

The purpose is to assign the current date to the Application Date field.

Conceptually:

$Record.Application_Date__c = TODAY()

The exact API name depends on the actual Application Date field in the Salesforce org.

### Assignment Process

Application Created  
→ Assignment  
→ Application Date = Current Date

---

## Step 4 – Email Action

Add an Email Action.

Configure the email to notify the Placement Officer.

### Example

**To:**

Placement Officer Email Address

**Subject:**

New Student Application Submitted

**Body:**

A new student application has been submitted.

Please review the application in Salesforce.

### Email Process

Application Created  
→ Flow  
→ Email Action  
→ Placement Officer

---

## Step 5 – Save and Activate Flow

Example Flow Label:

Application Submission Automation

Click:

Save

Then:

Activate

---

## Step 6 – Test the Flow

Create a new Application record.

Verify:

- Application Date is populated.
- Flow executes successfully.
- Email is sent to the Placement Officer.

### Expected Result

Application Created  
→ Flow Triggered  
→ Application Date Populated  
→ Email Action Executed  
→ Flow Completed Successfully

---

## Important Note About Success Message

A Record-Triggered Flow normally runs automatically in the background.

It does not directly display a Screen Flow message to the user.

If an actual on-screen message such as:

Application submitted successfully!

is required, a Screen Flow is more appropriate.

For this Record-Triggered Flow assignment, successful execution can be demonstrated using:

- Flow Debug result
- Successful record creation/update
- Email received
- Successful Flow execution

---

# 7. Part 5 – Validation Rule Challenge

## Validation Rule 1 – Student CGPA Must Be Greater Than or Equal to Job Minimum CGPA

### Requirement

Student CGPA must be greater than or equal to the minimum CGPA required by the Job.

### Logic

Student CGPA < Job Minimum CGPA

If TRUE:

Application is rejected.

### Formula Example

The exact API names depend on the Salesforce org.

Conceptual formula:

AND(
    NOT(ISBLANK(Student__c)),
    NOT(ISBLANK(Job__c)),
    Student__r.CGPA__c < Job__r.Minimum_CGPA__c
)

### Error Message

Student CGPA must be greater than or equal to the Job's minimum CGPA.

### Example

Student CGPA = 6.5

Minimum CGPA = 7.5

Because:

6.5 < 7.5

the Validation Rule evaluates to TRUE and Salesforce prevents the record from being saved.

---

# 8. Validation Rule 2 – Application Date Cannot Be After Job Closing Date

### Requirement

Application Date cannot be later than Job Closing Date.

### Logic

Application Date > Job Closing Date

### Formula Example

AND(
    NOT(ISBLANK(Application_Date__c)),
    NOT(ISBLANK(Job__c)),
    Application_Date__c > Job__r.Closing_Date__c
)

### Error Message

Application Date cannot be after the Job Closing Date.

### Example

Application Date = 30 July 2026

Job Closing Date = 25 July 2026

Since the Application Date is after the Closing Date, the Application is invalid.

---

# 9. Validation Rule 3 – Mandatory Fields Cannot Be Left Blank

### Requirement

Important fields such as Student, Job, and Application Date should not be blank.

### Formula

OR(
    ISBLANK(Student__c),
    ISBLANK(Job__c),
    ISBLANK(Application_Date__c)
)

### Error Message

Student, Job, and Application Date are required.

### Explanation

ISBLANK() checks whether a field is empty.

OR() returns TRUE when at least one condition is TRUE.

Therefore, if any required field is blank, Salesforce prevents the record from being saved.

---

# 10. Important Note About Validation Rule Formulas

The API names shown in this documentation are examples.

The actual Salesforce org may have different API names.

Verify the actual API names from:

Setup  
→ Object Manager  
→ Application  
→ Fields & Relationships

Example API names may be:

- Student__c
- Job__c
- CGPA__c
- Application_Date__c
- Minimum_CGPA__c
- Closing_Date__c

The formulas must be adjusted according to the actual fields and relationships in the Salesforce org.

---

# 11. Part 6 – Trigger vs Flow Debate

## 1. Update a field automatically

**Answer: Flow**

Example:

Application Created  
→ Flow  
→ Application Date = TODAY()

### Why?

A simple field update can easily be implemented using Flow without writing Apex.

---

## 2. Create a related record

**Answer: Flow**

Example:

Application Status = Selected  
→ Flow  
→ Create Offer Letter

### Why?

Flow supports the Create Records element.

---

## 3. Send an email notification

**Answer: Flow**

Example:

Application Created  
→ Flow  
→ Email Action  
→ Placement Officer

### Why?

Flow supports email-related actions and notifications.

---

## 4. Call an external REST API

**Answer: Apex**

Example:

Salesforce  
→ Apex  
→ HTTP Callout  
→ External REST API

### Why?

Apex provides programmatic control over HTTP callouts, request handling, response processing, authentication patterns, and error handling.

Flow can also participate in integrations through actions and Invocable Apex, but Apex is often preferred when the integration logic is complex.

---

## 5. Perform complex calculations involving multiple objects

**Answer: Apex**

### Why?

Apex is appropriate when calculations involve:

- Complex business logic
- Multiple objects
- Large datasets
- Advanced algorithms
- Custom processing

---

## 6. Process 10,000 imported records

**Answer:**

The correct choice depends on the complexity of the automation.

For simple declarative automation, Flow may be considered.

For complex high-volume processing, Apex with proper bulkification and potentially asynchronous processing may be more appropriate.

### Important Point

Automation should always be designed for bulk processing.

We should not assume that only one record will be processed.

---

# 12. Part 7 – Mini Project Enhancement

The Placement Management System was enhanced with the following features.

## 1. Record-Triggered Flow for Application Date

When a new Application is created, Application Date is automatically populated.

Application Created  
→ Record-Triggered Flow  
→ Application Date

---

## 2. Validation Rules for Data Quality

Validation Rules are used to prevent invalid data.

Examples:

CGPA < Minimum CGPA

Application Date > Job Closing Date

Mandatory Field is Blank

---

## 3. Automatic Email Notification

When an Application is submitted:

Application Created  
→ Flow  
→ Email Action  
→ Placement Officer

---

## 4. Offer Letter Record Creation

When Application Status changes to Selected:

Application Updated  
→ Status = Selected  
→ After-Save Record-Triggered Flow  
→ Create Records  
→ Offer Letter

---

# 13. Offer Letter Flow

A separate Record-Triggered Flow can be used for the Offer Letter requirement.

### Object

Application

### Trigger

A record is updated

### Condition

The Flow should run when Application Status becomes:

Selected

### Flow Structure

Application Updated  
→ Status = Selected?  
→ YES  
→ Create Offer Letter  
→ End

The Offer Letter should be related to the Application that caused the Flow to run.

---

# 14. Part 8 – Debugging Challenge

A developer created the following solution:

Trigger updates Status.

Flow updates Status.

Workflow updates Status.

## Q1. What problem might occur?

Multiple automation tools updating the same field can cause:

- Conflicting updates
- Unexpected results
- Difficult debugging
- Difficult maintenance
- Unnecessary database operations
- Recursive automation
- Performance issues

Example:

Trigger  
→ Updates Status  
→ Record Update  
→ Flow Runs  
→ Flow Updates Status  
→ Another Automation Runs

---

## Q2. Could automation repeatedly execute?

Yes.

If one automation updates a record and that update satisfies the conditions of another automation, the other automation can execute.

If the automation keeps updating the record and re-triggering itself or other automation, repeated execution or recursion can occur.

Therefore, automation should have clear entry criteria and avoid unnecessary updates.

---

## Q3. How would you redesign this solution?

I would avoid using multiple automation tools to update the same field unless there is a specific business reason.

A better design would be:

Simple same-record field update  
→ Before-Save Flow

Email / Related Record Creation  
→ After-Save Flow

Complex Business Logic  
→ Apex

### Recommended Design

Application  
→ Record-Triggered Flow  
→ Decision

New Application  
→ Set Application Date  
→ Send Email

Status = Selected  
→ Create Offer Letter

This design reduces unnecessary automation overlap and makes the system easier to maintain and debug.

---

# 15. Part 9 – Interview Questions and Answers

## Q1. What is the difference between Workflow, Process Builder, and Flow?

### Workflow Rules

Workflow Rules are older Salesforce automation tools.

They can perform actions such as:

- Field Updates
- Email Alerts
- Tasks
- Outbound Messages

They are simple but limited compared with Flow.

### Process Builder

Process Builder provided more capabilities than Workflow Rules.

It supported:

- Record Updates
- Record Creation
- Email Actions
- Other automation actions

Salesforce has moved toward Flow as the primary declarative automation platform.

### Flow

Flow is Salesforce's modern declarative automation platform.

Flow supports:

- Create Records
- Update Records
- Delete Records
- Get Records
- Decisions
- Loops
- Assignments
- Email Actions
- Record-Triggered Automation
- Screen Flows
- Subflows
- Apex Actions

### Summary

Workflow Rules  
→ Process Builder  
→ Flow

Flow is preferred for new automation.

---

## Q2. Why is Flow replacing Workflow Rules?

Flow provides more functionality and flexibility.

Flow can:

- Create records
- Update records
- Delete records
- Get records
- Make decisions
- Loop through records
- Send emails
- Call Apex
- Use subflows
- Build screen-based processes
- Automate record-based business logic

Therefore, Flow is the preferred modern Salesforce automation tool.

---

## Q3. What is a Record-Triggered Flow?

A Record-Triggered Flow automatically executes when a Salesforce record is created, updated, or deleted according to configured conditions.

Example:

Application Status = Selected  
→ Record-Triggered Flow  
→ Create Offer Letter

---

## Q4. What are Before-Save and After-Save Flows?

### Before-Save Flow

A Before-Save Flow runs before the record is saved.

It is mainly used for updating fields on the triggering record.

Example:

Application Created  
→ Before-Save Flow  
→ Application Date = TODAY()

### Advantages

- Fast
- Efficient
- Suitable for same-record field updates

### After-Save Flow

An After-Save Flow runs after the record is saved.

It is used for actions such as:

- Creating related records
- Sending emails
- Updating other records
- Calling actions

Example:

Application Status = Selected  
→ After-Save Flow  
→ Create Offer Letter

---

## Q5. When should Apex be preferred over Flow?

Apex should be preferred when:

- Business logic is highly complex.
- Advanced calculations are required.
- Complex external integrations are required.
- REST/SOAP callouts are needed.
- Processing requires custom code.
- Large-volume processing requires specialized handling.
- Flow cannot efficiently implement the requirement.

For simple automation, Flow should generally be considered first.

---

## Q6. Can Flow call Apex?

Yes.

Flow can call Apex using an Apex Action.

Architecture:

Flow  
→ Apex Action  
→ Apex Logic  
→ Result  
→ Flow

This allows declarative automation and programmatic logic to work together.

---

## Q7. What are the advantages of declarative automation?

Advantages include:

- Less code
- Faster development
- Easier maintenance
- Easier debugging
- Easier configuration
- Reduced development effort
- Admin-friendly development
- Easier business process changes

Examples:

- Flow
- Validation Rules
- Approval Processes

---

## Q8. Explain one Flow that you built.

### Interview Answer

I built a Record-Triggered Flow for the Placement Management System.

The Flow automates the student application process.

When an Application is created, the automation handles the Application Date and sends an email notification to the Placement Officer.

I also implemented an After-Save Flow for the selection process. When the Application Status becomes Selected, the Flow automatically creates an Offer Letter record related to the Application.

The overall process is:

Application Created  
→ Record-Triggered Flow  
→ Application Date  
→ Email Notification

For selected students:

Application Status = Selected  
→ After-Save Flow  
→ Create Offer Letter

I tested the Flow using Salesforce Flow Debug and verified the resulting records.

---

## Q9. Explain one Validation Rule that you created.

### Interview Answer

I created a Validation Rule to ensure that the student's CGPA is greater than or equal to the minimum CGPA required by the Job.

The logic compares the Student CGPA with the Job Minimum CGPA.

If the student's CGPA is lower than the required CGPA, the Validation Rule returns TRUE and Salesforce prevents the Application from being saved.

For example:

Student CGPA = 6.5

Minimum CGPA = 7.5

Since:

6.5 < 7.5

the Application is rejected.

This helps maintain data quality and prevents ineligible applications.

---

## Q10. If given the choice, why did you use Flow instead of Apex?

### Interview Answer

I used Flow instead of Apex because the requirements were mainly declarative automation tasks such as updating a field, sending an email, and creating a related Offer Letter record.

Flow can handle these requirements without writing custom Apex code.

This makes the solution easier to develop, maintain, and modify.

I would choose Apex when the requirement involves complex business logic, advanced calculations, complex integrations, or processing that cannot be implemented efficiently using Flow.

---

# 16. Additional Interview Questions

## Can a Validation Rule update a field?

No.

Validation Rules cannot update fields.

They can only validate data and prevent records from being saved when the validation condition is TRUE.

---

## Can Flow create records?

Yes.

Flow can create records using the Create Records element.

---

## Can Flow send emails?

Yes.

Flow can send email notifications using email-related Flow actions.

---

## What is Bulkification?

Bulkification means designing automation to efficiently process multiple records in a single transaction.

For example, Apex should not be written assuming that only one record will be processed.

It should be designed to handle:

- 1 record
- 100 records
- 200 records
- 1000+ records

efficiently.

Bulkification is especially important for Apex Triggers.

---

# 17. Part 10 – Learning Resources

The following topics were used to understand and complete this project:

- Build Flows with Flow Builder
- Record-Triggered Flows
- Validation Rules
- Salesforce Automation
- Flow Debugging
- Apex Fundamentals
- Salesforce Order of Execution

Salesforce Trailhead was used as the main learning resource for Salesforce concepts.

---

# 18. Key Learnings

Through this project, I learned:

1. What Validation Rules are.
2. How Validation Rules prevent invalid data.
3. Why Validation Rules cannot update fields.
4. What Record-Triggered Flows are.
5. Difference between Before-Save and After-Save Flows.
6. How to create a Record-Triggered Flow.
7. How to configure a Start Element.
8. How to use an Assignment Element.
9. How to automatically populate Application Date.
10. How to send an email using Flow.
11. How to create related records using Flow.
12. How to automatically create an Offer Letter.
13. How to create Validation Rules.
14. How to validate CGPA.
15. How to validate Application Date.
16. How to validate mandatory fields.
17. Difference between Flow and Apex Trigger.
18. Difference between Workflow, Process Builder, and Flow.
19. Salesforce Order of Execution basics.
20. How automation recursion can occur.
21. How to debug Flow execution.
22. How to choose the appropriate Salesforce automation tool for a requirement.
23. How to document Salesforce development work using GitHub.

---

# 19. Final Automation Architecture

PLACEMENT MANAGEMENT SYSTEM
        |
        ↓
APPLICATION
        |
        ├── Validation Rules
        |       |
        |       └── Data Quality
        |
        ├── Record-Triggered Flow
        |       |
        |       ├── Application Date
        |       |
        |       └── Email Notification
        |
        └── Application Status
                |
                └── Status = Selected
                        |
                        ↓
                After-Save Flow
                        |
                        ↓
                Create Offer Letter

---

# 20. Complete Business Process

Student
→ Submit Application
→ Check Mandatory Fields
→ Check Duplicate Application
→ Check CGPA Requirement
→ Check Application Date
→ Valid Application
→ Application Date Automatically Populated
→ Placement Officer Notified
→ Application Reviewed
→ Status Changed to Selected
→ After-Save Flow Triggered
→ Offer Letter Automatically Created

---

# 21. Conclusion

The Placement Management System demonstrates how Salesforce automation can be used to solve real-world business requirements.

Validation Rules are used to maintain data quality and prevent invalid records.

Record-Triggered Flows are used to automate processes such as:

- Automatically populating Application Date
- Sending email notifications
- Creating Offer Letter records

Apex is considered when requirements involve complex logic, advanced calculations, integrations, or processing that cannot be handled efficiently using declarative automation.

This project demonstrates the practical use of Salesforce Flow, Validation Rules, automation design, debugging, and Salesforce development best practices.

---


# 23. Screenshots







---

# 24. GitHub Project Structure

The final project structure is:

placement-management-system/
│
├── README.md
│
└── screenshots/
    ├── 01-start-element.png
    ├── 02-assignment-element.png
    ├── 03-email-action.png
    ├── 04-successful-execution.png
    ├── 05-cgpa-validation-rule.png
    ├── 06-application-date-validation-rule.png
    ├── 07-mandatory-fields-validation-rule.png
    ├── 08-offer-letter-flow.png
    ├── 09-offer-letter-record.png
    └── 10-flow-canvas.png

---

# Final Submission

**Submitted By:** Merla Sowmya Sri

**Roll Number:** 23PA1A05F1

**Project:** Salesforce Placement Management System

**Day:** Day 3

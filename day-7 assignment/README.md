# Day 7 – Designing Bulk-Safe Apex and Triggers

## Objective
Implemented a bulk-safe Apex Trigger architecture to validate student eligibility for job applications using Salesforce best practices.

## Custom Objects
- Student
- Job
- Application

## Custom Fields

### Student
- CGPA
- Active Backlogs
- Branch

### Job
- Minimum CGPA
- Allowed Backlogs
- Eligible Branches

### Application
- Student (Lookup)
- Job (Lookup)
- Status (Picklist)

## Components Developed
- ApplicationTrigger
- ApplicationTriggerHandler
- ApplicationService
- ApplicationTriggerTest

## Features Implemented
- Bulk-safe Apex Trigger
- Trigger Handler Pattern
- Service Class Architecture
- Student eligibility validation
- Lookup relationship handling
- Bulk processing using Collections (List, Set, Map)
- Single SOQL query for Students
- Single SOQL query for Jobs
- No SOQL inside loops
- No DML inside loops
- Apex Test Class implementation

## Validation Rules
The application validates:
- Student CGPA against Job Minimum CGPA
- Active Backlogs against Allowed Backlogs
- Student Branch against Eligible Branches

If any validation fails, the application record is prevented from being saved using `addError()`.

## Technologies Used
- Salesforce Platform
- Apex
- Apex Triggers
- SOQL
- Custom Objects
- Lookup Relationships
- Developer Console

## Learning Outcomes
- Designed bulk-safe Apex code.
- Implemented Trigger Handler architecture.
- Used Lists, Sets, and Maps effectively.
- Followed Salesforce Governor Limits best practices.
- Created and executed Apex Test Classes successfully.
---
## Submission Details

| Details | Information |
|---------|-------------|
| **Student Name** | Merla Sowmya Sri |
| **Roll Number** | 23PA1A05F1 |
| **Department** | Computer Science and Engineering |
| **Project Title** | Day 7 – Designing Bulk-Safe Apex and Triggers |

---

# Salesforce Placement Management System

## Project Overview

This project implements a Salesforce-based Placement Management System for managing Students, Jobs, Applications, users, roles, profiles, permissions, sharing rules, and application eligibility validation.

The configuration was completed in a Salesforce Developer Edition org.

---

# Tasks Completed

## Task 1 – Student Custom Object

Created the **Student** custom object to store student information required for the placement process.

### Student Object
- Object: Student
- API Name: `Student__c`

The Student object is used by the Application and Job eligibility process.

### Important Student Information
The Student record contains the required student-related information such as:
- CGPA
- Active Backlogs
- Branch
- Student information/reference details

### Screenshot
**Screenshot Name:** `01-Student-Custom-Object.png`

---

## Task 2 – Application Object Configuration

Configured the **Application** custom object used to store student applications for jobs.

### Application Fields

The Application object contains the following fields:

- Application Date
- Application Name
- CGPA
- Created By
- External Candidate
- Integration Error
- Integration Status
- Job
- Last Integration Attempt
- Last Modified By
- Owner
- Retry Count
- Status
- Student

### Application Object
- Object: Application
- API Name: `Application__c`

The Application object maintains the relationship between a Student and a Job.

### Screenshot
**Screenshot Name:** `02-Application-Object-Fields.png`

---

## Task 3 – Student Object Permissions

Configured permissions for the Student custom object through the required profile.

### Navigation

Setup → Profiles → Required Profile → Object Settings → Student → Edit

Configured the required object permissions.

The **Custom Object Permissions** section was used to configure the Student object access.

### Configured Access
- Read
- Create
- Edit
- Delete

The permissions were configured according to the required access level for the placement users.

### Screenshot
**Screenshot Name:** `03-Student-Object-Permissions.png`

---

## Task 4 – Profile Configuration

Reviewed and configured the available Salesforce profiles.

Profiles available in the org included profiles such as:

- Salesforce API Only System Interface
- Silver Partner User
- Solution Manager
- Standard Platform User
- System Administrator

The required profile was selected and configured for the placement functionality.

### Navigation

Setup → Profiles → Select Required Profile → Object Settings

### Screenshot
**Screenshot Name:** `04-Profile-Configuration.png`

---

## Task 5 – Role Hierarchy

Configured the Salesforce Role Hierarchy.

### Navigation

Setup → Roles

The Role Hierarchy page was opened and the organization role structure was configured.

The organization hierarchy displayed the organization and the required role structure.

### Screenshot
**Screenshot Name:** `05-Role-Hierarchy.png`

---

## Task 6 – Placement Officer User

Created a user for the placement process.

### User Details

- First Name: Placement
- Last Name: Officer
- Alias: poffi
- Username: Placement Officer user account
- Profile: Selected from the available compatible profile
- Role: Configured according to the role hierarchy

Because Salesforce Developer Edition has different user-license availability, the available compatible license was selected rather than assuming that a Salesforce license would appear.

### Navigation

Setup → Users → Users → New User

### Screenshot
**Screenshot Name:** `06-Placement-Officer-User.png`

---

## Task 7 – User Verification

Verified the newly created Placement Officer user from the Users page.

### Navigation

Setup → Users → Users

The user was located in the Users list and the account details were verified.

### Screenshot
**Screenshot Name:** `07-Placement-Officer-Verification.png`

---

## Task 8 – Role Assignment

Verified that the Placement Officer user was associated with the required role.

### Navigation

Setup → Users → Users → Placement Officer → Edit

The Role field was checked and the appropriate role from the configured hierarchy was selected.

### Screenshot
**Screenshot Name:** `08-User-Role-Assignment.png`

---

## Task 9 – Organization Sharing Settings

Reviewed the organization-wide sharing configuration.

### Navigation

Setup → Sharing Settings

The Sharing Settings page was opened to review the default internal and external access configuration.

The Application object sharing access was configured according to the required placement-management access model.

### Screenshot
**Screenshot Name:** `09-Organization-Sharing-Settings.png`

---

## Task 10 – Application Sharing Configuration

Configured sharing access for the Application object.

The Application object was configured so that required users could access application records according to the placement process.

### Navigation

Setup → Sharing Settings → Application

The relevant organization-wide default access was reviewed/configured.

### Screenshot
**Screenshot Name:** `10-Application-Sharing-Settings.png`

---

## Task 11 – Application User

Created the required test user for validating Application access.

The test user was created through Salesforce Users.

### Navigation

Setup → Users → Users → New User

The required user information was entered and the user was saved.

### Screenshot
**Screenshot Name:** `11-Application-Test-User.png`

---

# Task 12 – Application Sharing Rule

Created a sharing rule for the Application object.

### Navigation

Setup → Sharing Settings → Application Sharing Rules → New

### Sharing Rule Configuration

The sharing rule was created using the required user/group configuration.

The sharing rule was used to provide the required access to Application records.

### Configuration Page

**Step 1 – Rule Name**
- Entered the required Label
- Rule Name generated automatically

**Step 2 – Rule Type**
- Selected the required rule type

**Step 3 – Records to be Shared**
- Selected the required owner/group criteria

**Step 4 – Users to Share With**
- Selected the required user/group

**Step 5 – Access Level**
- Selected the required access level

The sharing rule was saved successfully.

### Screenshot
**Screenshot Name:** `12-Application-Sharing-Rule.png`

---

# Task 13 – Login as Test User and Verify Access

After creating the test user and sharing configuration, the test user was opened using the Salesforce user login functionality.

### Navigation

Setup → Users → Users → Find the Test User → Login

The test user Salesforce session opened successfully.

The page displayed:

**Logged in as Student Test**

This confirmed that the test-user login was working.

### Verification

The Application page was opened while logged in as the test user.

### Screenshot
**Screenshot Name:** `13-Test-User-Login.png`

---

# Task 14 – Application Record Testing

Tested creation of an Application record using the Application object.

### Navigation

Application → Applications → New

The Application creation page was opened.

### Application Information

The Application form displayed:

- Application Date
- Status
- CGPA
- Integration Status
- External Candidate Id
- Owner

An External Candidate Id was entered for testing.

### Test External Candidate Id

`EXT-STU-001`

The Application record was tested from the Application page.

### Important Testing Observation

During testing, an error was encountered:

`ApplicationTrigger caused an unexpected exception`

The error indicated that the Apex code was querying:

`Student__c`

and Salesforce reported:

`SObject type 'Student__c' is not supported`

This was investigated as an Apex/custom-object API-name issue.

### Screenshot
**Screenshot Name:** `14-Application-Test.png`

---

# Apex Application Service

The Application Service class was used to validate student eligibility before creating an application.

The service performs the following validations:

1. Student CGPA validation
2. Active backlog validation
3. Branch eligibility validation
4. Job closing-date validation
5. Duplicate application validation
6. Eligible job retrieval
7. Application creation

### Eligibility Logic

A student is eligible for a job when:

- Student CGPA meets the minimum CGPA requirement.
- Student active backlogs are within the allowed backlog limit.
- Student branch is included in the eligible branches.
- Job closing date has not passed.

### Application Validation

The application service validates:

- Student
- Job
- CGPA
- Backlogs
- Branch
- Closing Date

If the student does not satisfy the eligibility criteria, the application is prevented and an appropriate error message is displayed.

---

# Apex Code Fix / Verification

The Application Service Apex code was reviewed and corrected so that the custom object API names used in the code match the actual Salesforce custom object API names.

The required objects are:

- `Application__c`
- `Student__c`
- `Job__c`

The service uses the Student and Job records to determine whether a student can apply for a particular job.

The corrected code was saved successfully and the code compilation showed no error.

### Screenshot
**Screenshot Name:** `15-Apex-Code-Success.png`

---

# Application Testing

The Application page was opened again after the Apex code correction.

### Navigation

Applications → New

The Application creation form was opened and the available Application fields were verified.

The Application Date field displayed the current date.

The External Candidate Id field was tested with:

`EXT-STU-001`

### Screenshot
**Screenshot Name:** `16-Application-Form-Verification.png`

---

# Final Verification

The following Salesforce configuration areas were verified:

| Area | Status |
|---|---|
| Student Custom Object | Completed |
| Application Custom Object | Completed |
| Student Object Permissions | Completed |
| Profile Configuration | Completed |
| Role Hierarchy | Completed |
| Placement Officer User | Completed |
| User Verification | Completed |
| Role Assignment | Completed |
| Sharing Settings | Completed |
| Application Sharing | Completed |
| Application Sharing Rule | Completed |
| Test User Login | Completed |
| Application Testing | Completed |
| Apex Application Service | Completed |
| Apex Error Fix | Completed |

---

# Screenshots Checklist

| Screenshot No. | Screenshot Name | Description |
|---|---|---|
| 1 | `01-Student-Custom-Object.png` | Student custom object |
| 2 | `02-Application-Object-Fields.png` | Application object fields |
| 3 | `03-Student-Object-Permissions.png` | Student object permissions |
| 4 | `04-Profile-Configuration.png` | Profile configuration |
| 5 | `05-Role-Hierarchy.png` | Role hierarchy |
| 6 | `06-Placement-Officer-User.png` | Placement Officer user |
| 7 | `07-Placement-Officer-Verification.png` | User verification |
| 8 | `08-User-Role-Assignment.png` | Role assignment |
| 9 | `09-Organization-Sharing-Settings.png` | Organization sharing settings |
| 10 | `10-Application-Sharing-Settings.png` | Application sharing |
| 11 | `11-Application-Test-User.png` | Test user |
| 12 | `12-Application-Sharing-Rule.png` | Application sharing rule |
| 13 | `13-Test-User-Login.png` | Login as test user |
| 14 | `14-Application-Test.png` | Application testing |
| 15 | `15-Apex-Code-Success.png` | Apex code verification |
| 16 | `16-Application-Form-Verification.png` | Final Application form verification |

---

# Questions / Answers

## Question 1
### What is the purpose of the Student object?

The Student object stores student information required for placement eligibility and application processing.

## Question 2
### What is the purpose of the Application object?

The Application object stores applications submitted by students for available jobs.

## Question 3
### What information is stored in an Application?

Application Date, Application Name, CGPA, Created By, External Candidate, Integration Error, Integration Status, Job, Last Integration Attempt, Last Modified By, Owner, Retry Count, Status, and Student.

## Question 4
### Why are sharing rules used?

Sharing rules provide additional record access to users or groups when the organization-wide sharing configuration does not provide sufficient access.

## Question 5
### What does the Role Hierarchy provide?

The Role Hierarchy controls record visibility based on the organizational hierarchy and allows higher-level users to access records owned by users below them when applicable.

## Question 6
### What does the Apex Application Service validate?

It validates job closing date, CGPA, active backlogs, branch eligibility, duplicate applications, and job eligibility before an application is created.

## Question 7
### What happens when a student does not meet the eligibility criteria?

The application is prevented and an appropriate error message is displayed.

## Question 8
### What is the purpose of External Candidate Id?

The External Candidate Id can be used to identify a candidate/application in an external placement or integration system.

---

# Key Salesforce Navigation Used

### Profiles
Setup → Profiles → Select Profile → Object Settings

### Users
Setup → Users → Users → New User

### Roles
Setup → Roles

### Sharing Settings
Setup → Sharing Settings

### Application
Applications → Applications → New

### Apex
Setup → Apex Classes

---

# Conclusion

The Salesforce Placement Management System configuration was completed by creating and configuring the Student and Application objects, setting object permissions, configuring profiles and roles, creating placement users, configuring sharing settings and sharing rules, testing user access, and validating the Application process through Apex.

The system is designed to ensure that student applications are processed according to job eligibility requirements such as CGPA, active backlogs, branch, and job closing date.

---

# Submission Details

| Field | Details |
|---|---|
| Name | MERLA SOWMYA SRI |
| Roll No | 23PA1A05F1 |
| Branch | CSE |

---

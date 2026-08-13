# Day 11 - Testing, Asynchronous Processing and Reliability

## Why Testing Matters

Testing is the process of verifying that a system works correctly before it is used by end users.

### Benefits of Testing

- Prevents bugs and errors
- Improves software reliability
- Ensures business processes work correctly
- Protects data integrity
- Reduces deployment risks
- Improves user experience

### Why Salesforce Requires Testing

Salesforce requires testing because enterprise applications handle critical business data. Errors can affect thousands of users and business operations.

---

# What is Asynchronous Processing?

Asynchronous Processing allows tasks to run in the background instead of making users wait for completion.

### Examples of Asynchronous Apex

- Future Methods
- Queueable Apex
- Batch Apex

### Benefits

- Faster user experience
- Better system performance
- Handles large workloads
- Prevents system slowdown

---

# Important Test Cases (College Management System)

## 1. Invalid Email Test

Check whether incorrect email formats are rejected.

**Prevents:** Failed communication and incorrect student records.

## 2. Duplicate Registration Test

Check whether the same student can register multiple times.

**Prevents:** Duplicate records and inaccurate reports.

## 3. Course Seat Limit Test

Check whether course capacity can be exceeded.

**Prevents:** Overbooking and management issues.

## 4. Empty Required Fields Test

Check whether mandatory fields are filled.

**Prevents:** Incomplete student records.

## 5. Invalid Age Test

Check whether negative or unrealistic ages are entered.

**Prevents:** Incorrect student information.

## 6. Attendance Calculation Test

Verify attendance percentage calculations.

**Prevents:** Incorrect academic records.

## 7. Fee Payment Update Test

Verify payment status updates correctly.

**Prevents:** Incorrect financial records.

## 8. Notification Delivery Test

Check whether notifications are sent successfully.

**Prevents:** Missing important communications.

## 9. Flow Automation Test

Verify that automated flows execute correctly.

**Prevents:** Process failures and manual intervention.

## 10. Database Record Creation Test

Verify student records are stored correctly.

**Prevents:** Data loss and reporting issues.

---

# Async Use Cases

## 1. Bulk Email Processing

Send thousands of student emails in the background.

**Why Async?**
Users should not wait for all emails to be sent.

## 2. Large Report Generation

Generate department-wide reports.

**Why Async?**
Reports may take several minutes to complete.

## 3. Large Data Import

Import thousands of student records.

**Why Async?**
Processing large datasets immediately can slow the system.

## 4. Notification Processing

Send notifications to students and faculty.

**Why Async?**
Improves user experience and system performance.

## 5. External System Synchronization

Sync data with external applications.

**Why Async?**
External systems may respond slowly.

---

# Reliability Discussion

## Scenario 1: Student Registration Failure

### Possible Problems

- Registration not completed
- Missing student records
- Duplicate registrations

### How Testing Helps

Testing ensures registration logic works correctly before deployment.

## Scenario 2: Payment Update Failure

### Possible Problems

- Incorrect payment status
- Financial reporting errors
- Student access issues

### How Testing Helps

Testing validates payment workflows and update processes.

## Scenario 3: Attendance Update Failure

### Possible Problems

- Incorrect attendance percentage
- Wrong eligibility calculations
- Reporting inaccuracies

### How Testing Helps

Testing ensures attendance calculations and updates work properly.

---

# Reflection

Enterprise systems require testing, scalability, and asynchronous processing because they serve many users and process large amounts of data.

### Why Testing is Required

- Prevents bugs
- Improves reliability
- Protects business operations

### Why Scalability is Required

- Supports growing users
- Handles increasing data volumes
- Maintains performance

### Why Async Processing is Required

- Improves response time
- Handles long-running tasks efficiently
- Prevents blocking user activities

Without these practices, enterprise systems become slow, unreliable, and difficult to maintain.

---

# Revision Questions

## 1. Why is testing important?

Testing ensures software works correctly and prevents bugs.

## 2. What problems happen without testing?

System failures, data corruption, and poor user experience.

## 3. Difference between synchronous and asynchronous execution?

**Synchronous:** Tasks execute immediately and users wait for completion.

**Asynchronous:** Tasks execute in the background while users continue working.

## 4. Why do enterprise systems use background jobs?

To process large tasks efficiently without slowing down the application.

## 5. Why should developers think about scalability?

Applications must support future growth in users and data.

## 6. Why are test cases important?

They verify that business requirements work correctly.

## 7. What happens when systems fail partially?

Data inconsistencies, process failures, and user confusion can occur.

## 8. Why do large systems require reliability engineering?

To ensure continuous operation and minimize failures.

## 9. Why should enterprise software avoid blocking operations?

Blocking operations reduce performance and user productivity.

## 10. Why is enterprise software different from small scripts?

Enterprise software supports many users, large datasets, security requirements, and critical business processes.

---

# Trailhead Work Completed

- Apex Testing
- Asynchronous Apex
- Secure Server-Side Development
- Search Solution Basics

---

## Screenshots

![Screenshot 1](Screenshot 2026-06-13 152707.png)

![Screenshot 2](Screenshot 2026-06-13 152802.png)

![Screenshot 3](Screenshot 2026-06-13 152918.png)

![Screenshot 4](Screenshot 2026-06-13 152956.png)

# Day 4 - Flow Builder and Automation

## What is Flow Builder?
Flow Builder is a Salesforce automation tool used to automate business processes without coding.

It helps businesses:
- Reduce manual work
- Save time
- Improve accuracy
- Standardize workflows

---

## Types of Flows

### Screen Flow
A Screen Flow interacts with users using screens.

**Example:**  
Student registration form where students enter details.

### Record Triggered Flow
Runs automatically when a record is created, updated, or deleted.

**Example:**  
Automatically send confirmation email after registration.

---

## Automation Ideas for College Management System

### 1. Auto Email After Registration
Send confirmation email immediately after student registration.

### 2. Auto Update Remaining Seats
Reduce available seats automatically after enrollment.

### 3. Notify Faculty When Course is Full
Alert faculty when maximum seats are reached.

### 4. Generate Student ID Automatically
Create unique ID for every new student.

### 5. Fee Deadline Reminder
Send reminders before payment deadline.

---

## Why Automation Helps
- Saves employee time
- Reduces human mistakes
- Improves consistency
- Faster business operations

---

## Flow Design Example

### Automation Selected
Auto Email After Registration

### Flow Diagram

```plaintext
Trigger:
Student Record Created
        ↓
Check if Email Exists
        ↓
Decision:
Email Available?
   ↓ Yes      ↓ No
Send Email    Stop Flow
        ↓
Confirmation Sent
```

---

## Manual vs Automated Process

### Manual Process
Staff manually checks registration and sends confirmation email.

### Problems in Manual Process
- Time consuming
- Staff may forget
- Errors possible
- Slow communication

### Automated Process
Flow automatically sends email after student registration.

### Benefits
- Fast
- Accurate
- Reliable
- Consistent

---

## Reflection
Companies automate repetitive business processes to:
- improve efficiency
- reduce operational cost
- eliminate repetitive tasks
- increase productivity
- maintain consistency

Automation allows employees to focus on important business work instead of repetitive manual tasks.

---

## Reflective Questions

### 1. Why do companies automate workflows?
To save time, reduce errors, and improve efficiency.

### 2. What problems happen with manual processes?
Manual processes are slow, error-prone, and inconsistent.

### 3. Difference between Screen Flow and Record Triggered Flow?
- Screen Flow requires user interaction.
- Record Triggered Flow runs automatically.

### 4. Why is no-code automation powerful?
It allows automation without programming knowledge.

### 5. When should automation be avoided?
When human judgment or approvals are required.

### 6. How does automation improve consistency and productivity?
Automation performs tasks the same way every time and reduces workload.

---

## Trailhead Work Completed
- Flow Builder Basics
- Data and Actions in Flows

---

## Screenshots
![Screenshot 1](Screenshot 2026-05-12 202947.png)
![Screenshot 2](Screenshot 2026-05-13 104846.png)

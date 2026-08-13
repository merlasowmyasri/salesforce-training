# Day 7 - Testing, DX and Developer Workflow

## Why Testing Matters

Testing is important in enterprise systems because it ensures software works correctly and prevents bugs before deployment.

Benefits of testing:
- Improves reliability
- Prevents data issues
- Reduces business errors
- Ensures automation works properly
- Improves software quality

Without testing:
- Invalid data may enter system
- Automations may fail
- Users may face errors
- Business processes can break

---

## What is Asynchronous Apex?

Asynchronous Apex allows processes to run in the background instead of immediately.

It is useful for:
- Large data processing
- Sending bulk emails
- Generating reports
- Data synchronization

### Examples of Async Processing

1. Sending confirmation emails to thousands of students  
2. Generating large attendance reports  
3. Synchronizing student data with external systems  

### Why Async Processing Helps
- Improves performance
- Prevents system slowdown
- Handles large workloads efficiently

---

## What is Salesforce DX?

Salesforce DX (Developer Experience) is a modern development workflow for Salesforce developers.

It helps developers:
- Use source-driven development
- Work with GitHub
- Collaborate in teams
- Manage code efficiently
- Use VS Code and CLI tools

---

## Why Developers Use GitHub, DX and CLI

### GitHub
Used for:
- Version control
- Team collaboration
- Backup of project code
- Tracking changes

### Salesforce DX
Used for:
- Modern development workflow
- Scratch org management
- Better deployment process

### Salesforce CLI
Used for:
- Faster development
- Command-based workflow
- Automation of development tasks

### Why Not Only Browser Clicks?
Browser-only development becomes difficult in large enterprise systems because:
- Hard to track changes
- Difficult for teams
- No proper version control
- Risk of overwriting work

---

# Complete System Workflow (College Management System)

## Step 1: Student Registration
Student enters registration details.

## Step 2: Validation Rules
Validation Rules check:
- Email format
- Mandatory fields
- Age validity

## Step 3: Flow Automation
Flow sends confirmation email automatically.

## Step 4: Trigger Execution
Trigger updates course enrollment count.

## Step 5: Formula Field Calculation
Remaining seats are recalculated automatically.

## Step 6: Async Processing
Bulk notifications are processed in background.

## Step 7: Database Storage
Student records are stored safely in Salesforce objects.

## Step 8: Reports and Analytics
Reports show:
- Student count
- Course occupancy
- Department statistics

---

# Important Test Cases

## 1. Invalid Email Test
Checks if incorrect email formats are blocked.

### Problem if not tested:
Wrong communication and failed notifications.

---

## 2. Duplicate Registration Test
Checks if same student registers multiple times.

### Problem if not tested:
Duplicate records and incorrect reports.

---

## 3. Course Overbooking Test
Checks if course seat limits are exceeded.

### Problem if not tested:
System inconsistency and management issues.

---

## 4. Attendance Calculation Test
Checks whether attendance percentage calculates correctly.

### Problem if not tested:
Incorrect academic records.

---

## 5. Trigger Execution Test
Checks if automation triggers work properly.

### Problem if not tested:
Business processes may fail silently.

---

# Reflection

Enterprise software development requires structured workflows because large systems involve:
- Multiple developers
- Large data volumes
- Complex business logic
- Continuous updates

Testing, DX, GitHub, and automation help teams:
- Maintain reliability
- Reduce deployment risks
- Improve collaboration
- Build scalable systems

---

# Revision Questions

## 1. Why are tests important in enterprise systems?
Tests ensure reliability and reduce software failures.

## 2. What problems happen without testing?
Data corruption, automation failures, and business errors may occur.

## 3. Why is asynchronous processing useful?
It allows long-running tasks to execute in background efficiently.

## 4. Difference between synchronous and asynchronous processing?
- Synchronous runs immediately and waits for completion.
- Asynchronous runs in background without blocking users.

## 5. Why do developers use version control?
To track changes and collaborate safely.

## 6. Why is GitHub important?
GitHub helps teams manage code, history, and collaboration.

## 7. Why is DX useful for teams?
DX improves deployment workflow and team development process.

## 8. How do Flows, Triggers and Validation Rules work together?
Validation Rules check data, Flows automate processes, and Triggers handle advanced business logic.

## 9. Why should business logic be tested carefully?
Incorrect business logic can cause system failures and bad data.

## 10. Why is developer workflow important in large teams?
Structured workflows improve coordination and reduce conflicts.

---

# Trailhead Work Completed
- Apex Testing
- Quick Start: Salesforce DX
- Asynchronous Apex
- Command-Line Interface

---

# Screenshots
![Screenshot 1](Screenshot 2026-05-26 135933.png)
![Screenshot 2](Screenshot 2026-05-26 140014.png)
![Screenshot 3](Screenshot 2026-05-26 140125.png)

# Day 14 - Flow Governance and Approval Workflows

## Approval Workflow Examples

### 1. Course Creation Approval

**Workflow:**

Faculty Member → Department Head → Admin

**Approval Process:**

1. Faculty submits a new course request.
2. Department Head reviews the course details.
3. If approved, request goes to Admin.
4. Admin performs final approval.

**After Approval:**

* Course record is created.
* Faculty receives confirmation.

**After Rejection:**

* Request is returned with comments.
* Course is not created.

---

### 2. Faculty Leave Request Approval

**Workflow:**

Faculty → Department Head → HR/Admin

**Approval Process:**

1. Faculty submits leave request.
2. Department Head reviews leave availability.
3. HR/Admin verifies records and approves.

**After Approval:**

* Leave status becomes Approved.
* Faculty receives notification.

**After Rejection:**

* Leave request is rejected.
* Faculty receives reason for rejection.

---

### 3. Student Scholarship Request Approval

**Workflow:**

Student → Faculty Advisor → Scholarship Committee → Admin

**Approval Process:**

1. Student submits scholarship application.
2. Faculty Advisor reviews eligibility.
3. Scholarship Committee evaluates application.
4. Admin performs final approval.

**After Approval:**

* Scholarship is granted.
* Student receives notification.

**After Rejection:**

* Application is rejected.
* Student receives feedback.

---

### 4. Budget Approval Workflow

**Workflow:**

Department Head → Finance Team → Principal/Admin

**Approval Process:**

1. Department submits budget request.
2. Finance Team reviews budget availability.
3. Principal/Admin gives final approval.

**After Approval:**

* Budget is allocated.
* Finance records are updated.

**After Rejection:**

* Budget request is denied.
* Department receives explanation.

---

## Branching Flow Logic

### Attendance Monitoring Flow

**Trigger:**
Attendance record is updated.

### Decision Points and Actions

**If Attendance ≥ 75%**

* No action required.

**If Attendance < 75%**

* Send warning email to student.

**If Attendance < 60%**

* Send warning email.
* Notify parent/guardian.

**If Attendance < 50%**

* Send warning email.
* Notify parent/guardian.
* Escalate case to Admin.

### Flow Diagram

Attendance Updated

↓

Decision: Attendance Percentage

↓

Attendance ≥ 75%
→ No Action

Attendance < 75%
→ Warning Email

Attendance < 60%
→ Warning Email + Parent Notification

Attendance < 50%
→ Warning Email + Parent Notification + Admin Escalation

---

## Governance Explanation

### Why Can't Everyone Change Important Records?

Enterprise systems contain critical business information.

Allowing unrestricted access may cause:

### Security Risks

* Unauthorized users may modify sensitive records.
* Confidential information may be exposed.

### Misuse of Data

* Records may be changed intentionally or accidentally.
* Fraudulent updates may occur.

### Incorrect Approvals

* Users may bypass approval processes.
* Policies may not be followed.

### Business Risks

* Financial losses
* Compliance violations
* Operational disruptions

For these reasons, enterprises use permissions, approvals, and governance controls.

---

## Reflection

Enterprises require controlled workflows because business operations must be secure, reliable, and auditable.

Benefits of controlled workflows:

* Improve accountability
* Reduce human errors
* Enforce business policies
* Protect sensitive data
* Maintain compliance
* Ensure proper approvals

Without controlled workflows, organizations may experience security issues, incorrect decisions, and operational failures.

---

## Revision Questions

### 1. Why are approval workflows important?

Approval workflows ensure important decisions are reviewed before implementation.

### 2. Why do businesses require governance?

Governance helps maintain security, compliance, and accountability.

### 3. What are branching workflows?

Branching workflows use decision points to execute different actions based on conditions.

### 4. Why should automation follow business rules?

To ensure processes remain accurate, compliant, and consistent.

### 5. Why are decision nodes important in flows?

They allow different actions to occur based on business conditions.

### 6. Why should enterprises restrict sensitive operations?

To prevent unauthorized access and reduce business risk.

### 7. Why are approvals important in large organizations?

They ensure accountability and proper decision-making.

### 8. Why should workflows be auditable?

Audit trails help organizations track actions and investigate issues when necessary.

---

## Trailhead Work Completed

* Flow Builder Logic
* Approve Records with Approval Processes

## Screenshots

### Flow Builder Logic
![Flow Builder Logic](Screenshot%202026-06-13%20155017.png)

### Approval Process
![Approval Process](Screenshot%202026-06-13%20155115.png)

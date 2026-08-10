# Sprint 10 – Component Communication, Forms, LDS & Reusable LWC Architecture

## 📌 Overview

This sprint focused on designing Lightning Web Components (LWC) as a **connected application instead of isolated components**. The main focus was component communication, forms, Lightning Data Service (LDS), validation, reactive data, reusable components, refresh behaviour, and maintaining clear component responsibilities.

The Student Placement Portal was extended into a more realistic application where multiple components communicate with each other and work together as one system.

---

## 🎯 What I Learned

### 1. LWC Component Architecture

I learned that a good LWC application should not be built as one large component. Instead, it should consist of multiple focused components where each component has a **clear responsibility**.

Example architecture:

```text
StudentPortal
│
├── StudentSummary
├── StudentProfile
├── EligibleJobs
│   ├── JobCard
│   └── EmptyState
├── MyApplications
│   └── ApplicationCard
└── OfferSummary
    └── StatusBadge
```

Focused components communicate with each other to form one complete application.

---

### 2. Parent → Child Communication

I learned that when the parent component has data that a child needs, the parent can pass the data to the child using **public properties with `@api`**.

Example:

```javascript
// Parent
selectedJob;
```

```javascript
// Child
@api job;
```

```html
<c-job-details job={selectedJob}></c-job-details>
```

The child receives the required information from the parent instead of unnecessarily retrieving the same information again.

**Key principle:** Give a component the data it needs instead of making it independently retrieve information that the parent already has.

---

### 3. Child → Parent Communication

I learned that a child component should not directly modify the state of its parent.

Instead, the child communicates with the parent using **Custom Events**.

Example:

```javascript
this.dispatchEvent(
    new CustomEvent('viewdetails', {
        detail: {
            jobId: this.job.Id
        }
    })
);
```

The parent listens for the event:

```html
<c-job-card
    job={job}
    onviewdetails={handleViewDetails}>
</c-job-card>
```

The parent then decides what action should be performed.

**Important principle:**

```text
Child → Reports an Event
Parent → Coordinates the Behaviour
```

This keeps components loosely coupled and easier to maintain.

---

### 4. Custom Event Contracts

I learned that event names and event data should clearly communicate what actually happened.

For example:

```text
applyclicked
```

can indicate that the user clicked the Apply button.

But:

```text
applicationsubmittedsuccessfully
```

should not be used if the child only knows that the button was clicked and the application has not yet been successfully created.

Therefore, I learned to distinguish between:

```text
User Intent ≠ Business Outcome
```

A component should communicate facts rather than assumptions.

---

### 5. Lightning Base Components

I learned to use Salesforce Lightning base components instead of manually creating common UI elements whenever the platform provides the required functionality.

Examples:

```text
lightning-button
lightning-card
lightning-input
lightning-combobox
lightning-textarea
lightning-checkbox-group
lightning-radio-group
```

These provide standard behaviour and styling consistent with Salesforce Lightning.

**Engineering principle:**

> Reuse the platform before reinventing the platform.

---

### 6. Building Forms in LWC

I learned how to design a student profile form using Lightning base components.

Example fields:

| Field              | Type      | Required |
| ------------------ | --------- | -------- |
| Phone              | Text      | Yes      |
| Email              | Email     | Yes      |
| Branch             | Picklist  | Yes      |
| CGPA               | Number    | Yes      |
| Skills             | Long Text | No       |
| Preferred Location | Picklist  | No       |

I also learned how form input changes can be handled in JavaScript.

```javascript
handlePhoneChange(event) {
    this.phone = event.target.value;
}

handleEmailChange(event) {
    this.email = event.target.value;
}
```

For larger forms, a more structured change-handling approach may be considered, but unnecessary abstraction should be avoided for simple forms.

---

### 7. Client-Side vs Server-Side Validation

One of the important concepts I learned is that **client-side validation and server-side validation have different responsibilities**.

For example, JavaScript can check whether:

```text
CGPA >= 0
CGPA <= 10
```

This improves the user experience.

However, Apex must not blindly trust client-side validation because another client could call the backend directly.

Therefore:

```text
Client-Side Validation
        ↓
Better User Experience

Server-Side Validation
        ↓
Business Integrity
```

Server-side business validation remains authoritative.

---

### 8. Lightning Data Service (LDS)

I learned that custom Apex is not always required for basic Salesforce record operations.

**Lightning Data Service** can provide standard mechanisms for working with supported Salesforce records.

LDS can reduce unnecessary custom server-side code.

The architecture should be selected based on the requirement:

```text
Option A → LDS
Option B → Custom Apex
Option C → Combination
```

Apex should not be selected simply because it is familiar. The requirement should determine the architecture.

---

### 9. Reactive Data and Data Ownership

I learned that when data changes, other components depending on that data may become stale.

For example:

```text
Student Record
     ↓
 ┌───┼────────────┐
 ↓   ↓            ↓
Summary  Eligible Jobs  Applications
```

If the student's CGPA changes, eligible jobs and other dependent information may also need to update.

I learned that **data ownership must be clear**. If multiple components maintain separate copies of the same changing data, those copies can become inconsistent.

---

### 10. Refresh Behaviour

After a successful update, the UI must display the latest information.

Example:

```text
Profile Updated
      ↓
Student Record Changes
      ↓
Student Summary Refreshes
      ↓
Eligible Jobs Refreshes
```

Possible strategies include:

* Parent-owned state
* Custom events
* Refreshing appropriate wired data
* LDS-supported record notifications
* Reactive updates
* Re-querying data when genuinely necessary

The simplest architecture that keeps the UI consistent should be preferred.

---

### 11. Loading, Success, Empty and Error States

I learned that a professional application should clearly communicate its current state to the user.

Examples:

```text
Loading
→ Loading your profile...

Editing
→ Normal form

Saving
→ Saving...

Success
→ Profile updated successfully.

Error
→ We could not update your profile.
  Please review the highlighted fields.
```

Users should not have to guess what is happening.

---

### 12. Reusable Components

I learned how reusable components can reduce duplication.

For example, a common `StatusBadge` component can be used by:

```text
ApplicationCard
      ↓
StatusBadge

InterviewCard
      ↓
StatusBadge

OfferCard
      ↓
StatusBadge
```

A reusable component should provide a meaningful capability.

Good examples:

```text
StatusBadge
ApplicationStatus
JobCard
EmptyState
LoadingIndicator
```

Instead of meaningless names such as:

```text
smallBlueBox
```

I also learned that reuse should not be forced. Excessive abstraction can create unnecessary complexity.

---

### 13. Empty State Component

I learned that an empty state should provide useful guidance rather than simply displaying:

```text
No records found.
```

A better empty state can explain the situation and suggest an action.

Example:

```text
No eligible opportunities are available right now.

Keep your profile updated and check again
as new companies are added.

[ UPDATE PROFILE ]
```

The empty state itself can be implemented as a reusable component with properties such as:

```text
title
message
action label
```

If an action is clicked, the child can communicate with the parent through a custom event.

---

### 14. Avoiding the "God Component"

I learned that putting all data retrieval, state, event handling and business coordination into one parent creates a **"god component"**.

A healthier structure is:

```text
StudentPortal
│
├── StudentSummary
├── StudentProfile
├── EligibleJobs
│   └── JobCard
└── MyApplications
    └── ApplicationCard
```

The parent coordinates the application while children handle focused responsibilities.

---

### 15. Component Architecture Review

I learned to review an LWC architecture by asking:

1. Which components retrieve data?
2. Which components display data?
3. Which components own state?
4. Which components only report events?
5. Where does business logic live?
6. Are multiple components retrieving the same information unnecessarily?
7. Are any components becoming too large?

These questions help identify unnecessary coupling and poor architecture.

---

## 🔄 Complete Application Flow

The final Student Placement Portal workflow can be understood as:

```text
Student Login
      ↓
Student Summary
      ↓
Update Profile
      ↓
Profile Saved
      ↓
Eligible Jobs Refresh
      ↓
Select Job
      ↓
Job Details
      ↓
Apply
      ↓
Application Created
      ↓
My Applications Refresh
      ↓
Student Sees New Status
```

The complete system can also be traced as:

```text
User Click
    ↓
Event
    ↓
Component
    ↓
Apex
    ↓
Service
    ↓
Database
    ↓
Result
    ↓
UI Refresh
```

This helped me understand that an LWC project is not just about individual components; it is about how the complete system works together.

---

# 💡 Interview Questions & Answers

### Q1. How does a parent component communicate data to a child?

A parent communicates data to a child by passing values to the child's public properties. The child exposes the property using `@api`.

```javascript
@api job;
```

The parent can then pass the value through the child component's attribute.

---

### Q2. How does a child communicate an action to a parent?

A child communicates with its parent by dispatching a **Custom Event**.

```javascript
this.dispatchEvent(
    new CustomEvent('viewdetails', {
        detail: { jobId: this.job.Id }
    })
);
```

The parent listens for the event and handles the required action.

---

### Q3. Why should a child not directly manipulate parent state?

Direct manipulation creates tight coupling between the child and parent. It makes the application harder to maintain and can allow the child to incorrectly modify unrelated state.

Instead, the child should report what happened through an event and allow the parent to decide what to do.

---

### Q4. What is the purpose of `@api`?

`@api` is used to expose a public property or method of an LWC so that it can be accessed by its parent component.

For parent-to-child communication, a parent can pass data to a child's `@api` property.

---

### Q5. What are Custom Events in LWC?

Custom Events are a mechanism used by a child component to communicate information or actions to its parent.

The child dispatches an event, and the parent listens for that event.

---

### Q6. When would you use Lightning Data Service instead of Apex?

LDS should be considered when the requirement involves standard or supported Salesforce record operations that LDS can handle.

It can reduce the need for custom Apex.

Custom Apex should be used when the requirement needs server-side logic or operations that LDS does not appropriately support.

---

### Q7. Why is client-side validation not sufficient for business rules?

Client-side validation improves the user experience, but it cannot be trusted as the final security or business-rule enforcement because another client could bypass it and call the backend directly.

Therefore, important business rules must remain enforced on the server side.

---

### Q8. What is reactive data?

Reactive data means that when relevant data changes, dependent information in the UI can update accordingly.

For example, when a student's CGPA changes, the eligible jobs depending on that CGPA may need to refresh.

---

### Q9. Why might a component show stale information after a successful update?

The Salesforce record may have been updated successfully while another component is still displaying an old copy of the data.

The application must identify dependent data and refresh or update the relevant components appropriately.

---

### Q10. What is a reusable component?

A reusable component is a component designed to provide a meaningful capability that can be used by multiple parts of an application.

Examples include:

```text
StatusBadge
EmptyState
JobCard
LoadingIndicator
```

---

### Q11. When does component reuse become over-engineering?

Reuse becomes over-engineering when a component requires excessive configuration or abstraction for small differences between screens.

For example, if a reusable component requires a very large number of properties just to support slightly different behaviours, the abstraction may have gone too far.

---

### Q12. How would you design communication between two sibling components?

Sibling components should not directly communicate with each other.

A common parent can coordinate their communication:

```text
Sibling A
   ↓
Custom Event
   ↓
Parent
   ↓
Data / Property
   ↓
Sibling B
```

The parent acts as the coordinator.

---

### Q13. What is the difference between user intent and business outcome?

User intent describes what the user did, while a business outcome describes what successfully happened in the system.

For example:

```text
applyclicked
```

means the user clicked Apply.

It does not necessarily mean:

```text
applicationsubmittedsuccessfully
```

because the actual application creation may still fail.

---

### Q14. What is the main principle of child-to-parent communication?

The child should report events, while the parent should coordinate the resulting behaviour.

```text
Child → Reports
Parent → Decides
```

---

### Q15. What is a "god component"?

A god component is an oversized component that handles too many responsibilities, such as:

* Retrieving all data
* Maintaining all state
* Handling every event
* Controlling every child
* Managing too much business/application behaviour

It becomes difficult to maintain as the application grows.

---

### Q16. Why is clear data ownership important?

If multiple components independently maintain copies of the same changing data, their values can become inconsistent.

Clear ownership helps ensure that components use a consistent source of information.

---

### Q17. What should a professional form handle?

A professional form should:

* Load existing information
* Display current values
* Allow editing
* Validate required fields
* Save changes
* Show success
* Show meaningful errors
* Refresh displayed information appropriately

---

### Q18. How would you handle a profile update that changes job eligibility?

First, identify who owns the Student data and which components depend on it.

After the profile update succeeds, the appropriate dependent data should be refreshed using suitable communication and data mechanisms such as parent-owned state, custom events, wired-data refresh, LDS-supported updates, or re-querying when genuinely necessary.

The architecture should be chosen based on the actual data flow rather than immediately selecting a specific API.

---

### Q19. Why should business rules remain server-side?

Server-side validation is authoritative because client-side validation can be bypassed.

This protects business integrity even when requests come from clients other than the expected UI.

---

### Q20. What is the main lesson of this sprint?

The main lesson is that a real Salesforce application is not just a collection of individual components.

Components must have:

```text
Clear Responsibilities
        +
Clear Communication
        +
Clear Data Ownership
        +
Appropriate Platform Capabilities
        =
Maintainable Application
```

---

# 🧠 Key Takeaways

* Design LWCs as a collection of focused components.
* Use `@api` for parent-to-child communication.
* Use Custom Events for child-to-parent communication.
* Do not allow children to directly manipulate parent state.
* Design meaningful event contracts.
* Distinguish user intent from business outcome.
* Reuse Salesforce Lightning base components.
* Use client-side validation for better UX.
* Keep important business validation on the server.
* Use LDS when it appropriately satisfies the requirement.
* Keep data ownership clear.
* Handle reactive updates and refresh behaviour carefully.
* Always provide loading, success, empty and error states.
* Build reusable components with meaningful responsibilities.
* Avoid unnecessary abstraction.
* Avoid creating a "god component."
* Keep business logic in the appropriate layer.
* Understand and explain the complete data flow of the application.

---

# 📁 Suggested GitHub Structure

```text
Sprint-10-LWC-Architecture
│
├── README.md
│
├── architecture/
│   ├── component-tree.png
│   └── data-flow.png
│
├── force-app/
│
├── screenshots/
│   ├── profile.png
│   ├── eligible-jobs.png
│   ├── application-success.png
│   └── empty-state.png
│
└── learning-notes/
    └── sprint-10.md
```

The README should document the component tree, communication approach, data strategy, validation strategy, reusable components, debugging experience and one important architectural decision.

---

# 🚀 Final Sprint Outcome

By completing this sprint, I learned how individual LWCs can work together as a complete application.

The Student Placement Portal evolved from isolated screens into a connected workflow involving:

```text
LWC Components
      ↓
Component Communication
      ↓
Forms & Validation
      ↓
LDS / Apex
      ↓
Business Rules
      ↓
Data Updates
      ↓
Refresh Behaviour
      ↓
Consistent User Experience
```

The most important takeaway is that a good application is created when components communicate with **clear responsibilities and clear contracts**.

---

# 📋 Submission Details

| Detail                    | Information                                                           
| ------------------------- | ----------------------------------------------------------------------
| **Sprint**                | Sprint 10                                       |
| **Project**               | Student Placement Portal                                              
| **Student Name**          | **MERLA SOWMYA SRI** 
| **Roll No**               | **23PA1A05F1** 

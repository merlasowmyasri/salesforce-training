# Day 9 - LWC Communication and Application Architecture

## Component Communication

Component communication allows different Lightning Web Components (LWCs) to exchange data and work together inside an application.

It helps:

* Share data between components
* Update UI dynamically
* Trigger actions based on user interaction
* Build scalable applications

### Types of Communication

#### Parent to Child Communication

A parent component passes data to a child component using properties.

**Example:** Student Dashboard passes student details to Student Info Component.

#### Child to Parent Communication

A child component sends data back to the parent using custom events.

**Example:** Attendance Component notifies Dashboard Component when attendance is updated.

#### Event-Based Communication

Components communicate using events without being directly connected.

**Example:** Notification Component displays alerts when another component triggers an event.

---

# Dashboard Architecture

## 1. Student Dashboard

### Components

* Header Component
* Student Profile Component
* Attendance Component
* Course Component
* Notification Component

### Communication

* Student Profile Component sends student information to Attendance Component.
* Attendance Component updates Notification Component when attendance is low.
* Course Component displays enrolled courses.

---

## 2. Faculty Dashboard

### Components

* Faculty Profile Component
* Student List Component
* Attendance Update Component
* Course Management Component

### Communication

* Attendance Update Component updates Student List Component.
* Course Management Component shares course information with Faculty Profile Component.

---

## 3. Admin Dashboard

### Components

* User Management Component
* Department Component
* Reports Component
* Analytics Component

### Communication

* Reports Component receives data from Analytics Component.
* User Management Component interacts with Department Component.

---

# Data Flow Thinking

## Selected Process: Student Registration

### Step 1: UI

Student enters registration details using a registration form.

↓

### Step 2: Validation Rules

Salesforce checks:

* Required fields
* Email format
* Duplicate registrations

↓

### Step 3: Flow

A Flow automatically processes registration and sends a confirmation email.

↓

### Step 4: Apex

Apex executes additional business logic such as updating course enrollment.

↓

### Step 5: Database

Student information is stored in Salesforce objects.

↓

### Step 6: Notification

System displays registration success notification and confirmation message.

---

# Aura vs LWC

## Visualforce

Visualforce was Salesforce's original UI technology.

### Limitations

* Older architecture
* Less interactive UI
* Lower performance
* More server-side rendering

---

## Aura Components

Aura improved Salesforce UI development but had some challenges.

### Limitations

* Complex framework
* More framework overhead
* Slower compared to modern standards

---

## Lightning Web Components (LWC)

LWC is Salesforce's modern UI framework.

### Advantages

* Faster performance
* Uses modern JavaScript
* Lightweight architecture
* Better browser support
* Easier maintenance
* Better scalability

---

# Why Salesforce Moved from Visualforce/Aura to LWC

Salesforce moved to LWC because:

* Better performance
* Modern web standards
* Faster component rendering
* Improved developer experience
* Easier maintenance
* More scalable applications

LWC provides a modern and efficient way to build enterprise applications.

---

# Reflection

Enterprise applications need modular architecture because:

* Large systems become easier to manage
* Components can be reused
* Teams can work independently
* Maintenance becomes easier
* Updates become faster
* Applications become scalable

Modular architecture reduces complexity and improves software quality.

---

# Revision Questions

## 1. Why do components communicate?

Components communicate to share data and coordinate actions inside an application.

## 2. Difference between parent-child communication and events?

Parent-child communication is direct communication between related components, while events allow indirect communication.

## 3. Why is modular architecture useful?

It improves maintainability, scalability, and reusability.

## 4. Why did Salesforce move toward LWC?

To improve performance and use modern web technologies.

## 5. What problems happen in tightly coupled systems?

They are difficult to maintain, modify, and scale.

## 6. Why is frontend architecture important?

It improves user experience, application structure, and maintainability.

## 7. Why should UI and backend remain separate?

It improves security, maintainability, and scalability.

## 8. Why do large systems need reusable modules?

Reusable modules reduce duplicate work and speed up development.

---

# Trailhead Work Completed

* Lightning Web Components and Salesforce Data
* Communicate Between Lightning Web Components
* Visualforce Basics
* Aura Components Basics

---

# Screenshots

![Screenshot 1](Screenshot 2026-06-13 151146.png)

![Screenshot 2](Screenshot 2026-06-13 151310.png)

![Screenshot 3](Screenshot 2026-06-13 151356.png)

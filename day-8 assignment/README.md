# Engineering Sprint 8 – Designing Asynchronous Workflows That Remain Reliable

---

# Objective

The objective of this sprint is to understand how to design reliable asynchronous workflows in Salesforce. The sprint focuses on separating immediate business operations from background processing using Queueable Apex, Batch Apex, Scheduled Apex, and Queueable Chaining while keeping applications scalable, maintainable, and efficient. :contentReference[oaicite:0]{index=0}

---

# Tasks Completed

## Task 1 – Queueable Apex

Created a Queueable Apex class named **OfferPostProcessingJob**.

Performed:
- Accepted Offer ID through constructor.
- Executed background processing.
- Simulated external synchronization.
- Simulated notification processing.
- Simulated analytics processing.

Verified execution using:
- Developer Console Logs
- Setup → Apex Jobs

---

## Task 2 – Queueable Chaining

Created two Queueable classes:

- ExternalPlacementSyncJob
- PlacementNotificationJob

Implemented Queueable Chaining where the second job starts after the successful completion of the first job.

Verified execution using:
- Developer Console Logs
- Apex Jobs

---

## Task 3 – Batch Apex

Created Batch Apex class:

**PlacementCategoryBatch**

Implemented:

- start()
- execute()
- finish()

Executed using Execute Anonymous.

Verified using:

- Apex Jobs
- Debug Logs

---

## Task 4 – Scheduled Apex

Created:

**ExpiredJobScheduler**

The scheduler starts the Batch Apex job automatically.

Verified using:

- Scheduled Jobs
- Apex Jobs

---

# Execution Flow

Student Accept Offer

↓

Synchronous Processing

↓

Queueable Job

↓

External Synchronization

↓

Notification Processing

↓

Analytics Processing

↓

Batch Processing (Large Data)

↓

Scheduled Processing

---

# Classes Created

- OfferPostProcessingJob
- ExternalPlacementSyncJob
- PlacementNotificationJob
- PlacementCategoryBatch
- ExpiredJobScheduler

---

# Result Verification

The implemented classes were executed successfully using Execute Anonymous Window.

Execution was verified through:

- Developer Console Debug Logs
- Setup → Apex Jobs
- Setup → Scheduled Jobs

---

# Architecture Review Answers

### 1. Immediate Validation using Batch Apex

Not recommended because validation should happen immediately in a synchronous transaction.

---

### 2. Processing 300,000 Records using Future Method

Not suitable because Future Methods are not designed for processing very large datasets. Batch Apex is a better choice.

---

### 3. Scheduled Apex directly processing huge data

Not recommended.

Scheduled Apex should trigger Batch Apex instead of processing all records itself.

---

### 4. Queueable Job performing many responsibilities

This violates the **Single Responsibility Principle**.

Each Queueable class should perform only one responsibility.

---

### 5. Moving inefficient synchronous code into Queueable

Moving code to Queueable does not automatically improve performance.

The underlying logic should also be optimized.

---

# Architecture Challenge Solution

User

↓

Synchronous Transaction

↓

Queueable Apex

↓

Queueable Chaining

↓

Scheduled Apex

↓

Batch Apex

This architecture separates immediate user actions from background processing and improves scalability and maintainability. :contentReference[oaicite:1]{index=1}

---

# Interview Questions and Answers

### What is Asynchronous Apex?

Asynchronous Apex executes code in the background without making the user wait.

---

### When should processing remain synchronous?

When the user requires an immediate response or immediate validation.

---

### Why use Queueable Apex?

Queueable Apex provides structured background processing and supports Queueable Chaining.

---

### When should Batch Apex be used?

Batch Apex should be used for processing very large datasets.

---

### Methods in Batch Apex

- start()
- execute()
- finish()

---

### What is Scheduled Apex?

Scheduled Apex executes jobs automatically at a specified time.

---

### Can Scheduled Apex and Batch Apex work together?

Yes.

Scheduled Apex can start a Batch Apex job.

---

### Does Asynchronous Apex remove Governor Limits?

No.

Governor Limits still apply.

---

### Why should Batch Apex be bulkified?

To process records efficiently while staying within Governor Limits.

---

### What happens if an asynchronous job fails?

The failure can be investigated using Apex Jobs and Debug Logs.

---

### What is Queueable Chaining?

Queueable Chaining allows one Queueable job to start another Queueable job after successful completion.

---

### Before moving work to asynchronous processing, what should be considered?

- Business requirement
- Processing time
- Failure handling
- Monitoring
- Duplicate execution

---

# Sprint Retrospective

### Hardest Concept

Queueable Chaining because it requires understanding execution order.

### Most Important Learning

Knowing **when** to use Queueable Apex is more important than simply knowing how to write it.

### Governor Limits

Governor Limits still apply even in asynchronous processing.

### New Challenges in Background Processing

- Monitoring
- Failures
- Duplicate execution
- Ordering
- Retry handling

### Activities that can move to background

- Notification Processing
- Analytics Processing
- External System Synchronization

---

# Conclusion

In this sprint, asynchronous processing was implemented using Queueable Apex, Queueable Chaining, Batch Apex, and Scheduled Apex. Different execution models were used based on business requirements, and job execution was successfully verified using Salesforce monitoring tools.

---
# Submission Details

| Field | Details |
|-------|---------|
| **Name** | MERLA SOWMYA SRI |
| **Topic** | Designing Asynchronous Workflows That Remain Reliable |
| **Submitted On** | 06-Aug-2026 |

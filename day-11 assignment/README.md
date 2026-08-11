# Sprint 11 
### 1. Overview

In this sprint, I extended the Salesforce Placement Management System by integrating it with an external recruitment system.

The main objective is to send selected candidate information from Salesforce to an external system using **Queueable Apex and REST API callouts**.

### 2. Integration Flow

```text
Application Selected
        ↓
Trigger / Service
        ↓
Queueable Apex
        ↓
REST API Callout
        ↓
External Recruitment System
        ↓
Success / Failure
        ↓
Integration Status
```

The integration is asynchronous because the user does not need to wait for the external system response.

### 3. Technologies Used

* Salesforce Apex
* Queueable Apex
* REST API
* HTTP Callout
* JSON
* HttpCalloutMock
* Named Credentials
* Salesforce Application Object

### 4. Integration Status Tracking

The `Application__c` object was extended with integration-related fields:

| Field                    | Purpose                              |
| ------------------------ | ------------------------------------ |
| Integration Status       | Tracks the current integration state |
| External Reference       | Stores the external candidate ID     |
| Last Integration Attempt | Stores the latest attempt time       |
| Integration Error        | Stores error details                 |

Possible integration states:

```text
Pending
Success
Failed
Retry Required
```

### 5. Candidate Synchronization

`CandidateSyncQueueable` is responsible for sending selected candidate information to the external recruitment API.

Example successful response:

```json
{
    "candidateId": "EXT001",
    "status": "created"
}
```

The external candidate ID is stored in the Salesforce Application record as the **External Reference**.

The Queueable execution can be monitored from:

**Setup → Apex Jobs**

### 6. Error Handling

The integration handles different HTTP responses:

| Status | Meaning      | Action               |
| ------ | ------------ | -------------------- |
| 201    | Created      | Success              |
| 400    | Bad Request  | Failed               |
| 401    | Unauthorized | Authentication issue |
| 403    | Forbidden    | Permission issue     |
| 500    | Server Error | Retry Required       |

Temporary failures such as `500` or `503` can be considered for retry instead of immediately marking the integration as permanently failed.

### 7. Idempotency

Idempotency prevents duplicate candidate creation when the same request is processed more than once.

For this project, the **Salesforce Application Id** can be used as the unique business transaction identifier.

This is especially important when asynchronous processing or retry mechanisms are used.

### 8. Security

Credentials should not be hard-coded in Apex.

**Named Credentials** are used/recommended for securely managing external API connection and authentication details.

```text
Apex
  ↓
Named Credential
  ↓
External API
```

### 9. Salesforce Connect & External Objects

Salesforce Connect and External Objects can be used when Salesforce needs to access external data without copying all of it into Salesforce.

If Salesforce needs to own and process the data as part of the core business process, storing the required data in Salesforce may be more appropriate.

### 10. Point-to-Point vs Middleware

For a small integration, point-to-point communication can be simple:

```text
Salesforce ↔ External System
```

When many external systems are involved, middleware such as MuleSoft can provide centralized routing, transformation, monitoring, and retry handling.

### 11. Synchronous vs Asynchronous

**Synchronous:** Used when the user needs an immediate response.

Example:

```text
Verify Certification → External API → Immediate Response
```

**Asynchronous:** Used when the user does not need to wait.

Example:

```text
Candidate Selected → Queueable → External API
```

For candidate synchronization, asynchronous processing is preferred.

### 12. Testing

`HttpCalloutMock` is used to simulate the external API response during testing.

The `CandidateSyncQueueableTest` test class was executed successfully with:

**5/5 test scenarios passed.**

This verifies the Queueable callout and response-handling logic without depending on a real external API.

---

## What I Learned

In this sprint, I learned how Salesforce communicates with external systems using APIs and REST callouts. I understood how HTTP methods, JSON requests/responses, and HTTP status codes are used during integration.

I learned why **Queueable Apex** is useful for asynchronous callouts and why external integrations should not be handled directly inside triggers.

I learned the importance of **Named Credentials** for secure authentication and why credentials should never be hard-coded in Apex.

I also learned about **error handling, retry strategy, and idempotency**. A reliable integration should handle temporary failures and prevent duplicate records when the same request is processed multiple times.

I understood the difference between **point-to-point integration and middleware**, and when **Salesforce Connect and External Objects** can be useful.

---

## Interview / Review Questions

### 1. Why did you use Queueable Apex?

Queueable Apex allows the candidate synchronization to happen asynchronously. The user does not need to wait for the external API response.

### 2. Why not make the callout directly from the trigger?

Triggers should not directly handle external callouts. The trigger can delegate the work to asynchronous processing such as Queueable Apex.

### 3. What is idempotency?

Idempotency means processing the same request multiple times should not create unintended duplicate records.

### 4. What happens if the API returns 500?

A 500 error may be temporary, so the integration can mark the record as **Retry Required** and process it again according to the retry strategy.

### 5. Why use Named Credentials?

Named Credentials provide a secure and maintainable way to manage external API connection and authentication details without hard-coding credentials in Apex.

### 6. What is the difference between 401 and 403?

`401` generally indicates an authentication problem, while `403` indicates that the authenticated user/system does not have sufficient permission.

### 7. Why use HttpCalloutMock?

It allows us to simulate external API responses during Salesforce testing without making real HTTP callouts.

### 8. Why is Integration Status needed when Apex Jobs already exist?

Apex Jobs show the execution status of the asynchronous job. Integration Status shows the actual business result of the external synchronization.

### 9. When would you use Salesforce Connect?

When Salesforce users need access to external data without necessarily storing all of that data inside Salesforce.

### 10. When would middleware be useful?

Middleware becomes useful when an organization has many external systems and needs centralized routing, transformation, monitoring, and retry management.

---

## GitHub Structure

```text
Sprint-11-Integration/
│
├── README.md
├── architecture/
│   ├── integration-flow.png
│   ├── sequence-diagram.png
│   └── integration-pattern.png
├── force-app/
├── api-contract/
│   └── candidate-api.md
├── screenshots/
└── learning-notes/
    └── sprint-11.md
```

## Submission Details

| Detail           | Information                            |
| ---------------- | -------------------------------------- |
| Name             | Merla Sowmya Sri                       |
| Roll No          | 23PA1A05F1                             |
| Branch           | CSE                                    |
| Project          | Salesforce Placement Management System |

## Sprint Outcome

The Placement Management System can now communicate with an external recruitment system using an asynchronous integration architecture with Queueable Apex, API callouts, integration status tracking, error handling, retry thinking, and idempotency.

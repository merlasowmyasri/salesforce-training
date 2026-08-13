# Day 5 – Apex Introduction

## What is Apex?
Apex is a server-side programming language used in Salesforce to write custom business logic.

It is object-oriented and similar to Java.

---

## Why Apex is Needed
Apex is required when:
- Logic is complex
- Multiple objects are involved
- Large data processing is needed
- External system integration is required
- Advanced calculations are needed

---

## Flow vs Apex

| Feature | Flow | Apex |
|--------|------|------|
| Type | No-code (Declarative) | Code-based (Programmatic) |
| Ease of Use | Easy | Requires coding |
| Flexibility | Limited | Highly flexible |
| Performance | Medium | High |
| Complexity Handling | Basic to Medium | Advanced |
| Usage | Admin users | Developers |

---

## Configuration vs Coding

| Feature | Configuration | Coding (Apex) |
|--------|--------------|--------------|
| Type | Click-based setup | Written code |
| Skill Required | Admin skills | Programming skills |
| Flexibility | Limited | Fully flexible |
| Speed | Faster to build | Takes time but powerful |
| Maintenance | Easy | Requires developer |

---

## Real Use Cases of Apex
- Complex fee calculation
- Payment gateway integration
- Advanced eligibility validation

---

## College Management System

### Objects
- Student__c
- Course__c
- Faculty__c
- Enrollment__c

---

### Relationships
- Student ↔ Course (Many-to-Many)
- Faculty → Course (Lookup)

---

### Validation Rules
- Email is required
- Age must be >= 17
- Seats cannot be negative

---

### Flow
- Send email after registration
- Notify faculty when course is full

---

### Apex
- Custom business logic
- Bulk data processing
- API integration

---

## When Flow is NOT Enough
- Complex calculations
- External API integration
- Large data processing

---

## Pseudocode

IF seats = 0 THEN block enrollment  
IF attendance < 75 THEN send alert  
IF marks > 90 THEN give discount  

---

## Reflection
- Apex is needed for complex logic
- Flow is for simple automation
- Coding gives flexibility
- Avoid unnecessary coding

---

## Outcome
After this day you understand:
- What Apex is
- Why Apex is needed
- Flow vs Apex difference
- Real business logic usage

---
 ## Screenshots

### Output 1
![Screenshot 1]Screenshot%202026-05-13%20215353.png

### Output 2
![Screenshot 2]Screenshot%202026-05-13%20220750.png

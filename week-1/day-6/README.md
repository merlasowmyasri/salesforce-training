# Salesforce Day 6 

---

## 1. What is SOQL?

SOQL (Salesforce Object Query Language) is used to retrieve data from Salesforce objects.
It is similar to SQL but only works inside Salesforce.
### Example:
```sql
SELECT Name FROM Student__c
```
👉 Used only for reading data from Salesforce database.

---

## 2. What is an Apex Trigger?

An Apex Trigger is a piece of code that runs automatically when a record is created, updated, or deleted.
It is used to automate business logic in Salesforce.
### Example:
When a student is registered → send welcome email automatically.

---

## 3. Flow vs Trigger (Difference Table)

| Feature | Flow | Apex Trigger |
|--------|------|--------------|
| Type | No-code / Low-code | Code-based (Apex) |
| Complexity | Simple automation | Complex logic |
| Best for | Basic automation | Advanced logic |
| UI | Drag & Drop | No UI |
| Maintenance | Easy | Developer needed |
| Speed | Fast | Powerful |
| Flexibility | Limited | Very high |

---

## 4. Before Trigger vs After Trigger

| Feature | Before Trigger | After Trigger |
|--------|----------------|--------------|
| When it runs | Before saving record | After saving record |
| Purpose | Validate / modify data | Work on saved data |
| Record ID | Not available | Available |
| Use case | Change field values | Send email, update related records |

---

## 5. Trigger Use Cases (College Management System)

- Student registration → Send welcome email  
- Course full → Notify faculty  
- Attendance < 75% → Send warning  
- Fee paid → Update payment status  
- Marks updated → Auto calculate grade  
👉 These happen automatically when data changes.

---

## 6. Query Examples (English Style)
- Find all students in Course A  
- Find students enrolled in Computer Science  
- Find students with attendance below 75%  
- Find courses handled by Faculty X  
- Find students who have not paid fees  
- Find top scoring students  

---

## 7. Why Enterprise Systems React Automatically?

Enterprise systems react automatically because:
- They handle large-scale data
- Manual work is slow and error-prone
- Real-time updates are required
- Improves efficiency and accuracy
- Reduces human dependency
- Supports scalable automation

---

## 8. Reflective Questions

### 1. Why do systems need triggers?
To automatically perform actions when data changes.

---

### 2. Difference between polling and event-driven systems

| Polling | Event-driven |
|--------|--------------|
| Continuous checking | Reacts to events |
| Wastes resources | Efficient |
| Slow response | Instant response |

---

### 3. Why are database queries important?
- Retrieve required data
- Filter records
- Support automation
- Generate reports
- Help decision making

---

### 4. When should Flows be preferred over Triggers?
- Simple automation
- No complex logic
- Business friendly setup
- Notifications and updates

---

### 5. What problems happen if automation becomes too complex?
- Hard to debug
- Performance issues
- Conflicting logic
- Maintenance difficulty
- Unexpected behavior

---

### 6. Why should developers think before automating actions?
- Avoid infinite loops
- Maintain performance
- Ensure correct logic
- Prevent duplicate actions
- Reduce system load

---

## 9. Tasks

### Task 1: Trigger Thinking (College System)

| Event | Action | Trigger Type |
|------|--------|--------------|
| Student registration | Send welcome email | Insert |
| Course full | Notify faculty | Update |
| Attendance low | Send warning | Update |
| Fee paid | Update status | Update |
| Marks updated | Calculate grade | Update |

---

### Task 2: Flow vs Trigger

| Case | Tool | Why |
|------|------|-----|
| Simple email notification | Flow | No coding needed |
| Complex fee calculation | Trigger | Needs logic |
| Update related records | Flow / Trigger | Depends on complexity |
| External API integration | Trigger | Requires coding |

---

### Task 3: Query Thinking
- Find all students in Course A  
- Find all courses handled by Faculty X  
- Find students with attendance below 75%  
- Find students in Computer Science  
- Find students who failed exams  
- Find students who did not pay fees  
- Find top performers  

---

## 10. Screenshots 
- Screenshot 1: SOQL query execution  
- Screenshot 2: Flow / Trigger output  
---

# Salesforce Placement Management System

A Salesforce Apex project focused on automating student application validation, placement statistics, and email notifications using a clean Trigger and Service Layer architecture.

## Tasks Completed Today

- Worked with the existing `Application__c` object and verified the required fields.
- Verified Application Status values: Applied, Interview Scheduled, Selected, Rejected, and Offer Accepted.
- Created and implemented `ApplicationService` for Application validation.
- Created and configured `ApplicationTrigger`.
- Implemented validation for required Application information before saving.
- Created `StatisticsService` for placement-related statistics.
- Created `NotificationService` for email notifications.
- Configured the Trigger to detect when an Application status changes to `Selected`.
- Connected `ApplicationTrigger` with `ApplicationService`, `StatisticsService`, and `NotificationService`.
- Tested Application validation successfully.
- Tested successful Application creation.
- Tested the `Applied → Selected` status change.
- Verified statistics execution through Salesforce Debug Logs.
- Successfully tested the email notification and received the email.
- Used Debug Logs to monitor Apex Trigger and Service execution.
- Followed clean Trigger architecture by keeping business logic inside dedicated Service classes.

## Architecture

Application__c  
↓  
ApplicationTrigger  
↓  
├── ApplicationService → Application Validation  
├── StatisticsService → Placement Statistics  
└── NotificationService → Email Notification

## Technologies Used

Salesforce, Apex, Apex Triggers, SOQL, Custom Objects, Custom Fields, Lookup Relationships, Picklist Fields, Salesforce Developer Console, Debug Logs, Apex Email Services, and Service Layer Architecture.

## Key Learning

Learned how Salesforce Apex Triggers work with `before insert` and `after update` events, how to use `Trigger.new` and `Trigger.oldMap`, implement validation using `addError()`, separate business logic from Trigger logic, and create dedicated Service classes for validation, statistics, and notifications. Also learned how to use Salesforce Debug Logs for monitoring and troubleshooting and how to implement email notifications using Apex. Understood how keeping Triggers small and Service classes responsible for business logic makes Salesforce applications cleaner, reusable, maintainable, and scalable.

## Submission Details

Name: Merla Sowmya Sri
Roll No: 23PA1A05F1
Day: Day-6

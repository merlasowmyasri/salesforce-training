# Day 3 - Data Modeling and Business Logic

## Difference Between Core Concepts

### App
An App is a collection of related tabs, objects, and tools used for a business purpose.

### Object
An Object is like a database table that stores related data.

Example:
- Student
- Faculty
- Course

### Record
A Record is a single row of data inside an object.

Example:
Student Name: Sowmya Sri

### Field
A Field is an individual data item in a record.

Example:
- Name
- Email
- Age

## Standard vs Custom Objects

### Standard Objects
Prebuilt Salesforce objects.

Examples:
- Account
- Contact
- Opportunity

### Custom Objects
User-created objects for specific business needs.

Examples:
- Student
- Faculty
- Department
- Course

## College Management System Data Model

### Objects
- Student
- Faculty
- Course
- Department

### Relationships
- Department → Faculty
- Department → Course
- Course → Student

### Relationship Type
Lookup Relationships are used to connect objects.

## Formula Fields

### 1. Full Name
Automatically combines first name and last name.

### 2. Percentage
Calculates student percentage automatically.

### 3. Remaining Seats
Calculates available course seats.

## Why Formula Fields?
Formula fields reduce manual work and avoid calculation mistakes.

## Validation Rules

### 1. Email cannot be empty
Prevents incomplete records.

### 2. Student age cannot be negative
Prevents invalid age values.

### 3. Course seats cannot exceed limit
Prevents overbooking.

## Why Validation Rules?
Validation rules ensure only correct data enters the system.

## Reflection
Companies need structured data because spreadsheets become messy, inconsistent, and difficult to manage at scale.

Structured enterprise systems help:
- Maintain accuracy
- Reduce errors
- Improve reporting
- Manage relationships between data

## Trailhead Work Completed
- Data Modeling
- Formulas and Validations

## Screenshots
![Screenshot 1](Screenshot 2026-05-11 104600.png)
![Screenshot 2](Screenshot 2026-05-11 111323.png)

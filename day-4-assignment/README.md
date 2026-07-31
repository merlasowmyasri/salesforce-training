# 🚀 Salesforce Interview Readiness Bootcamp – Day 4

## SALESFORCE DEVELOPER TRAINING

---

# 📌 Day 4 Overview

Day 4 focused on building my first **Lightning Web Component (LWC)** and understanding how the Salesforce UI layer works.

Until the previous sessions, I worked mainly with Salesforce backend concepts such as:

- Data Model
- SOQL
- Apex Triggers
- Automation

In Day 4, I moved to the **UI layer** using Lightning Web Components.

The overall Salesforce application architecture can be understood as:

**User → LWC → Apex → SOQL → Salesforce Database**

Day 4 mainly focused on the **LWC / UI layer**.

---

# 🎯 Learning Objectives

By completing Day 4, I learned how to:

- Understand Lightning Web Components
- Create my first LWC
- Understand the structure of an LWC
- Deploy an LWC to a Lightning Page
- Use data binding
- Handle button click events
- Change UI values using JavaScript
- Understand how LWC can communicate with Apex
- Build a simple Placement Management System UI
- Create a dashboard-style interface using LWC
- Use CSS to improve the UI
- Use Salesforce Static Resources for images

---

# 1️⃣ What is Lightning Web Components (LWC)?

Lightning Web Components (LWC) is Salesforce's modern framework for building user interfaces.

LWC is based on standard web technologies such as:

- HTML
- JavaScript
- CSS
- Modern Web Standards

It allows developers to build reusable, fast, maintainable, and interactive user interfaces that can work with Salesforce data.

---

# 2️⃣ Why did Salesforce introduce LWC?

Salesforce introduced LWC to provide a modern UI development framework based on standard web technologies.

LWC provides:

- Standard HTML
- JavaScript
- CSS
- Modern Web Standards
- Reusable components
- A simpler development model

It is easier for developers who already understand modern web development technologies.

LWC is the modern approach for developing Salesforce user interfaces.

---

# 3️⃣ Difference Between LWC and Aura Components

| LWC | Aura Components |
|---|---|
| Modern Salesforce UI framework | Older Salesforce UI framework |
| Based on Web Standards | Uses Aura-specific framework concepts |
| Uses HTML, JavaScript and CSS | Uses Aura-specific component structure |
| Lightweight and efficient | Comparatively heavier |
| Easier for developers familiar with web technologies | Requires learning Aura-specific concepts |
| Modern recommended approach | Older / legacy approach |

Therefore, LWC is preferred for modern Salesforce UI development.

---

# 4️⃣ What are the three files inside an LWC?

A basic LWC consists of three important files.

### 📄 HTML File

The HTML file is responsible for:

- Page layout
- Text
- Buttons
- UI elements
- Displaying information

### 📄 JavaScript File

The JavaScript file is responsible for:

- Logic
- Variables
- Events
- Button click handling
- Component behavior
- Communication

### 📄 Meta XML File

The Meta XML file is responsible for:

- Exposing the component
- Making the component available in Lightning App Builder
- Defining where the component can be used

A CSS file can also be included when custom styling is required.

---

# 5️⃣ Why is JavaScript required in LWC?

JavaScript provides the logic and interactivity of an LWC.

In my Day 4 component, JavaScript was used to:

- Store student details
- Store dashboard values
- Handle button clicks
- Display the welcome message
- Change application status
- Implement data binding

The complete JavaScript source code is available in the project source-code folder.

---

# 6️⃣ What is Data Binding?

Data binding connects a JavaScript property with the HTML template so that the value can be displayed dynamically.

For example, a JavaScript property can be connected to an HTML expression.

When the JavaScript value changes, the corresponding UI value can also be updated.

This allows the component to display dynamic information.

The complete implementation is available in the LWC source-code files.

---

# 7️⃣ Can LWC directly execute SOQL?

No.

LWC does not directly execute SOQL queries.

SOQL is generally executed on the Salesforce server side using Apex.

The common architecture is:

**LWC → Apex → SOQL → Salesforce Database**

---

# 8️⃣ Why does LWC need Apex?

LWC uses Apex when it needs server-side business logic or Salesforce data.

Apex can be used to:

- Execute SOQL queries
- Perform DML operations
- Apply server-side business logic
- Retrieve Salesforce records
- Send data back to the LWC

However, Day 4 focused mainly on UI functionality, so Apex was not required for the activities.

---

# 9️⃣ Where is the component deployed?

An LWC can be deployed to Salesforce and added to Lightning Pages using **Lightning App Builder**.

For Day 4, I created the `placementHome` component.

The component was exposed using the Meta XML file and then added to a Lightning Page using Lightning App Builder.

---

# 🔟 Explain the component you built today

I created a Lightning Web Component named:

**placementHome**

The component is located inside:

**force-app/main/default/lwc/placementHome**

The component contains:

- HTML
- JavaScript
- CSS
- Meta XML configuration

The component displays:

- Vishnu Placement Portal
- Student Name
- Roll Number
- Department
- Welcome Message
- Application Status
- Placement statistics

The complete source code is available separately in the repository.

---

# 🛠️ Hands-on Activities

## Activity 1 – Create First LWC

Created the Lightning Web Component **placementHome**.

Displayed the Vishnu Placement Portal welcome content and deployed the component to a Lightning Page using Lightning App Builder.

---

## Activity 2 – Display Student Details

Displayed the following student information:

- Student Name: Merla Sowmya Sri
- Roll Number: 23PA1A05F1
- Department: CSE

---

## Activity 3 – Show Welcome Message

Created a **Show Welcome Message** button.

When the button is clicked, a welcome message is displayed.

This functionality is handled using JavaScript.

---

## Activity 4 – Application Status

Initially, the component displays:

**Status: Not Applied**

When the Apply button is clicked, it changes to:

**Status: Applied**

This activity was implemented using JavaScript.

No Apex and no database connection were used.

---

# 📊 Mini Project – Placement Management System

I created the first screen of a Placement Management System.

The screen contains:

- Placement Portal
- Today's Date
- Welcome Student
- Number of Companies
- Number of Jobs
- Applications Submitted

The values were hard-coded as required for Day 4.

In future implementation, these values can be connected to Apex and Salesforce data.

---

# 🔗 Data Binding Demonstration

Data binding was implemented between JavaScript properties and the HTML template.

The component dynamically displays student information using JavaScript properties.

The complete implementation is available in the separate LWC source-code files.

---

# ⭐ Bonus Challenge

As part of the Day 4 bonus challenge, I enhanced the Placement Portal UI using Lightning Web Components.

## 🏫 1. Institute Logo

Added the Vishnu Institute of Technology logo using a Salesforce Static Resource.

---

## 🎯 2. Welcome Banner

Created a welcome banner containing:

- Placement Management System
- Welcome to Vishnu Placement Portal
- Your Career Starts Here!

---

## 📊 3. Four Dashboard Cards

Created four dashboard cards:

- Students
- Companies
- Jobs
- Applications

Each card displays a corresponding value.

---

## 👩‍🎓 4. Student Information

The page also displays:

- Student Name
- Roll Number
- Department

---

## 🛠️ Technologies Used

- Lightning Web Components
- HTML
- JavaScript
- CSS
- Salesforce Static Resources

---

## 🚫 Bonus Challenge Constraint

The bonus challenge was implemented using only LWC.

- Apex: Not Used
- SOQL: Not Used
- Database: Not Used

Only the LWC UI layer was used.

---

# 📁 Project Structure

The Day 4 LWC source code is maintained separately inside the Salesforce project.

The component contains:

- `placementHome.html`
- `placementHome.js`
- `placementHome.css`
- `placementHome.js-meta.xml`

These files contain the complete implementation of the Day 4 LWC.

---

# 💻 Source Code

The complete source code is available separately in the repository under:

**force-app → main → default → lwc → placementHome**

### Source Files

| File | Purpose |
|---|---|
| `placementHome.html` | LWC UI structure |
| `placementHome.js` | Component logic, properties and event handling |
| `placementHome.css` | Component styling |
| `placementHome.js-meta.xml` | Component configuration and targets |

No source code is duplicated inside this README.

---

# 📸 Screenshots

All Day 4 screenshots are available inside the **Screenshots** folder.

The screenshots cover:

1. Salesforce project structure
2. Lightning App Builder
3. First LWC output
4. Student details
5. Welcome message
6. Not Applied status
7. Applied status
8. Final Placement Portal
9. Data binding
10. Bonus Static Resource
11. Bonus LWC files
12. Bonus final UI

---

# 🧠 What I Learned Today

Today I learned how to build a Salesforce user interface using Lightning Web Components.

The major concepts I learned are:

- What Lightning Web Components are
- Why Salesforce introduced LWC
- Difference between LWC and Aura Components
- LWC component structure
- HTML file responsibilities
- JavaScript file responsibilities
- Meta XML file responsibilities
- Creating an LWC using VS Code
- Deploying an LWC to Salesforce
- Using Lightning App Builder
- Displaying dynamic values
- Data binding
- Handling button click events
- Changing values using JavaScript
- Creating a Placement Management System dashboard
- Using CSS to improve UI design
- Using Salesforce Static Resources
- Understanding how LWC can communicate with Apex in future

Most importantly, I understood the relationship between the Salesforce UI and backend layers:

**User → LWC → Apex → SOQL → Salesforce Database**

Day 4 mainly focused on building the **LWC / UI layer**.

---

# 💡 Key Takeaways

### Lightning Web Components
Modern Salesforce framework for creating user interfaces.

### HTML
Responsible for the structure and visual content of the UI.

### JavaScript
Responsible for logic, variables, events, and interactions.

### Meta XML
Controls component exposure and defines where the component can be used.

### CSS
Used to style and improve the appearance of the component.

### Data Binding
Connects JavaScript properties with the HTML template.

### Apex
Used when LWC needs server-side business logic or Salesforce data.

---

# 📤 Submission Details

| Field | Details |
|---|---|
| **Name** | Merla Sowmya Sri |
| **Roll Number** | 23PA1A05F1 |
| **Day** | Day-4 |
| **Topic** | Your First Lightning Web Component (LWC) |
| **Submission** | GitHub Repository |
| **Source Code** | Included separately |
| **Screenshots** | Included in Screenshots folder |
| **README** | Included |

---

# ✅ Day 4 Completion Status

- ✅ First LWC Created
- ✅ LWC Deployed to Lightning Page
- ✅ Student Details Displayed
- ✅ Welcome Message Implemented
- ✅ Application Status Implemented
- ✅ Data Binding Practiced
- ✅ Placement Portal Dashboard Created
- ✅ Bonus Challenge Completed
- ✅ Institute Logo Added
- ✅ Welcome Banner Created
- ✅ Four Dashboard Cards Created
- ✅ Screenshots Added
- ✅ README Prepared
- ✅ Source Code Added Separately
- ✅ Ready for GitHub Submission

---

# 👩‍💻 Submitted By

**Name**: Merla Sowmya Sri
**Roll Number**: 23PA1A05F1
**Day**: Day-4

---

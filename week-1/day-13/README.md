# Day 13 - DevOps, CI/CD and Enterprise Deployment

## What is CI/CD?

CI/CD stands for Continuous Integration and Continuous Deployment (or Continuous Delivery).

It is a modern software development practice that helps teams build, test, and deploy applications safely and efficiently.

### Continuous Integration (CI)

Developers frequently commit code changes to GitHub. Automated testing checks whether the changes work correctly.

### Continuous Deployment (CD)

After successful testing and validation, code is deployed to higher environments and eventually to production.

### Benefits of CI/CD

* Faster releases
* Better software quality
* Reduced deployment risks
* Automated testing
* Improved team collaboration
* Faster bug detection

---

# Why Deployment Workflow Matters

Enterprise applications are used by thousands of users and contain critical business data.

A deployment workflow helps teams:

* Prevent production failures
* Reduce downtime
* Improve reliability
* Validate changes before release
* Maintain system stability

Without a deployment process, small mistakes can affect thousands of users.

---

# Enterprise Deployment Risks

## College Management System Scenario

Suppose the system is used by:

* 50,000 students
* 500 faculty members
* Multiple administrators

### Why Directly Editing Production is Dangerous

#### Bugs

A coding mistake can break student registration or attendance tracking.

#### Downtime

Users may be unable to access the system during critical periods.

#### Broken Workflows

Automations, Flows, and integrations may stop working.

#### Data Loss

Incorrect deployments may overwrite or delete important records.

#### User Impact

Thousands of students and faculty could be affected immediately.

Because of these risks, changes should always be tested before reaching production.

---

# Problems Without Version Control

## No GitHub

Without GitHub:

* Changes cannot be tracked
* Developers may overwrite each other's work
* Rollback becomes difficult
* Collaboration becomes challenging

## No Branches

Without branches:

* Developers work on the same code simultaneously
* Conflicts increase
* Unfinished features may reach production

## No Testing

Without testing:

* Bugs enter production
* Business processes fail
* User trust decreases

## No Deployment Workflow

Without deployment workflow:

* Releases become risky
* Errors increase
* Recovery becomes difficult

---

# Team Collaboration Scenario

Suppose 10 developers work on the College Management System.

### Possible Problems

#### Developer Conflicts

Multiple developers may edit the same files.

#### Lost Work

One developer's changes may overwrite another's work.

#### Integration Issues

Different features may not work together properly.

#### Production Failures

Untested code may break important functionality.

### How GitHub Helps

* Tracks all changes
* Maintains version history
* Supports collaboration
* Enables safe code reviews

### How Branches Help

* Isolate feature development
* Prevent conflicts
* Allow safe testing before merging

### How Testing Helps

* Detects bugs early
* Improves reliability
* Protects production systems

---

# GitHub + DX + DevOps Explanation

## GitHub

GitHub provides:

* Version control
* Collaboration
* Code history
* Branch management

## Salesforce DX

Salesforce DX provides:

* Source-driven development
* Modern development workflow
* Scratch org management
* Better deployment processes

## DevOps

DevOps combines development and operations practices to improve software delivery.

Benefits include:

* Faster releases
* Better quality
* Improved collaboration
* Automated deployments

---

# CI/CD Workflow

## Step 1: Developer Writes Code

A developer creates a new feature or bug fix.

### Why Important?

New functionality and improvements are developed.

↓

## Step 2: GitHub Commit

Code changes are committed and pushed to GitHub.

### Why Important?

Changes are tracked and shared with the team.

↓

## Step 3: Automated Testing

Tests run automatically.

### Why Important?

Detects bugs before deployment.

↓

## Step 4: Validation

Deployment validation checks whether the release is safe.

### Why Important?

Prevents broken code from reaching production.

↓

## Step 5: Deployment

Validated code is deployed to target environments.

### Why Important?

Moves approved changes into the system.

↓

## Step 6: Production Release

Code becomes available to end users.

### Why Important?

Users receive new features and fixes safely.

---

# Reflection

There is a big difference between writing code and engineering enterprise software.

## Writing Code

* Focuses on solving a problem
* Usually works on a small scale
* May involve a single developer

## Engineering Enterprise Software

* Supports thousands of users
* Requires testing
* Requires deployment processes
* Requires reliability
* Requires scalability
* Requires team collaboration
* Requires maintenance and monitoring

Enterprise software engineering focuses on building reliable, secure, and maintainable systems rather than simply writing code.

---

# Revision Questions

## 1. Why is deployment workflow important?

It reduces risks and ensures safe software releases.

## 2. Why should teams avoid editing production directly?

Direct changes can cause bugs, downtime, and data loss.

## 3. What problems happen without version control?

Lost changes, conflicts, and lack of code history.

## 4. Why do enterprise systems require CI/CD?

To automate testing, improve quality, and deploy safely.

## 5. Why should testing happen before deployment?

To identify bugs before users are affected.

## 6. Why do large teams need branches?

Branches allow developers to work independently without conflicts.

## 7. What is rollback and why is it important?

Rollback restores a previous stable version if deployment fails.

## 8. Why are deployment pipelines useful?

They automate and standardize the release process.

## 9. Why is DevOps important in modern software engineering?

DevOps improves collaboration, quality, and delivery speed.

## 10. Why is enterprise software development different from simple coding?

Enterprise software requires scalability, reliability, security, testing, and teamwork.

---

# Trailhead Work Completed

* Org Development Model
* Salesforce DevOps / Deployment Workflow
* Agentforce DX
* Visualforce and Aura Review

---

## Screenshots

### Org Development Model
![Org Development Model](Screenshot%202026-06-13%20153515.png)

### Salesforce DevOps Workflow
![DevOps Workflow](Screenshot%202026-06-13%20154054.png)

### GitHub Actions / CI-CD
![GitHub Actions](Screenshot%202026-06-13%20154135.png)

### Deployment Pipeline
![Deployment Pipeline](Screenshot%202026-06-13%20154202.png)

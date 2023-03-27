# enab-x3-te-dev-015-atp-x3-project

## Bootcamp description

In this expert session you will practice and see how you can use **ATP/Jenkins** during the life of a **Sage X3 project**.

## Ideas to add in this bootcamp

```diff
- use git and github with vscode and Jenkins
```

## Outcomes

- Modeling methods and testing tools have existed for a long time and are systematically integrated into major projects, but remain unknown, expensive, and difficult to access for our customer, which nevertheless have equally strategic challenges.

- In this expert session you will **practice** and see how you can **use ATP during the life of a Sage X3 project** and more, **from the test phases** up to the **update of the solution**, as well as learn how to use ATP to **validate your addons**, your specifics (**bespoke development**) and your **verticals**. You will have the opportunity to meet and talk with Sage X3 and ATP experts.

## Use cases

Bonus , you will get the tool « script assistant »

## Agenda

**BC** = Bootcamp instruction time

**CM** = Create material

**WH** = Who Create or update material

- Brief intro to the course, define objectives, and greet students.
- **BC**: 15 min
- **CM**: 6 hours
- **WH**:
- Discussion when to use ATP in the life of a project
  - CoE Methodlogy: How to manage ATP in your project
  - Regression Testing
  - Patch Testing on X3 elements
  - Bespoke Testing to ensure any delivered Customization has been tested and proved to be working at delivery.
  - **BC**: 15 min
  - **CM**: 3 hours
  - **WH**:
- How to Build Scripts with the use of the Script Assistant.
  - Explain the Script Assistant functionalities
  - Create a template with the class for Script Assistant
  - Train the users on Script Assistant and building scripts using the tool and the template created.
  - Game 1 à N (Important) not sure how to introduce games in this course.
  - **BC**: 1.5 hours
  - **CM**: 2 days
  - **WH**:
- Use ATP during the phase of the project implementation
  - Build several scripts for automating a sequence through the life of a project.
  - Illustrate the scripts for finding errors in missing elements after a patch has been implemented.
  - Writing ATP to add bespoke elements back to their X3 implementation.
  - Building additional scripts to test the implementation by using Jenkins to test many areas in a single job. Jenkins and ATP will test all functionality in X3 lessening the need for testing personnel. (As we know, this is the big one because no one really tests appropriately)
  - **BC**: 1.5 Hours
  - **CM**: 36 hours
  - **WH**:
- Regression Testing Discussion with examples of missing field and menu element after patch.
  - Scripts - Bespoke Screen Fields.
  - Script - Bespoke Menu Element missing.
  - Script Missing ? (What else can we test for in a test phase as a customer)
    - Specific, Addons, Verticals
  - **BC**: 1 hour
  - **CM**: 12 hours
  - **WH**:
- Use ATP & Jenkins to manage Sage X3 settings between multiple environments
  - SQL server procedure examples used in Jenkins
    - Data transfer
    - Database Backup
  - Run Multiple ATP scripts from a single Folder Root in Jenkins
  - Run multiple ATP and SQL scripts together in one Job to show depth of the products capabilities.
  - **BC**: 2 hours
  - **CM**: 36 hours
  - **WH**:
- Using Variables in ATP via Cucumber layered configuration.

  - Execute multiple ATP scripts using variables from Cucumber configuration.

    - Scripts include:
      - Changing folders to copy and element from one folder to another then return to the same folder to test that the record was copied.
      - ?

  - **BC**: 45 mins
  - **CM**: 16 hours
  - **WH**:

- Q&A

## In progress to use

### Script-01

The principle is to execute a set of scripts twice.

Each time with different parameters (User stored values)

[See](./scripts-01/README.md)

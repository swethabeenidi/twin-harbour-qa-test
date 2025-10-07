# Part 1 – Friend List System Tests

### Overview
This folder contains manual and Gherkin-style test scenarios for the Friend List feature.

**Functional Areas Covered**
- Send / Accept / Reject / Withdraw / Block users Friend Requests
- Edge and Negative Scenarios (duplicate requests, blocked users, concurrent actions)

**Purpose**
These manual tests are designed in such a way that can later automated in Playwright/Cypress using a BDD framework like `Cucumber`.

**Files**
- `tests/manual/friendlist_manual_testcases.md` → full manual test list
- `tests/features/friendlist.feature` → Gherkin feature file (Tests are written in Gherkin syntax, In real automation, each scenario would be mapped to step definitions in cypress/playwright)

**Final Notes**
- The structure and test design are based on references and practices from my previous project work.  
- Manual and automated cases follow the same naming convention for traceability.
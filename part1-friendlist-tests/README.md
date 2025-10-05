# Part 1 – Friend List System Tests

### Overview
This folder contains manual and Gherkin-style test scenarios for the Friend List feature.

**Functional Areas Covered**
- Send / Accept / Reject / Withdraw Friend Requests
- Blocking users
- Edge and Negative Scenarios (duplicate requests, blocked users, concurrent actions)

**Purpose**
These manual tests are designed in such a way that can later automated in Playwright/Cypress using a BDD framework like `Cucumber`.

**Files**
- `testcases/friendlist_manual_testcases.md` → full manual test list
- `features/friendlist.feature` → Gherkin feature file
- `testcases/test_data.md` → data setup and reusable IDs

**Final Notes**
- The structure and test design are based on references and practices from my previous project work.  
- Manual and automated cases follow the same naming convention for traceability.
# Part 1 – Friendlist Tests  
This folder contains manual test cases, Gherkin feature files, and related docs for the Friendlist system.

---

- **docs/**: This folder will store any test plan documents, PDFs, or additional reference docs. (Keeping it empty for now) 
- **tests/manual/friendlist_manual_tests.md**: It Contains all manual test scenarios for the Friend List system.  
- **tests/features/friendlist.feature**: It contains Gherkin scenarios that can be automated later.

---

## Manual Test Cases - High level (File: `tests/manual/friendlist_manual_tests.md`)

The manual test cases cover the following scenarios:

1. **Send Friend Invite** – verify sending invites and PENDING status.  
2. **Accept Friend Invite** – verify friendship is established.  
3. **Reject Friend Invite** – verify no friendship is created.  
4. **Withdraw Friend Invite** – verify invite removal before acceptance.  
5. **Friendship Relation Status Check** – confirm FRIEND status for both users.  
6. **Block User** – block friends and non-friends, verify restrictions.  
7. **Unblock User** – remove BLOCKED status and allow invites again.  
8. **Edge Cases** – sending invites to self, duplicate invites, accepting withdrawn invites.

Each test case includes **Precondition**, **Steps**, and **Expected Result** to ensure complete coverage.

---

## Gherkin Feature File (File: `tests/features/friendlist.feature`)

The Gherkin feature file mirrors the manual test cases in a **BDD-ready format** which is suitable for automation:

- **Feature:** Friend List Management  
- **Scenarios Covered:**
  - Send, Accept, Reject, Withdraw Friend Invites  
  - Block and Unblock Users  
  - Prevent Self Invite and Duplicate Invites  

Each scenario uses **Given–When–Then** steps to describe the preconditions, actions, and expected outcomes, making it ready for automated testing frameworks like Cucumber.

---

## 💡 Notes
- The structure and test design are based on references and practices from my previous project work.  
- All tests are written to be easily converted into automated Playwright/Cypress scripts later.  
- Manual and automated cases follow the same naming convention for traceability.

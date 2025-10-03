# Part 1 – Friendlist Tests  
This folder contains manual test cases, Gherkin feature files, and related docs for the Friendlist system.

---

## Folder Structure

├── README.md # Overview of Part 1 – Friend List tests
├── docs/ # Test plans or reference documents (optional for Part 1)
├── tests/
│ ├── manual/ # Manual test cases (friendlist_manual_tests.md)
│ └── features/ # Gherkin feature files (friendlist.feature)


- **docs/**: This folder will store any test plan documents, PDFs, or additional reference docs.  
- **tests/manual/friendlist_manual_tests.md**: It Contains all manual test scenarios for the Friend List system.  
- **tests/features/friendlist.feature**: It contains Gherkin scenarios that can be automated later.

---

## Manual Test Cases (`tests/manual/friendlist_manual_tests.md`)

The manual test cases cover the following scenarios:

1. **Send Friend Invite** – verify sending invites and PENDING status.  
2. **Accept Friend Invite** – verify friendship is established.  
3. **Reject Friend Invite** – verify no friendship is created.  
4. **Withdraw Friend Invite** – verify invite removal before acceptance.  
5. **Friendship Relation Status Check** – confirm FRIEND status for both users.  
6. **Block User** – block friends and non-friends, enforce restrictions.  
7. **Unblock User** – remove BLOCKED status and allow invites again.  
8. **Blocked Users Restrictions** – ensure blocked users cannot send or receive invites.  
9. **Edge Cases** – sending invites to self, duplicate invites, accepting withdrawn invites.

Each test case includes **Precondition**, **Steps**, and **Expected Result** to ensure comprehensive coverage.

---

## Gherkin Feature File (`tests/features/friendlist.feature`)

The Gherkin feature file mirrors the manual test cases in a **BDD-ready format**, suitable for automation:

- **Feature:** Friend List Management  
- **Scenarios Covered:**
  - Send, Accept, Reject, Withdraw Friend Invites  
  - Block and Unblock Users  
  - Prevent Self Invite and Duplicate Invites  

Each scenario uses **Given–When–Then** steps to describe the preconditions, actions, and expected outcomes, making it ready for automated testing frameworks like Cucumber.

---

## Notes

- The folder structure is designed so developers and QA can easily access both **human-readable tests** and **automation-ready Format**.  

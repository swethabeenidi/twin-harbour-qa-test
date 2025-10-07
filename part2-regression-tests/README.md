# Part 2 – Regression Test for Known Bug (WW3 Tokens)

### Overview
This folder contains regression tests to ensure correct visibility handling and consumption expiration.
A past bug caused tokens to behave incorrectly for certain visibility and consumption combinations.

### regression Tests Covered
- All visibility types: OWN, ALLY, NEUTRAL, ENEMY  
- Both consumption types: TIME-based and EVENT-based  
- Validation of correct expiration and visibility per combination  
- One test case that would have caught the past bug

### Files
- `test-plan.md` — Design & approach
- `regression_testcases.md` — Step-by-step tests cases
- `data/token_visibility_consumption_matrix.csv` — Parameter combinations - for easy view that shows all the combinations covered
- `reports/expected_failures.md` — Failing case documentation

### Final Notes
- The structure and test design are based on references and practices from my previous project work.
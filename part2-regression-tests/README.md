# Part 2 – Regression Test for Known Bug (WW3 Tokens)

### Overview
This folder contains regression tests to ensure correct visibility handling and consumption expiration.
A past bug caused tokens to behave incorrectly for certain visibility and consumption combinations.

### regression Tests Covered
- All visibility types: own armies, allies, neutrals, enemies 
- Both consumption types: TIME-based and EVENT-based  
- Validation of correct expiration and visibility per combination  
- One test case that would have caught the past bug

### Files
- `/tests/regression_testcases.md` — Step-by-step manual tests cases
- `/docs/test-plan.md` — Test plan with design and approach explained 
- `/docs/token_visibility_consumption_matrix.csv` — Parameter combinations: for easy view that shows all the combinations covered
- `reports/expected_failures.md` — Failing test case documentation

### Final Notes
- The structure and test design are based on references and practices from my previous project work.
# Test Plan – WW3 Token Visibility and Consumption

## Objective  
Validate that all combinations of token **visibility** and **consumption** behave as intended in WW3.  
Ensure tokens appear only to the correct army groups and expire or persist according to their configuration.  
Include a regression test that reproduces the known visibility/consumption bug.

---

## Scope of Testing  
- Token visibility types  
  - **OWN** — visible only to the owner’s army  
  - **ALLY** — visible to allied armies  
  - **NEUTRAL** — visible to neutral
  - **ENEMY** — visible to opposing armies  
- Token consumption types  
  - **TIME** — automatically expires after configured duration  
  - **EVENT** — consumed by a specific event (e.g: battle, mission complete) 

---

## Known-bug
A previous issue caused tokens with certain **visibility–consumption combinations** (particularly `ALLY + EVENT`) to behave incorrectly — either disappearing too early or remaining visible after consumption.  


## Test Design  
The regression suite systematically covers:  
1. Every visibility combination (`OWN`, `ALLY`, `NEUTRAL`, `ENEMY`)  
2. Both consumption modes (`TIME`, `EVENT`)  
3. Edge transitions — just before and after expiration or battle events  
4. Multi-token and multi-army isolation  

Each test case includes:  
- Preconditions  
- Test steps  
- Expected results  
- Priority  
- Reference to the coverage matrix (`data/token_visibility_consumption_matrix.csv`)

The matrix provides a clear mapping of which viewer roles should see which tokens before and after consumption.

## Approach
1. Generate tokens using game configuration for each (visibility × consumption) combination.  
2. Create either time-based expiry (mock timer) or event-based consumption (battle).  
3. Watch final token state and visibility through UI or API.  
4. Include the known bug scenario to make sure it would have been caught.
5. Compare with expected state matrix (`token_visibility_consumption_matrix.csv`).  

## Pass/Fail Criteria
- **PASS:** Token visibility and consumption behave as per expected matrix rules.
- **FAIL:** Any combination that does not expire or remains visible incorrectly.

## Test Data & Reporting  
- Input data: Defined in `data/token_visibility_consumption_matrix.csv`.  
- Test results and logs: Stored under `reports/` with detailed outcomes and `expected_failures.md` documenting any known regressions.

## Notes
There could be more fields in a professional Test plan or regression test document, such as Risks & Mitigation, Tools & Environment, Version, severity/priority etc. Here the focus was on implementing clear regression tests that shows coverage of all visibility/consumption combinations and highlight the known bug scenario


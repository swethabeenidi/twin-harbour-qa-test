# Part 2 Test Plan  

**Title:** Token visibility & consumption regression suite  
**Date:** 2025-10-04  
**Scope:** Visibility permutations (OWN, ALLY, NEUTRAL, ENEMY) × Consumption strategies (TIME, EVENT)

## Objectives
- Verify token visibility rules for all army relations.  
- Verify tokens are consumed correctly by time-based expiry and battle events.  
- Include a regression test reproducing a historical bug.

## Test Matrix (high-level)

| TestCaseID | Visibility | ConsumptionType | ExpectedResult | Notes |
|------------|------------|----------------|----------------|-------|
| TC-001 | OWN | TIME | Token is consumed after expiry; visible to owner until consumption | Time-based consumption for owner |
| TC-002 | ALLY | TIME | Token is consumed after expiry; visible to allies until consumption | Time-based; allies can see token |
| TC-003 | NEUTRAL | TIME | Token is consumed after expiry; neutral armies cannot see token | Time-based; neutrals do not see token |
| TC-004 | ENEMY | TIME | Token is consumed after expiry; enemies cannot see token | Time-based; enemies do not see token |
| TC-005 | OWN | EVENT | Token is consumed immediately after battle event | Event-based consumption for owner |
| TC-006 | ALLY | EVENT | Token should be consumed immediately after battle event | Failing test reproducing historical bug (ally + event) |
| TC-007 | NEUTRAL | EVENT | Token should NOT be consumed | Event-based; neutral armies do not consume token |
| TC-008 | ENEMY | EVENT | Token should NOT be consumed | Event-based; enemy armies do not consume token |

## Known-bug regression test
**TC-006** — scenario that previously failed:  
- OwnerRelation: ALLY  
- ObserverRelation: ALLY  
- ConsumptionType: EVENT  
- Expectation: Token should be consumed immediately after a battle involving the allied army.  
- This repo includes a test that would have caught the bug (reproduces the historical issue where allied EVENT tokens were not consumed).


## Test Design

The regression tests are structured that covers all critical combinations of token visibility and consumption in WW3

Each test case is defined with clear preconditions, steps, expected results, and priority. The test design ensures that both the **correct behavior** and **edge cases** (such as allies seeing or consuming tokens) are captured. The matrix focuses on the key fields necessary to verify token behavior to maintain clarity for the current regression scope.
Organize tests in a **matrix format** to make visibility and consumption combinations easy to track and maintain.

## Test Approach

The goal of this regression suite is to make sure tokens in WW3 behave correctly for all important cases.  

- Check **all combinations** of who owns the token (OWN, ALLY, NEUTRAL, ENEMY) and how it is consumed (TIME or EVENT).  
- Include the **known bug scenario** (ALLY + EVENT) to make sure it would have been caught.  
- Focus on **important tests first**, like owner and ally behavior, because these affect gameplay the most.  

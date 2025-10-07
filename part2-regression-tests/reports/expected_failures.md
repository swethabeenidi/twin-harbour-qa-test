# Expected Failing Cases – WW3 Token Regression

## 1. Ally Token with Event-Based Consumption (Known Bug)

**Combination:**  
- Visibility: ALLY  
- Consumption: EVENT (triggered by battle)

**Expected Behavior:**  
- Token should be visible to allies until the event occurs.  
- After the event, the token must be removed and no longer visible to any army.

**Observed Behavior:**  
- Token remains visible to allies after the battle event → **FAIL**  


**Severity:** High  
**Reproducibility:** 100%
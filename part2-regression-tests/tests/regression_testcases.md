# Regression Test Cases – WW3 Token System

## Global Preconditions

- At least four armies exist: **Army A (owner)**, **Army B (ally)**, **Army C (neutral)**, and **Army D (enemy)**.  
- All armies are configured in the same game session or test environment.  
- The game/test environment is **reset before each test** to ensure no previous tokens or visibility states remain.  
- Token creation and visibility checks can be performed through **UI or API**.  
- All timestamps, timers, and battle events are either **mocked or controlled** to ensure clear results.  


---

### Test Case 1 (TC1) – Token Visibility and Time-Based Expiry (OWN)
**Precondition:** A valid token configuration system is available.  
**Steps:**  
1. Create a token for Army A with visibility = OWN and consumption = TIME (60 seconds).  
2. Wait for 60 seconds or simulate time passing.  
3. Check Army A’s token list through the API or UI.  
**Expected Result:**  
- The token is visible only to Army A before expiry.  
- After 60 seconds, the token expires and is removed from Army A’s list.  
- Other armies (allies, neutrals, enemies) cannot see it.

---

### Test Case 2 (TC2) – Ally Token with Time-Based Consumption
**Precondition:** A valid token configuration system is available.  
**Steps:**  
1. Create a token for Army A that is visible to its allies (Army B) with consumption = TIME (60 seconds).  
2. Check that both Army A and Army B can see the token before expiry.  
3. Wait for 60 seconds or mock expiry.  
4. Recheck both token lists.  
**Expected Result:**  
- The token is visible to both Army A and its allies until expiry.  
- After expiry, it disappears from both lists.  
- Neutral and enemy armies never see it.

---

### Test Case 3 (TC3) – Neutral Token with Time-Based Consumption
**Precondition:** Neutral armies are configured in the system.  
**Steps:**  
1. Create a token for Army A with visibility = NEUTRAL and consumption = TIME (60 seconds).  
2. Wait for 60 seconds or simulate time passing.  
3. Check token visibility for all armies.  
**Expected Result:**  
- The token is visible to neutral armies only while active.  
- After expiry, it disappears from all token lists.  
- Owner, allies, and enemies cannot see it once consumed.

---

### Test Case 4 (TC4) – Enemy Token with Time-Based Consumption
**Precondition:** Enemy armies are configured in the system.  
**Steps:**  
1. Create a token for Army A visible to enemies (Army D) with consumption = TIME (60 seconds).  
2. Wait for the expiry time.  
3. Check token visibility for Army D (enemy).  
**Expected Result:**  
- The token should no longer be visible after expiry.

---

### Test Case 5 (TC5) – Token Visibility with Event-Based Consumption (OWN)
**Precondition:** A valid event created (battle start or end) is configured.  
**Steps:**  
1. Create a token for Army A with visibility = OWN and consumption = EVENT.  
2. create the configured battle event.  
3. Check Army A’s token list after the event.  
**Expected Result:**  
- The token is visible only to Army A before the event.  
- Token is removed immediately after the event triggers.  
- No visibility for other armies.

---

### Test Case 6 (TC6) – Ally Token with Event-Based Consumption (Assumption : Known Bug Case)
**Precondition:** A valid battle event exists and is known to affect ally-visible tokens.  
**Steps:**  
1. Create a token for Army A with visibility = allies (Army B) with consumption = EVENT.  
2. create a battle event that should consume all event-based tokens.  
3. Check token visibility for Army A and Army B.  
**Expected Result:**  
- The token should be consumed immediately after the event.  
**Actual Result:**  
- Token stays visible to allies after event → **FAIL**  
**Impact:** System failed to remove token for allies, confirming past regression issue.

---

### Test Case 7 (TC7) – Neutral Token with Event-Based Consumption
**Precondition:** Neutral armies are configured in the system.  
**Steps:**  
1. Create a token for Army A with visibility = NEUTRAL and consumption = EVENT.  
2. Trigger a battle or similar event.  
3. Check token visibility for all armies after the event.  
**Expected Result:**  
- The token is visible only to neutral army before the event.  
- Token is removed immediately after the event triggers.  
- No visibility for any armies after event.

---

### Test Case 8 (TC8) – Enemy Token with Event-Based Consumption
**Precondition:** Enemy armies are configured in the system.  
**Steps:**  
1. Create a token for Army A visible to enemies (Army D) with consumption = EVENT.  
2. create a battle event that consumes tokens.  
3. Check token visibility for all armies after the event.  
**Expected Result:**  
- The token should not be visible once the event is triggered.  
- System should remove tokens after the event.  
- No token should remain active or visible to any army.

---

### Test Case 9 (TC9) – Mixed Visibility Sanity Check
**Precondition:** Multiple tokens with mixed visibility and consumption exist simultaneously.  
**Steps:**  
1. Create four tokens with the following setups:  
   - Token 1: OWN + TIME  
   - Token 2: ALLY + TIME  
   - Token 3: NEUTRAL + EVENT  
   - Token 4: ENEMY + EVENT  
2. Trigger the event and let the time-based tokens expire.  
3. Query all armies’ token lists.  
**Expected Result:**  
- Each token follows its correct consumption rules.  
- No cross-visibility mix-ups (e.g: enemy token visible to allies).  
- System logs show correct expiration and event consumption handling.

---
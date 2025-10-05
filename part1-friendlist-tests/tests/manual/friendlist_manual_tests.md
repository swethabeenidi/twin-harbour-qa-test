# Manual Test Cases – Friend List System

---

## Preconditions
- At least two registered player accounts exist (Alice, Bob) to test different friend request behaviors.  
- System is reset before each test so no previous relations exist between players.  

---

### Test Case 1 – Send Friend Invite
**Precondition:** Alice and Bob have no relation.  
**Steps:**  
Alice goes to Bob’s profile -> Clicks on **“Send Friend Invite.”**  
Verify confirmation message if appears
Check Bob’s pending invites list.  
**Expected Result:**  
Invite should appear in Bob’s pending invites list -> Status should be **PENDING.**  
Alice should see the invite in her **Sent Invites** section.

---

### Test Case 2 – Accept Friend Invite
**Precondition:** Alice has sent a friend invite to Bob.  
**Steps:**  
Bob opens **Pending Invites** -> Clicks on **“Accept.”**  
Alice checks her friend list -> Bob checks his friend list.  
**Expected Result:**  
Invite disappears from pending list -> Both Alice and Bob should appear in each other’s **Friends List.**  
Relation status becomes **FRIEND.**

---

### Test Case 3 – Reject Friend Invite
**Precondition:** Alice has sent a friend invite to Bob.  
**Steps:**  
Bob opens **Pending Invites** -> Clicks **“Reject.”**  
Alice checks her sent invites.  
**Expected Result:**  
Invite disappears from both sides
System should not change status to FRIEND -> Optional message: *“Invite declined.”*

---

### Test Case 4 – Withdraw Friend Invite
**Precondition:** Alice has sent a friend invite to Bob (pending).  
**Steps:**  
Alice opens **Sent Invites** -> Clicks **“Withdraw Invite.”**  
Bob refreshes his **Pending Invites.**  
**Expected Result:**  
Invite should disappears immediately from both sides 

---

### Test Case 5 – Send Invite When Already Friends (Duplicate Invite)
**Precondition:** Alice and Bob are already FRIENDS.  
**Steps:**  
Alice goes to Bob’s profile -> Tries to click **“Send Friend Invite.”**  
**Expected Result:**  
System blocks the action and Shows message *“Already friends.”*  
No new invite created

---

### Test Case 12 – Block (already Existing Friend)
**Precondition:** Alice and Bob are FRIENDS.  
**Steps:**  
Alice goes to Bob’s profile from **Friends List** -> Clicks **“Block User.”**  
Bob refreshes his **Friends List** -> Attempts to send new invite.  
**Expected Result:**  
Friendship immediately removed -> Relation changes to **BLOCKED.**  
Bob cannot send new invites or messages -> System shows *“You cannot add this player.”*

---

### Test Case 6 – Send Invite When Blocked
**Precondition:** Bob has BLOCKED Alice.  
**Steps:**  
Alice goes to Bob’s profile -> Clicks **“Send Friend Invite.”**  
**Expected Result:**  
Action Should not possible and System should show error message *“You cannot add this player.”*  
No invite created and Relation remains **BLOCKED.**

---

### Test Case 7 – Block User After Sending Invite
**Precondition:** Alice sent a friend invite to Bob (pending).  
**Steps:**  
Bob opens **Pending Invites** -> Clicks **“Block User.”**  
Alice checks **Sent Invites.**  
**Expected Result:**  
Pending invite disappears from both users and Relation becomes **BLOCKED.**  
Alice can no longer send new invites to Bob until unblocked.

---

### Test Case 8 – Unblock and Re-send Invite
**Precondition:** Bob previously BLOCKED Alice.  
**Steps:**  
Bob opens **Blocked Users** -> Clicks **“Unblock.”**  
Alice sends new friend invite -> Bob opens **Pending Invites.**  
**Expected Result:**  
Unblock successful and Alice’s new invite appears in Bob’s list with status **PENDING.**  
System allows invite only after unblock is confirmed.

---

### Test Case 9 – Concurrent (Cross) Invites
**Precondition:** Alice and Bob have no relation.  
**Steps:**  
Alice sends a friend invite to Bob -> At the same time Bob sends a friend invite to Alice.  
Both refresh friend lists.  
**Expected Result:**  
System should handle simultaneous actions.  
Final relation becomes **FRIEND** and No duplicate pending invites remain.

---

### Test Case 10 – Remove Friend
**Precondition:** Alice and Bob are FRIENDS.  
**Steps:**  
Alice opens **Friends List** -> Clicks **“Remove Friend.”**  
Bob refreshes his **Friends List.**  
**Expected Result:**  
Both users are removed from each other’s list -> Relation becomes **NONE.**  
System confirms removal with success message -> Either can send new invite later.

---

## Edge Cases

### Test Case 1 – Maximum Friend Limit
**Precondition:** Alice has reached system’s max friend limit (e.g., 100).  
**Steps:**  
Alice attempts to send a new invite to Bob.  
**Expected Result:**  
Invite not sent and error Message displayed eg: *“Friend list full.”*  

---

### Edge Case 2 – Send Invite to Deleted or Inactive Account
**Precondition:** Alice is active, Bob’s account is deleted/inactive.  
**Steps:**  
Alice tries to send invite to Bob.  
**Expected Result:**  
Action should not be possible and Shows error message  eg:“This account is not available.” 
No invite created.

---

### Test Case 3 – Attempt to Add Self
**Precondition:** Alice is logged into her account.  
**Steps:**  
Alice searches her own profile -> Clicks **“Send Friend Invite.”**  
**Expected Result:**  
System blocks action -> Shows message *“Cannot add yourself.”*  
No record created or status changed.
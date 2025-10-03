# Part 1 – Friend List Manual Test Cases

## Test Case 1 – Send Friend Invite
**Precondition:** User A and User B are registered players(both players should login and have registered).  
**Steps:**
1. User A go to the to User B’s profile -> Clicks on “Send Friend Invite.”
2. Verify confirmation message if appears.  
3. Check User B’s pending invites list.  
**Expected Result:** Invite should appears in User B’s pending invites list. Status should be PENDING.  

---

## Test Case 2 – Accept Friend Invite
**Precondition:** User A has sent a friend invite to User B.  
**Steps:**
1. User B opens pending invites -> Clicks on “Accept.” 
2. Verify both User A and User B have relation status FRIEND.  
**Expected Result:** Friend relation is now showed and invite disappears from pending list.  

---

## Test Case 3 – Reject Friend Invite
**Precondition:** User A has sent a friend invite to User B.  
**Steps:**
1. User B opens pending invites -> Clicks “Reject.”  
2. Verify User A sees invite as rejected or removed from the list.  
**Expected Result:** Relation status should not change to FRIEND. Invite is removed from pending list.  

---

## Test Case 4 – Withdraw Friend Invite
**Precondition:** User A sent a friend invite to User B, that has not yet accepted by user B.  
**Steps:**
1. User A opens sent invites list.  
2. Clicks “Withdraw” on the pending invite.
3. Verify User B no longer sees the invite.
**Expected Result:** Invite not shown in both users’s lists.

---

## Test Case 5 – Block User (not a friend)
**Precondition:** User C is not a friend of User A.  
**Steps:**
1. User A navigates to User C’s profile ->  Clicks “Block.”
2. Verify relation status changed to BLOCKED.  
**Expected Result:** User C cannot send invites or messages to User A and and blocked rules & restrictions should apply

---

## Test Case 6 – Block User (friend)
**Precondition:** User A and User B are friends.  
**Steps:**
1. User A navigates to User B’s profile -> Clicks “Block.”  
2. Verify status changes to BLOCKED from FRIEND.  
**Expected Result:** both Users no longer see each other in friends list and blocked rules & restrictions should apply.  

---

## Test Case 7 – Unblock User
**Precondition:** User A has already blocked User B.  
**Steps:**
1. User A opens blocked users list -> Clicks “Unblock” on User B.  
**Expected Result:** User A and B can now send friend invites to each other and BLOCKED status is removed.  

---

## Edge cases
## Test Case 8 – Send Invite to Self
**Precondition:** User A is logged in.  
**Steps:**
1. User A go to the to own profile.  
2. Attempts to send friend invite.  
**Expected Result:** Action could not be performed and appropriate error message displayed.  

---

## Test Case 9 – Duplicate Invite
**Precondition:** User A has already sent a friend invite to User B.  
**Steps:**
1. User A tries to send another invite to User B.  
**Expected Result:** Duplicate invite should not be possible and warning message displayed.  

---

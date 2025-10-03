# Part 1 – Friend List Manual Test Cases

## Test Case 1 – Send Friend Invite
**Precondition:** User A and User B are registered players.  
**Steps:**
1. User A navigates to User B’s profile.  
2. Clicks “Send Friend Invite.”  
3. Verify confirmation message appears.  
4. Check User B’s pending invites list.  
**Expected Result:** Invite appears in User B’s pending invites list. Status is PENDING.  

---

## Test Case 2 – Accept Friend Invite
**Precondition:** User A has sent a friend invite to User B.  
**Steps:**
1. User B opens pending invites.  
2. Clicks “Accept.”  
3. Verify both User A and User B have relation status FRIEND.  
**Expected Result:** Friend relation is established; invite disappears from pending list.  

---

## Test Case 3 – Reject Friend Invite
**Precondition:** User A has sent a friend invite to User B.  
**Steps:**
1. User B opens pending invites.  
2. Clicks “Reject.”  
3. Verify User A sees invite as rejected or removed.  
**Expected Result:** Relation status does not become FRIEND. Invite is removed from pending list.  

---

## Test Case 4 – Withdraw Friend Invite
**Precondition:** User A has sent a friend invite to User B, not yet accepted.  
**Steps:**
1. User A opens sent invites list.  
2. Clicks “Withdraw” on the pending invite.  
3. Verify User B no longer sees the invite.  
**Expected Result:** Invite disappears from both users’ lists. No relation is created.  

---

## Test Case 5 – Friendship Relation Status Check
**Precondition:** Users A and B have accepted the friend invite.  
**Steps:**
1. Open User A’s friends list.  
2. Open User B’s friends list.  
**Expected Result:** Both users show each other as FRIEND.  

---

## Test Case 6 – Block User (non-friend)
**Precondition:** User C is not a friend of User A.  
**Steps:**
1. User A navigates to User C’s profile.  
2. Clicks “Block.”  
3. Verify relation status becomes BLOCKED.  
**Expected Result:** User C cannot send invites or messages to User A.  

---

## Test Case 7 – Block User (friend)
**Precondition:** User A and User B are friends.  
**Steps:**
1. User A navigates to User B’s profile.  
2. Clicks “Block.”  
3. Verify friendship is removed and status becomes BLOCKED.  
**Expected Result:** Users no longer see each other in friends list; blocked restrictions apply.  

---

## Test Case 8 – Unblock User
**Precondition:** User A has blocked User B.  
**Steps:**
1. User A opens blocked users list.  
2. Clicks “Unblock” on User B.  
**Expected Result:** User B can now send friend invites; BLOCKED status is removed.  

---

## Test Case 9 – Blocked Users Restrictions
**Precondition:** User A has blocked User B.  
**Steps:**
1. User B tries to send a friend invite to User A.  
2. User A tries to send a friend invite to User B.  
**Expected Result:** No invites can be sent in either direction while blocked.  

---

## Test Case 10 – Send Invite to Self
**Precondition:** User A is logged in.  
**Steps:**
1. User A navigates to own profile.  
2. Attempts to send friend invite.  
**Expected Result:** Action is prevented; appropriate message displayed.  

---

## Test Case 11 – Duplicate Invite
**Precondition:** User A has already sent a friend invite to User B.  
**Steps:**
1. User A attempts to send another invite to User B.  
**Expected Result:** Duplicate invite is prevented; warning message displayed.  

---

## Test Case 12 – Accept Withdrawn Invite
**Precondition:** User A sent an invite to User B, then withdrew it.  
**Steps:**
1. User B attempts to accept the withdrawn invite.  
**Expected Result:** Invite no longer exists; action not possible.  

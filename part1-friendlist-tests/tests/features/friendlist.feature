

Feature: Friend List System
  Players can manage friendships and blocking actions between accounts.

  Background:
    Given player "Alice" exists
    And player "Bob" exists
    And no existing relation between "Alice" and "Bob"

  Scenario: Send Friend Invite
    When "Alice" sends a friend invite to "Bob"
    Then "Bob" should see an invite with status "PENDING" in his pending invites list
    And "Alice" should see "Bob" in her sent invites

  Scenario: Accept Friend Invite
    Given "Alice" has sent a friend invite to "Bob"
    When "Bob" accepts the invite
    Then both "Alice" and "Bob" should appear in each other's friend list
    And the relation status should be "FRIEND"

  Scenario: Reject Friend Invite
    Given "Alice" has sent a friend invite to "Bob"
    When "Bob" rejects the invite
    Then the invite should disappear from both users' lists
    And no friendship relation should be created
    And a message "Invite declined/rejected" should be shown

  Scenario: Withdraw Friend Invite
    Given "Alice" has sent a friend invite to "Bob"
    When "Alice" withdraws the invite
    Then the invite should disappear from both users' lists

  Scenario: Send Invite When Already Friends
    Given "Alice" and "Bob" are already friends
    When "Alice" tries to send another invite to "Bob"
    Then the system should show "Already friends"
    And no new invite should be created

  Scenario: Block Existing Friend
    Given "Alice" and "Bob" are friends
    When "Alice" blocks "Bob"
    Then the relation status should change to "BLOCKED"
    And both "Alice" and "Bob" cannot send new invites or messages
    And the system should show "You cannot add this player"

  Scenario: Block Not a Friend
    Given "Alice" and "Bob" have no existing relation
    When "Alice" blocks "Bob"
    Then the relation status should change to "BLOCKED"
    And both "Alice" and "Bob" cannot send new invites or messages
    And the system should show "You cannot add this player"

  Scenario: Block User After Sending Invite
    Given "Alice" has sent a pending friend invite to "Bob"
    When "Bob" blocks "Alice"
    Then the pending invite should disappear from both users
    And the relation becomes "BLOCKED"
    And "Alice" cannot send new invites to "Bob" until unblocked

  Scenario: Unblock and Re-send Invite
    Given "Bob" previously blocked "Alice"
    When "Bob" unblocks "Alice"
    And "Alice" sends a new friend invite
    Then the new invite should appear in "Bob's" pending list with status "PENDING"

  Scenario: Concurrent (Cross) Invites
    Given "Alice" and "Bob" have no existing relation
    When both send a friend invite to each other at the same time
    Then the system should create a single friendship relation
    And no duplicate pending invites should remain

  Scenario: Maximum Friend Limit
    Given "Alice" has reached the maximum friend limit
    When "Alice" tries to send a new invite
    Then the system should show "Friend list full"
    And no new invite should be sent

  Scenario: Send Invite to Deleted or Inactive Account
    Given "Bob's" account is deleted or inactive
    When "Alice" tries to send an invite to "Bob"
    Then the system should show "This account is not available"
    And no invite should be created

  Scenario: Send Invite to Self
    Given "Alice" is logged into her own account
    When "Alice" tries to send a friend invite to herself
    Then the system should show "Cannot add yourself"
    And no relation should be created

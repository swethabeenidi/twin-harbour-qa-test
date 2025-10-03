Feature: Friend List Management
  As a registered player
  I want to manage friend invites and blocks
  So that I can build and control my friend network

  Scenario: Send Friend Invite
    Given User A and User B are registered players
    When User A sends a friend invite to User B
    Then User B should see the invite in their pending invites list
    And the invite status should be PENDING

  Scenario: Accept Friend Invite
    Given User A has sent a friend invite to User B
    When User B accepts the invite
    Then both User A and User B should have relation status FRIEND

  Scenario: Reject Friend Invite
    Given User A has sent a friend invite to User B
    When User B rejects the invite
    Then no friendship relation should be created
    And the invite is removed from pending invites

  Scenario: Withdraw Friend Invite
    Given User A has sent a friend invite to User B
    When User A withdraws the invite
    Then the invite should disappear from both users lists
    And no relation is created

  Scenario: Block User
    Given User A wants to block User B
    When User A blocks User B
    Then the relation status should be BLOCKED
    And User B cannot send invites or messages to User A

  Scenario: Unblock User
    Given User A has blocked User B
    When User A unblocks User B
    Then User B can send friend invites to User A
    And the BLOCKED status is removed

  Scenario: Prevent Self Invite
    Given User A is logged in
    When User A attempts to send an invite to themselves
    Then the system prevents the action
    And displays an appropriate message

  Scenario: Prevent Duplicate Invite
    Given User A has already sent an invite to User B
    When User A tries to send another invite
    Then the system prevents the duplicate invite
    And displays a warning message

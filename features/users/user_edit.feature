Feature: Edit User
  As a registered user of the website
  I want to edit my user profile
  so I can change my username

    Scenario: I sign in and edit my account details
      Given I am logged in
      When I edit my account details
      Then I should see an account edited message

    Scenario: I sign in and edit my account email
      Given I am logged in
      When I edit my account email
      Then I should see an email update confirmation messasge

     



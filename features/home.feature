Feature: Visit Home
  In order to login
  As a guest
  I want to login

  Scenario: Login with username
    Given a user with
      | username | email          | password |
      | testuser | user@email.com | secret   |
    Given I am a guest
    When  I go to root page
     And  I fill in 'login' with 'testuser'
     And  I fill in 'password' with 'secret'
     And  I press 'Login'
    Then  I should be on my profile page

  Scenario: Login with email
    Given a user with
      | username | email          | password |
      | testuser | user@email.com | secret   |
    Given I am a guest
    When  I go to root page
     And  I fill in 'login' with 'user@email.com'
     And  I fill in 'password' with 'secret'
     And  I press 'Login'
    Then  I should be on my profile page
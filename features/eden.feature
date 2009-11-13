Feature: Logging In to an SSO Account
  In order have a working website
  As an website viewer
 
  Scenario: I visit the homepage (GET /)
    When I request the home page
    Then I should see "Different is good"

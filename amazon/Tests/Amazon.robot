*** Settings ***
Documentation  This is some basic info about the whole suite
Resource  F:/RobotScripts/amazon/Resources/AmazonApp.robot
Resource  F:/RobotScripts/amazon/Resources/Common.robot
Suite Setup  Insert the Test Data
Test Setup  Begin Web Test
Test Teardown  End Web Test
Suite Teardown  Clear the Test Data
Resource  F:/RobotScripts/amazon/Resources/Variables.robot
# Copy/paste the line below into Terminal to execute:
# robot -d results tests/amazon.robot

*** Variables ***
${BROWSER} =   ie
${URL} =   http://www.amazon.com
${SEARCH_TERM} =   Ferrari 458

*** Test Cases ***
User must sign in to check out
    [Documentation]  Sign in on checkout process
    #  TODO add some more tags to the test case
    [Tags]  Smoke
    AmazonApp.Search For Products
    AmazonApp.Select product from search results
    AmazonApp.Add product to cart
    AmazonApp.Begin Checkout

User can search products
    [Documentation]  Search Products
    [Tags]  Smoke
    AmazonApp.Search For Products

Varibles Precedence Example
    [Documentation]  Search Products
    [Tags]  Current
    Log  ${BROWSER}

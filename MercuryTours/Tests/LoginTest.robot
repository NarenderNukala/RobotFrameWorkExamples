*** Settings ***
Documentation  This is suite related to Login Functionality
Resource  ../Resources/AdvantageOnline.robot
Resource  ../Resources/Common.robot
Library    SeleniumLibrary
Test Setup    Begin Web Test
Test Teardown    End Web Test


*** Test Cases ***
Login into the AdvantageOnline application
    Verify Successful Login Functionality

Login into the application with Invalid Credentials
    Verify Login Functionality With Invalid Credentials

*** Keywords ***




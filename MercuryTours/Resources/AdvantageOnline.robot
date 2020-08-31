*** Settings ***
Resource    ../Resources/PageObjects/LoginPage.robot
Resource    Common.robot
Resource    Variables.robot

*** Variables ***


*** Keywords ***
Verify Successful Login Functionality
    Launch the URL
    Click on the SignIn Image
    Enter UserName    ${USERNAME}
    Enter Password    ${PASSWORD}
    Click on SignIn Button
    Verify the login functionality

Verify Login Functionality With Invalid Credentials
    Launch the URL
    Click on the SignIn Image
    Enter UserName    ${INVALIDUSERNAME}
    Enter Password    ${INVALIDPASSWORD}
    Click on SignIn Button
    Verify the Login Error Message
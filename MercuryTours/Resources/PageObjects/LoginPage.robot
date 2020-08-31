*** Settings ***
Library    SeleniumLibrary
Resource    ../Variables.robot

*** Variables ***
${SignIn_Img} =    xpath=//*[@id='menuUser']
${UserName_txt} =    xpath=//input[@name='username']
${Password_txt} =    xpath=//input[@name='password']
${SignIn_btn} =    xpath=//button[@id='sign_in_btnundefined']
${SignInUser_txt} =   xpath=//a[@id="menuUserLink"]/span
${SignInErrorMsg_txt} =    css=#signInResultMessage
${SignInErrorMsg} =    Incorrect user name or password.

*** Keywords ***
Click on the SignIn Image
    wait until page contains element    ${SignIn_Img}    10s
    Click Element  ${SignIn_Img}
    Sleep    3s

Enter UserName
    [Arguments]    ${userName}
    Input Text    ${UserName_txt}    ${userName}

Enter Password
    [Arguments]    ${password}
    Input Text    ${Password_txt}    ${password}

Click on SignIn Button
    Click Button   ${SignIn_btn}
    Sleep    3s

Verify the Login Functionality
    Element Text Should Be  ${SignInUser_txt}  ${USERNAME}

Verify the Login Error Message
    Element Text Should Be  ${SignInErrorMsg_txt}  ${SignInErrorMsg}
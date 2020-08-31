*** Settings ***
Library  SeleniumLibrary
Resource    Variables.robot

*** Variables ***

*** Keywords ***
Begin Web Test
    Open Browser  about:blank  ${BROWSER}
    Maximize Browser Window

End Web Test
    Close Browser

Launch the URL
    Go to    ${APPURL}
    Sleep    10s
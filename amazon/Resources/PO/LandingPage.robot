*** Settings ***
Library  SeleniumLibrary

*** Variables ***


*** Keywords ***
Load
    Go To  ${URL}

Verify Page Loaded
    Wait Until Page Contains  Today's Deals
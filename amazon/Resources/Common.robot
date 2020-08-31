*** Settings ***
Library  SeleniumLibrary

*** Variables ***

*** Keywords ***
Begin Web Test
    Open Browser  about:blank  ${BROWSER}
    Maximize Browser Window

End Web Test
    Close Browser

Insert the Test Data
    Insert UI Data
    Insert DB Data

Clear the Test Data
    Log  Clear the Test Data

Insert UI Data
    Log  Inserted the UI Data

Insert DB Data
    Log  Inserted the DB Data
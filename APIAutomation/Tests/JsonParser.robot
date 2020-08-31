*** Settings ***
Library    JSONLibrary
Library    os
Library    Collections

*** Variables ***


*** Test Cases ***
Getting values from JSON
    ${json_obj} =   load json from file     F:/RobotScripts/Example.json

    ${name_value} =     get value from json     ${json_obj}     $.firstName
    should be equal     ${name_value[0]}    Naren

    ${street_value} =   get value from json     ${json_obj}     $.address.streetAddress
    should be equal     ${street_value[0]}  Road Num 2

    ${faxnumber} =   get value from json     ${json_obj}     $.phoneNumber[1].number
    should be equal     ${faxnumber[0]}  9882546423


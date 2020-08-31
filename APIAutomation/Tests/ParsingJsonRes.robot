*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    os
Library    Collections

*** Variables ***
${baseURL} =    https://restcountries.eu

*** Test Cases ***
Get Country Information
    create session      mySession   ${baseURL}
    ${response} =   get request     mySession   /rest/v2/alpha/IN

    ${json_object} =    to json     ${response.content}

    #Single Data Validation
    ${name} =   get value from json     ${json_object}      $.name
    should be equal    ${name[0]}      India
    log to console      ${name[0]}

    #Single Data Validation in array
    ${boardername} =   get value from json     ${json_object}      $.borders[0]
    should be equal    ${boardername[0]}      AFG

    #Array Data Validation
    ${boardernames} =   get value from json     ${json_object}      $.borders
    log to console     ${boardernames[0]}
    ${expValues} =  convert to string   ${boardernames[0]}
    should be equal     ${expValues}      ['AFG', 'BGD', 'BTN', 'MMR', 'CHN', 'NPL', 'PAK', 'LKA']
    should contain any      ${boardernames[0]}      AFG     BGD     BTN     MMR
    should not contain any      ${boardernames[0]}      US     UK


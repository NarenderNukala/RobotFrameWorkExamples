*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${baseURL} =        http://restapi.demoqa.com

#Basic Authentication           We need to pass Username & Password
#Bearer Authentication          We need to pass Token
#API key authentication

*** Test Cases ***
Basic Authentication Example
    ${auth} =           create list     ToolsQA         TestPassword
    create session      MySession       ${baseURL}      auth=${auth}
    ${response} =       get request     MySession       /authentication/CheckForAuthentication/

    log to console      ${response.content}
    should be equal as strings      ${response.status_code}     200

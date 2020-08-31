*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}     http://jsonplaceholder.typicode.com
#guru99.com/postman-tutorial.html#4

*** Test Cases ***
Get Users Information
    create session  getSessionEx   ${base_url}
    ${response} =   get request     getSessionEx   /users
    log to console  ${response.status_code}
    #log to console  ${response.content}
    #log to console  ${response.headers}

    ${status_code} =    convert to string   ${response.status_code}
    Should be equal     ${status_code}   200

    ${contentTypeValue} =   get from dictionary     ${response.headers}     Content-Type
    Log to console       ${contentTypeValue}
    Should be equal      ${contentTypeValue}    application/json; charset=utf-8


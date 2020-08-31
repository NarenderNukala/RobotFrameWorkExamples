*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${baseURL} =        http://jsonplaceholder.typicode.com

*** Test Cases ***
Header validations
    create session      mySession       ${baseURL}
    ${response} =       get request     mySession   /photos

    log to console          ${response.headers}
    ${contentType} =        get from dictionary     ${response.headers}         Content-Type
    should be equal         ${contentType}          application/json; charset=utf-8

    ${contentEncoding} =        get from dictionary     ${response.headers}         Content-Encoding
    should be equal             ${contentEncoding}      gzip


Cookie Validation
    create session      mySession       ${baseURL}
    ${response} =       get request     mySession   /photos

    log to console          ${response.cookies}
    ${cookieValue} =        get from dictionary     ${response.cookies}     __cfduid
    log to console          ${cookieValue}
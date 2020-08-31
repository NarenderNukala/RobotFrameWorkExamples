*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections

*** Variables ***
${baseURL} =    http://thetestingworldapi.com/

*** Test Cases ***
Creating new resource
    create session      addData     ${baseURL}
    ${body} =   create dictionary   first_name=Testing  middle_name=A   last_name=World     date_of_birth=12/12/1990
    ${headers} =    create dictionary   Content-Type=application/json

    ${response} =   post request    addData     /api/studentsDetails    data=${body}    headers=${headers}
    log to console      ${response.status_code}
    log to console      ${response.content}
    ${code} =   convert to string   ${response.status_code}
    should be equal    ${code}     201
*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem      #to read the text from files

*** Variables ***
${baseURL} =        https://certtransaction.elementexpress.com
${bearerToken} =    "Bearer E4F284BFADA11D01A52508ED7B92FFD7EE0905659F5DED06A4B73FC7739B48A287648801"

*** Test Cases ***
Bearer Authentication Test
    create session      mySession       ${baseURL}
    ${headers} =        create dictionary       Authorization=${bearerToken}        Content-Type=text/xml

    ${requestBody} =    get file        F:/Robot/PostData.txt

    ${response} =   post request        mySession       /       data=${requestBody}     headers=${headers}
    log to console      ${response.status_code}
    log to console      ${response.content}


*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}     http://restapi.demoqa.com
${city}         Hyderabad

#https://jsonpathfinder.com/
#http://jsonpath.com/

*** Test Cases ***
Post Req Customer Registration
    create session      myPostSession   ${base_url}/customer
    ${body} =   create dictionary   FirstName=Raj1234    LastName=Raj1234     UserName=Raj1234  Password=Raj1234    Email=Raj1234@gmail.com
    #content type is mandatory
    ${header} =     create dictionary   Content-Type=application/json

    ${response} =   post request        myPostSession   /register   data=${body}    headers=${header}
    Log to console      ${response.status_code}
    Log to console      ${response.content}

    #Validations
    ${status_code} =    convert to string   ${response.status_code}
    Should be equal     ${status_code}   201

    ${res_body} =   convert to string   ${response.content}
    should contain  ${res_body}     OPERATION_SUCCESS
    should contain  ${res_body}     Operation completed successfully


Get Req Weather Information of City
    create session  myGetSession   ${base_url}
    ${response} =   get request     mySession   /utilities/weather/city/${city}
    log to console  ${response.status_code}
    log to console  ${response.content}
    log to console  ${response.headers}

    ${status_code} =    convert to string   ${response.status_code}
    Should be equal     ${status_code}   200

    ${body} =   convert to string   ${response.content}
    Should contain      ${body}     ${city}

    ${contentTypeValue} =   get from dictionary     ${response.headers}     Content-Type
    Should be equal    ${contentTypeValue}    application/json


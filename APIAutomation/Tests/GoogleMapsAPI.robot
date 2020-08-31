*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${baseURL} =     https://maps.googleapis.com
${reqURI}  =     /maps/api/place/nearbysearch/json?
#${reqURI}  =     /maps/api/place/nearbysearch/xml?

*** Test Cases ***
GoogleMap places API
    create session      mySession       ${baseURL}
    ${params} =     create dictionary   location=-33.8670522,151.1957362   radius=500   types=food  name=harbour    key=AIzasyDfF7_uf-cLJxM9SqZcoipt0RjoWRK5uQ4
    ${response} =   get request     mySession   ${reqURI}       params=${params}

    log to console      ${response.status_code}
    log to console      ${response.content}

*** Settings ***
Library    XML
Library    os
Library    Collections

*** Variables ***


*** Test Cases ***
Parsing the XML file
    ${xml_obj} =    parse xml   F:/RobotScripts/Emp.xml

    #Check the single element value
    #Directly getting element text
    ${empName} =    get element text    ${xml_obj}      .//employee[1]/firstname
    log to console      ${empName}
    should be equal     ${empName}      Naren

    #Getting Element object and then text value
    ${empNameElement} =     get element     ${xml_obj}      .//employee[1]/firstname
    should be equal     ${empNameElement.text}     Naren

    #Using element text method
    element text should be      ${xml_obj}      Naren       .//employee[1]/firstname

    #finding the Number of element
    ${numOfElements} =      get element count           ${xml_obj}      .//employee
    log to console      ${numOfElements}
    should be equal as integers     ${numOfElements}    3

    #validating the attribute
    element attribute should be     ${xml_obj}      id      br134       .//employee[3]

    #check values of child elements
    ${empChildEle} =    get child elements      ${xml_obj}      .//employee[1]
    should not be empty     ${empChildEle}
    ${fname} =      get element text        ${empChildEle[0]}
    ${lname} =      get element text        ${empChildEle[1]}
    ${title} =      get element text        ${empChildEle[2]}
    should be equal     ${fname}    Naren
    should be equal     ${lname}    Nukala
    should be equal     ${title}    Engineer

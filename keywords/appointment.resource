*** Settings ***
Library    SeleniumLibrary
Library    Collections


*** Keywords ***
Select From List By Partial Value
    [Documentation]    use for getting list value with contains word
    [Arguments]    ${locator}    ${partial_value}

    Wait Until Element Is Visible    ${locator}
    
    ${options}=    Get List Items    ${locator}
    
    FOR    ${option}    IN    @{options}
        IF    '${partial_value}' in '${option}'
            Select From List By Value    ${locator}    ${option}
            Exit For Loop
        END
            
    END


Select Health Program
    [Documentation]    for selecting health program, use with insert bookin data keywords.
    ...    [medicare,medicaid]
    [Arguments]    ${program}
    ${locator}=    Get From Dictionary    ${HEALTH_PROGRAM}    ${program}
    Click Element    ${locator}

    
Insert Booking Data
    [Documentation]    for inserting data.
    [Arguments]    ${facility_n}="Tokyo"    ${readmission_n}=${None}    ${healthcare_n}=no    ${comment_n}=${None}    ${visit_date_n}=${None}

    ${data_set}=    Create List    ${facility_n}    ${readmission_n}    ${healthcare_n}    ${comment_n}    ${visit_date_n}   
    
    Run Keyword If    '${facility_n}' != '${None}'    Select From List By Partial Value    ${FACILITY}    ${facility_n} 

    Run Keyword If    '${readmission_n}' != '${None}'    Click Element    ${READMISSION}

    Select Health Program    ${healthcare_n}

    Run Keyword If    '${comment_n}' != '${None}'    Input Text    ${COMMENT_AREA}    ${comment_n}
    
    ${input_date}=    Run Keyword If    '${visit_date_n}' == '${None}'    Get Current Date    result_format=%d/%m/%Y    ELSE    Set Variable    ${visit_date_n}
    Input Text    ${VISIT_DATE}    ${input_date}


    Click Element    ${SUBMIT_APPOINTMENT}
*** Settings ***
Library    SeleniumLibrary

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


Insert Booking Data
    [Documentation]    for inserting data.
    [Arguments]    ${facility_n}=${None}    ${readmission_n}=${None}    ${healthcare_n}=${None}    ${visit_date_n}=${None}    ${comment_n}=${None}

    IF    '${facility_n}' != '${None}'
        Select From List By Partial Value    ${FACILITY}    ${facility_n}  
    END    


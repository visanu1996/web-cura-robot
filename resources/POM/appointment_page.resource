*** Settings ***
Library    Browser  
Library    DateTime  
Library    Collections
*** Variables ***
${APPOINT_WELCOME}    //h2[.='Make Appointment']
${FACILITY}    id=combo_facility    # facility to select.
&{FACILITY_CHOICE}    tokyo=Tokyo CURA Healthcare Center
...                   hongkong=Hongkong CURA Healthcare Center
...                   seoul=Seoul CURA Healthcare Center

${READMISSION}    id=chk_hospotal_readmission    # a check box.
&{HEALTH_PROGRAM}    medicare=id=radio_program_medicare    medicaid=id=radio_program_medicaid    no=id=radio_program_none
${VISIT_DATE}    id=txt_visit_date   # date pick
${COMMENT_AREA}    id=txt_comment    # for commentation.
${SUBMIT_APPOINTMENT}    id=btn-book-appointment    # click appointment.



# Confirmation page.
${CONFIRMATION}    //h2[.='Appointment Confirmation']
${APPOINTMENT_CARD}    //div[div/h2[.="Appointment Confirmation"]]

${C_FACILITY}    //div[label[.="Facility"]]/following-sibling::div
${C_READMISSION}    //div[label[contains(.,"readmission")]]/following-sibling::div
${C_HEALTH_PROGRAM}    //div[label[contains(.,"Healthcare")]]/following-sibling::div
${C_VISIT_DATE}    //div[label[contains(.,"Visit")]]/following-sibling::div
${C_COMMENT_AREA}    //div[label[.="Comment"]]/following-sibling::div


${GO_HOME}    //a[.='Go to Homepage']



*** Keywords ***

Insert Booking Data
    [Documentation]    for insert booking data.
    [Arguments]    ${FACILITY_N}=Tokyo    ${READISSION_N}=${None}    ${HEALTHCARE_N}=no    ${COMMMENT_N}=${None}    ${VISIT_DATE_N}=${None}
    VAR    &{DATA_SET}    scope=SUITE
# Facility
    ${FACILITY_N}    Evaluate    '${FACILITY_N}'.lower()
    Select Options By    ${FACILITY}    label    ${FACILITY_CHOICE['${FACILITY_N}']}
    Sleep    1
    ${FACILITY_SELECTED}    Get Selected Options     ${FACILITY}
    
# Readmission
    IF    '${READISSION_N}' != '${None}'    
        Browser.Click    ${READMISSION}            
        ${READMISSION_CHOICE}    Set Variable    Yes
    ELSE
        ${READMISSION_CHOICE}    Set Variable    No
    END

# Healthcare program
    Browser.Click    ${HEALTH_PROGRAM['${HEALTHCARE_N}']}
    ${HEALTH_TEXT}    Get Text    ${HEALTH_PROGRAM['${HEALTHCARE_N}']}  


# Comment
    Run Keyword If    '${COMMMENT_N}' != '${None}'    Browser.Fill Text    ${COMMENT_AREA}    ${COMMMENT_N}

# Date pick
    ${INPUT_DATE}=    Run Keyword If    '${VISIT_DATE_N}' == '${None}'    Get Current Date    result_format=%d/%m/%Y    ELSE    Set Variable    ${VISIT_DATE_N}
    Browser.Fill Text    ${VISIT_DATE}    ${INPUT_DATE}
    Browser.Press Keys    ${VISIT_DATE}    Enter
    
    Sleep    10
    
    # Get all value to verify in confirmation page
    Set To Dictionary    ${DATA_SET}    
    ...    FACILITY=${FACILITY_SELECTED}[0] 
    ...    READMISSION_CHOICE=${READMISSION_CHOICE}    
    ...    HEALTH_CARE=${HEALTH_TEXT}    
    ...    VISIT_DATE=${INPUT_DATE}    
    ...    COMMENT=${COMMMENT_N}


    Browser.Click    ${SUBMIT_APPOINTMENT}
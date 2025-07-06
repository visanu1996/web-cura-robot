*** Settings ***
Library    Browser  
Library    DateTime  
Library    Collections
*** Variables ***
${APPOINT_WELCOME}    //h2[.='Make Appointment']
${FACILITY}    id=combo_facility    # facility to select.
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
    [Arguments]    ${facility_n}="Tokyo"    ${readmission_n}=${None}    ${healthcare_n}=no    ${comment_n}=${None}    ${visit_date_n}=${None}
    ${data_set}=    Create Dictionary    facility=${facility_n}    read_mission=${readmission_n}    health_care=${healthcare_n}    comment=${comment_n}    visit_date=${visit_date_n}

    Run Keyword If    '${readmission_n}' != '${None}'    Browser.Click    ${READMISSION}

    Browser.Click    ${HEALTH_PROGRAM['${healthcare_n}']} 

    Run Keyword If    '${comment_n}' != '${None}'    Browser.Fill Text    ${COMMENT_AREA}    ${comment_n}

    ${input_date}=    Run Keyword If    '${visit_date_n}' == '${None}'    Get Current Date    result_format=%d/%m/%Y    ELSE    Set Variable    ${visit_date_n}
    Browser.Fill Text    ${VISIT_DATE}    ${input_date}
    Browser.Press Keys    ${VISIT_DATE}    Enter
    Sleep    10
    
    Browser.Click    ${SUBMIT_APPOINTMENT}
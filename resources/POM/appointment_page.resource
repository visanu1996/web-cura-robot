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

${GO_HOME}    //a[.='Go to Homepage']



*** Keywords ***

Insert Booking Data
    [Documentation]    for insert booking data.
    [Arguments]    ${facility_n}=Tokyo    ${readmission_n}=${None}    ${healthcare_n}=no    ${comment_n}=${EMPTY}    ${visit_date_n}=${EMPTY}
    VAR    &{data_set}    scope=SUITE
# Facility
    ${facility_n}    Evaluate    '${facility_n}'.lower()
    Select Options By    ${FACILITY}    label    ${FACILITY_CHOICE['${facility_n}']}
    Sleep    1
    ${facilitiy_selected}    Get Selected Options     ${FACILITY}
    
# Readmission
    IF    '${readmission_n}' != '${None}'    
        Browser.Click    ${READMISSION}            
        ${readmission_choice}    Set Variable    Yes
    ELSE
        ${readmission_choice}    Set Variable    No
    END

# Healthcare program
    Browser.Click    ${HEALTH_PROGRAM['${healthcare_n}']}
    ${health_text}    Get Text    ${HEALTH_PROGRAM['${healthcare_n}']}  


# Comment
    Run Keyword If    '${comment_n}' != '${EMPTY}'    Browser.Fill Text    ${COMMENT_AREA}    ${comment_n}

# Date pick
    ${input_date}=    Run Keyword If    '${visit_date_n}' == '${EMPTY}'    Get Current Date    result_format=%d/%m/%Y    ELSE    Set Variable    ${visit_date_n}
    Browser.Fill Text    ${VISIT_DATE}    ${input_date}
    Browser.Keyboard Key    press    Enter
    Sleep    5
    Browser.Keyboard Key    press    Tab

    # Get all value to verify in confirmation page
    Set To Dictionary    ${data_set}
    ...    Facility=${facilitiy_selected}[0] 
    ...    readmission=${readmission_choice}    
    ...    Healthcare=${health_text}    
    ...    Visit=${input_date}    
    ...    Comment=${comment_n}

    common.Verify Element Then Click    ${SUBMIT_APPOINTMENT}
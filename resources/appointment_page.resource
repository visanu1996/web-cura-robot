*** Variables ***
${APPOINT_WELCOME}    //h2[.='Make Appointment']
${FACILITY}    id:combo_facility    # facility to select.
${READMISSION}    id:chk_hospotal_readmission    # a check box.
&{HEALTH_PROGRAM}    medicare=id:radio_program_medicare    medicaid=id:radio_program_medicaid    no=id:radio_program_none
${VISIT_DATE}    id:txt_visit_date   # date pick
${COMMENT_AREA}    id:txt_comment    # for commentation.
${SUBMIT_APPOINTMENT}    id:btn-book-appointment    # click appointment.



# Confirmation page.
${CONFIRMATION}    //h2[.='Appointment Confirmation']
${APPOINTMENT_CARD}    //div[div/h2[.="Appointment Confirmation"]]

${C_FACILITY}    //div[label[.="Facility"]]/following-sibling::div
${C_READMISSION}    //div[label[contains(.,"readmission")]]/following-sibling::div
${C_HEALTH_PROGRAM}    //div[label[contains(.,"Healthcare")]]/following-sibling::div
${C_VISIT_DATE}    //div[label[contains(.,"Visit")]]/following-sibling::div
${C_COMMENT_AREA}    //div[label[.="Comment"]]/following-sibling::div


${GO_HOME}    //a[.='Go to Homepage']
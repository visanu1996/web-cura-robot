*** Settings ***
Resource    ${CURDIR}/../import.robot

Suite Setup     Open CURA
Suite Teardown    Close All Browsers

*** Test Cases ***
TC_Appointment_UI_TEST_002
    [Documentation]    Verify that Book Appointment button navigate you to confirmation page.
    ...    1. Fill all fields with test Data
    ...    2. Click Book Appointment
    common.Go To Login Page
    common.Login    ${DEMO_USER}    ${DEMO_PASS}
    common.Verify_Element    ${APPOINT_WELCOME}
    appointment.Insert Booking Data    Hongkong    Y    no    comment_n=Hello world   
    Sleep    5 
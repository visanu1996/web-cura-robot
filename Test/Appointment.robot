*** Settings ***
Resource    ${CURDIR}/../import.robot

Suite Setup     Run Keywords    Create Web Driver
...                             Open Cura                            
Suite Teardown    Browser.Close Browser

*** Test Cases ***
TC_Appointment_UI_TEST_002
    [Documentation]    Verify that Book Appointment button navigate you to confirmation page.
    ...    1. Fill all fields with test Data
    ...    2. Click Book Appointment
    common.Go To Login Page
    login_page.Login    ${DEMO_USER}    ${DEMO_PASS}
    Browser.Wait For Elements State    ${APPOINT_WELCOME}    stable
    appointment_page.Insert Booking Data    Hongkong    Y    no    comment_n=Hello world   
    Sleep    10
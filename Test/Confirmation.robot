*** Settings ***
Resource    ${CURDIR}/../import.robot

Suite Setup     Run Keywords    Create Web Driver
...                             Open Cura            
...                             Full Login                
Suite Teardown    Browser.Close Browser

*** Test Cases ***
TC_Confirmation_UI_TEST_002
    [Documentation]    Verify that all fill input are displayed on this page.
    ...    1. Fill all fields with test data
    ...    2. Click Book Appointment
    ...    3. Verify all fields data
    common.Go To Home Page
    Browser.Wait For Elements State    ${APPOINT_WELCOME}    stable
    appointment_page.Insert Booking Data    facility_n=Tokyo    readmission_n=N    healthcare_n=medicare
    confirmation_page.Verify Selected Choice    &{data_set}
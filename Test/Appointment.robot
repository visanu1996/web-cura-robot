*** Settings ***
Resource    ${CURDIR}/../import.robot

Suite Setup     Run Keywords    Create Web Driver
...                             Open Cura    
...                             Full Login                        
Suite Teardown    Browser.Close Browser

*** Test Cases ***
TC_Appointment_UI_TEST_002
    [Documentation]    Verify that Book Appointment button navigate you to confirmation page.
    ...    1. Fill all fields with test Data
    ...    2. Click Book Appointment

    appointment_page.Insert Booking Data    facility_n=Hongkong    readmission_n=Y    healthcare_n=no    comment_n=Hello world   
    Sleep    10

TC_Appointment_UI_TEST_004
    [Documentation]    Verify that clicking menu burger will open a navigate bar that have Home, History, Profile and logout button.
    ...    1. Click burger menu.
    common.Go To Home Page
    Browser.Click   ${MENU_BURGER}
    Sleep    2
    
    Browser.Highlight Elements    ${HOME_NAV}
    Browser.Wait For Elements State    ${HOME_NAV}
    Sleep    2
    
    Browser.Highlight Elements    ${HISTORY_NAV}
    Browser.Wait For Elements State    ${HISTORY_NAV}
    Sleep    2
    Browser.Highlight Elements    ${PROFILE_NAV}
    Browser.Wait For Elements State    ${PROFILE_NAV}
    Sleep    2

    Browser.Highlight Elements    v
    Browser.Wait For Elements State    ${LOGOUT_NAV}
    Sleep    2s

TC_Appointment_TEST_001
    [Documentation]    Verify booking appointment with valid data
    ...    1. Fill all fields with test Data
    ...    2. Click Book Appointment
    common.Go To Home Page
    Browser.Wait For Elements State    ${APPOINT_WELCOME}    stable
    appointment_page.Insert Booking Data    facility_n=Tokyo    readmission_n=N    healthcare_n=medicare
    Sleep    10

TC_Appointment_TEST_003
    [Documentation]    Verify booking appointment with valid data
    ...    1. Fill all fields with test Data
    ...    2. Click Book Appointment
    common.Go To Home Page
    Browser.Wait For Elements State    ${APPOINT_WELCOME}    stable
    appointment_page.Insert Booking Data    facility_n=Seoul    readmission_n=Y    healthcare_n=no    comment_n=Seoul
    Sleep    10
    Log    ${data_set} 
    
TC_Appointment_TEST_005
    [Documentation]    Verify booking appointment with invalid data
    ...    1. Fill all fields with test Data
    ...    2. Click Book Appointment
    
    common.Go To Home Page
    Browser.Wait For Elements State    ${APPOINT_WELCOME}    stable
    appointment_page.Insert Booking Data    facility_n=Hongkong    readmission_n=Y    healthcare_n=no    comment_n=Seoul    visit_date_n=5/5/2025
    Sleep    10

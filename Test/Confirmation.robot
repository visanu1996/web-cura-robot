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


TC_Confirmation_UI_TEST_005
    [Documentation]    Verify that clicking menu burger will open a navigate bar that have Home, History, Profile and logout button.
    ...    1. Click burger menu.
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

    Browser.Highlight Elements    ${LOGOUT_NAV}
    Browser.Wait For Elements State    ${LOGOUT_NAV}
    Sleep    2s


TC_Confirmation_UI_TEST_003
    [Documentation]    Verify that clicking Go to Homepage navigate you to Home   page.
    ...    1. Click Go to homepage.
    confirmation_page.Go To Home Page
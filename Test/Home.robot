*** Settings ***
Resource    ${CURDIR}/../import.robot

Suite Setup     Run Keywords    Create Web Driver
...                             Open Cura                            
Suite Teardown    Browser.Close Browser
Test Teardown    Go To Home Page

*** Test Cases ***
TC_HOME_UI_TEST_002
    [Documentation]    Verify that Make Appointment button navigate you to login page.
    ...    1. Open CURA Healthcare Service
    ...    2. Click Appointment button.

    Browser.Wait For Elements State   ${APPOINTMENT_BTN}    stable
    Browser.Click    ${APPOINTMENT_BTN}
    Browser.Wait For Elements State    ${LOGIN_WELCOME}    stable

TC_HOME_UI_TEST_004
    [Documentation]    Verify that clicking menu burger will open a navigate bar that have Login button.
    ...    1. Open CURA Healthcare Service
    ...    2. Click Click burger menu.
    
    common.Verify Element Then Click    ${MENU_BURGER}
    Browser.Wait For Elements State    ${LOGIN_NAV}    stable

TC_HOME_UI_TEST_005
    [Documentation]    Verify that clicking menu burger 2nd time will close the navigate bar.
    ...    1. Open CURA Healthcare Service
    ...    2. Click burger menu for 2 times.
    ...    3. Check that nav bar is not visible.

    common.Verify Element Then Click    ${MENU_BURGER}
    Browser.Wait For Elements State    ${ACTIVE_NAV}    stable
    common.Verify Element Then Click    ${MENU_BURGER}
    Browser.Wait For Elements State    ${ACTIVE_NAV}    hidden

TC_HOME_UI_TEST_006
    [Documentation]    Verify that clicking Login button navigate you to login page.
    ...    1. Open CURA Healthcare Service
    ...    2. Click Login button.
    
    common.Click Navigate Bar Then Select    login
    Browser.Wait For Elements State    ${LOGIN_WELCOME}    stable
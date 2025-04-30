*** Settings ***
Resource    ${CURDIR}/../import.robot

Suite Setup     Open CURA
Suite Teardown    Close All Browsers
Test Teardown    Go To Home Page

*** Test Cases ***
TC_HOME_UI_TEST_002
    [Documentation]    Verify that Make Appointment button navigate you to login page.
    ...    1. Open CURA Healthcare Service
    ...    2. Click Appointment button.

    Element Should Be Visible    ${APPOINTMENT_BTN}
    Click Element    ${APPOINTMENT_BTN}
    Element Should Be Visible    ${LOGIN_WELCOME}

TC_HOME_UI_TEST_004
    [Documentation]    Verify that clicking menu burger will open a navigate bar that have Login button.
    ...    1. Open CURA Healthcare Service
    ...    2. Click Click burger menu.
    
    common.Verify_Element_Then_Click    ${MENU_BURGER}
    Element Should Be Visible    ${LOGIN_NAV}

TC_HOME_UI_TEST_005
    [Documentation]    Verify that clicking menu burger 2nd time will close the navigate bar.
    ...    1. Open CURA Healthcare Service
    ...    2. Click burger menu for 2 times.
    ...    3. Check that nav bar is not visible.

    common.Verify_Element_Then_Click    ${MENU_BURGER}
    Element Should Be Visible    ${ACTIVE_NAV}
    common.Verify_Element_Then_Click    ${MENU_BURGER}
    Element Should Not Be Visible    ${ACTIVE_NAV}

TC_HOME_UI_TEST_006
    [Documentation]    Verify that clicking Login button navigate you to login page.
    ...    1. Open CURA Healthcare Service
    ...    2. Click Login button.
    
    common.Click Navigate Bar Then Select    login
    Element Should Be Visible    ${LOGIN_WELCOME}
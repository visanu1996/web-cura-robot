*** Settings ***
Resource    ${CURDIR}/../import.robot

Suite Setup     Open CURA
Suite Teardown    Close All Browsers


*** Test Cases ***
TC_LOGIN_UI_TEST_006
    [Documentation]    Verify that clicking  Top button  will  scroll you to the top page.
    ...    1. Open CURA Healthcare Service
    ...    2. Direct to login page.
    ...    3. Scroll down to bottom.
    ...    4. Click Go Top button from the right bottom of the page.
    common.Go To Login Page
    common.Verify_Element_Then_Click    ${TO_TOP}
    Element Should Not Be Visible    ${TO_TOP}

TC_LOGIN_TEST_002
    [Documentation]    Enter valid User name and invalid password.
    ...    1. Go to login page
    ...    2. Enter User Name and Password
    ...    3. Click login
    common.Go To Login Page
    common.Login    ${DEMO_USER}    Test
    common.Verify_Element    ${LOGIN_FAILED}
    
TC_LOGIN_TEST_005
    [Documentation]    Click Login without input username and password.
    ...    1. Go to login page
    ...    2. Click login
    common.Go To Login Page
    common.Login    ${EMPTY}    ${EMPTY}
    common.Verify_Element_Then_Click    ${LOGIN_BTN}
    common.Verify_Element    ${LOGIN_FAILED}

TC_LOGIN_TEST_004
    [Documentation]    Enter valid User name and valid password
    ...    1. Go to login page
    ...    2. Enter User Name and Password
    ...    3. Click login
    common.Go To Login Page
    common.Login    ${DEMO_USER}    ${DEMO_PASS}
    common.Verify_Element    ${APPOINT_WELCOME}
*** Settings ***
Library    SeleniumLibrary
Library    String

*** Keywords ***
Open CURA
    [Documentation]    use with test or tier setup for opening the test browser.
    Open Browser    ${WEB['url']}    ${WEB['driver']}
    Maximize Browser Window

Verify_Element
    [Documentation]    Verifies that the element is visible on the page and returns True or False.
    [Arguments]    ${element}

    ${is_visible}    Run Keyword And Return Status    Wait Until Element Is Visible    ${element}    ${GLOBE_VAR['global_wait']}
    
    Run Keyword If    not ${is_visible}    Log    Element '${element}' not found.    WARN

    RETURN    ${is_visible}

Get_Text_From_Element
    [Documentation]    use to get text out from element locator.
    [Arguments]    ${element}

    ${text}    Get Text    ${element}
    log    text from ${element} : ${text}

    RETURN ${text}


Login
    [Documentation]    use for login
    [Arguments]    ${username}    ${password}
    
    ${is_exist}    Verify_Element    ${LOGIN_WELCOME}
    IF    not ${is_exist}
        log    can't find ${LOGIN_WELCOME} in this page.

    ELSE
        Input Text    ${USERNAME_INPUT}    ${username}
        Input Password    ${PASSWORD_INPUT}    ${password}
    END


Go To Home Page
    [Documentation]    for going to homepage without clicking any button
    Go To    https://katalon-demo-cura.herokuapp.com/

# Navigate Bar Section
Click Navigate Bar
    [Documentation]    a keywords to open nav bar.
    ${burger_btn}    Verify_Element    ${MENU_BURGER} 
    IF    ${burger_btn}
        Click Element    ${MENU_BURGER}
    END

Click Navigate Bar Then Select
    [Documentation]    a keywords to open nav bar, then select button [home, login, profile, history, logout]
    [Arguments]    ${btn}
    ${word}    Convert To Title Case    ${btn}
    
    Click Navigate Bar
    
    IF    '${word}' == 'Home'
        Click Element    ${HOME_NAV}
    ELSE IF    '${word}' == 'Login'
        Click Element    ${LOGIN_NAV}
    ELSE IF    '${word}' == 'Profile'
        Click Element    ${PROFILE_NAV}
    ELSE IF    '${word}' == 'History'
        Click Element    ${HISTORY_NAV} 
    ELSE IF    '${word}' == 'Logout'
        Click Element    ${LOGOUT_NAV} 
    ELSE
        Fail    Please select correct button
    END

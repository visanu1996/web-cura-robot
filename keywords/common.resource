*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open CURA
    [Documentation]    Open CURA with disabled chrome popup change password, data breach.
    ${prefs}        Create Dictionary   
    ...    credentials_enable_service=False
    ...    profile.password_manager_enabled=False
    ...    safebrowsing.enabled=False
    ...    download.default_directory=${EXECDIR}${/}data_files${/}
    
    ${chrm_opts}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrm_opts}    add_argument    --guest

    Create Webdriver    Chrome    crm_alias    options=${chrm_opts}
    Maximize Browser Window
    Go To    ${WEB['url']}


Verify_Element
    [Documentation]    Verifies that the element is visible on the page and returns True or False.
    [Arguments]    ${element}
    ${is_visible}    Run Keyword And Return Status    Wait Until Element Is Visible    ${element}    ${GLOBE_VAR['global_wait']}
    Log    is element visible : ${is_visible}
    Run Keyword If    not ${is_visible}    Log    Element '${element}' not found.    WARN
    RETURN    ${is_visible}

Verify_Element_Then_Click
    [Documentation]    Check that the element is visible and then click.
    [Arguments]    ${element}
    ${is_visible}    Run Keyword And Return Status    Wait Until Element Is Visible    ${element}    ${GLOBE_VAR['global_wait']}

    IF    ${is_visible}
        Click Element    ${element}
        Sleep    2
    ELSE
        Log    Can't find Element ${element} in Verify_Element_Then_Click.
    END

Login
    [Documentation]    use for login
    [Arguments]    ${username}    ${password}
    
    ${is_exist}    Verify_Element    ${LOGIN_WELCOME}
    IF    not ${is_exist}
        Log    can't find ${LOGIN_WELCOME} in login page.

    ELSE
        Input Text    ${USERNAME_INPUT}    ${username}
        Input Password    ${PASSWORD_INPUT}    ${password}
        Click Element    ${LOGIN_BTN}
    END


Go To Home Page
    [Documentation]    for going to homepage without clicking any button
    Go To    https://katalon-demo-cura.herokuapp.com/

Go To Login Page
    [Documentation]
    Go To    https://katalon-demo-cura.herokuapp.com/profile.php#login
# Navigate Bar Section

Click Navigate Bar Then Select
    [Documentation]    a keywords to open nav bar, then select button [home, login, profile, history, logout]
    [Arguments]    ${btn}
    ${word}    Convert To Title Case    ${btn}
    
    Verify_Element_Then_Click    ${MENU_BURGER}
    
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
        Fail    Please input correct button.
    END


Scroll_To_Bottom
    [Documentation]    scroll to bottom.
    Scroll Element Into View    ${TWIITER_MEDIA}
    
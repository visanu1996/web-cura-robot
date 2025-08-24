*** Settings ***
Library    RPA.Excel.Files
*** Variables ***
${MENU_BURGER}    id=menu-toggle
${ACTIVE_NAV}    //nav[@id="sidebar-wrapper" and @class="active"]
${HOME_NAV}    ${ACTIVE_NAV}//a[.="Home"]
${LOGIN_NAV}    ${ACTIVE_NAV}//a[.="Login"]
${LOGOUT_NAV}    ${ACTIVE_NAV}//a[.="Logout"]
${PROFILE_NAV}    ${ACTIVE_NAV}//a[.="Profile"]
${HISTORY_NAV}    ${ACTIVE_NAV}//a[.="History"]
${TO_TOP}    id=to-top

${TWIITER_MEDIA}    //i[contains(@class,"twitter")]
*** Keywords ***
Create Web Driver
    [Documentation]    use to initialized browser.
    Browser.New Browser    chromium    headless=False    args=['--start-maximized']
    Browser.New Context    viewport=${None}    ignoreHTTPSErrors=True
    
Open CURA
    [Documentation]    open cura and return it id, to be use in switch browser if needed.
    ${CURA}    Browser.New Page    ${WEB['url']}    load
    VAR    ${CURA}    scope=SUITE

Verify Element Then Click
    [Documentation]    Check that the element is visible and then click.
    [Arguments]    ${element}
    ${is_visible}    Run Keyword And Return Status    Browser.Wait for Elements state    ${element}    state=stable    timeout=${GLOBE_VAR['global_wait']}

    IF    ${is_visible}
        Browser.Click    ${element}
        Sleep    1
    ELSE
        Log    Can't find Element ${element} in Verify Element Then Click.
    END

Go To Home Page
    [Documentation]    for going to homepage without clicking any button
    Browser.Go To    https://katalon-demo-cura.herokuapp.com/

Go To Login Page
    [Documentation]
    Browser.Go To    https://katalon-demo-cura.herokuapp.com/profile.php#login



# Navigate Bar Section
Click Navigate Bar Then Select
    [Documentation]    a keywords to open nav bar, then select button [home, login, profile, history, logout]
    [Arguments]    ${btn}
    ${word}    Convert To Title Case    ${btn}
    Verify Element Then Click    ${MENU_BURGER}    
    
    IF    '${word}' == 'Home'
        Browser.Click    ${HOME_NAV}
    ELSE IF    '${word}' == 'Login'
        Browser.Click    ${LOGIN_NAV}
    ELSE IF    '${word}' == 'Profile'
        Browser.Click    ${PROFILE_NAV}
    ELSE IF    '${word}' == 'History'
        Browser.Click    ${HISTORY_NAV} 
    ELSE IF    '${word}' == 'Logout'
        Browser.Click    ${LOGOUT_NAV} 
    ELSE
        Fail    Please input correct button.
    END
    
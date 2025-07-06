*** Variables ***
${LOGIN_WELCOME}    //h2[.="Login"]
${USERNAME_INPUT}    //*[@name='username']
${PASSWORD_INPUT}    //*[@name='password']
${LOGIN_BTN}    id=btn-login

${DEMO_USER}    John Doe
${DEMO_PASS}    ThisIsNotAPassword
# ${USERNAME_LOCATOR}    //input[@aria-describedby='demo_username_label']
# ${PASSWORD_LOCATOR}    //input[@aria-describedby='demo_password_label']

${LOGIN_FAILED}    //p[contains(.,'Login failed!')]


*** Keywords ***
Login
    [Documentation]    use for login
    [Arguments]    ${username}    ${password}
    
    Browser.Fill Text    ${USERNAME_INPUT}    ${username}
    Browser.Fill Text  ${PASSWORD_INPUT}    ${password}
    Browser.Click    ${LOGIN_BTN}
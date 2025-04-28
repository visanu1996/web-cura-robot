*** Variables ***
${MENU_BURGER}    id:menu-toggle
${ACTIVE_NAV}    //nav[@id="sidebar-wrapper" and @class="active"]
${HOME_NAV}    ${ACTIVE_NAV}//a[.="Home"]
${LOGIN_NAV}    ${ACTIVE_NAV}//a[.="Login"]
${LOGOUT_NAV}    ${ACTIVE_NAV}//a[.="Logout"]
${PROFILE_NAV}    ${ACTIVE_NAV}//a[.="Profile"]
${HISTORY_NAV}    ${ACTIVE_NAV}//a[.="History"]
${TO_TOP}    id:to-top
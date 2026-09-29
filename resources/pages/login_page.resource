*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${LOGIN_USERNAME_INPUT}    id:user-name
${LOGIN_PASSWORD_INPUT}    id:password
${LOGIN_BUTTON}            id:login-button
${LOGIN_ERROR_MESSAGE}     css:[data-test="error"]

*** Keywords ***
Login Page Should Be Open
    Wait Until Element Is Visible    ${LOGIN_BUTTON}

Enter Username
    [Arguments]    ${username}
    Input Text    ${LOGIN_USERNAME_INPUT}    ${username}

Enter Password
    [Arguments]    ${password}
    Input Password    ${LOGIN_PASSWORD_INPUT}    ${password}

Click Login
    Click Button    ${LOGIN_BUTTON}

Login With Credentials
    [Arguments]    ${username}    ${password}
    Login Page Should Be Open
    Enter Username    ${username}
    Enter Password    ${password}
    Click Login

Error Message Should Contain
    [Arguments]    ${expected_text}
    Wait Until Element Is Visible    ${LOGIN_ERROR_MESSAGE}
    Element Should Contain    ${LOGIN_ERROR_MESSAGE}    ${expected_text}
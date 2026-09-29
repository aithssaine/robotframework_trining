*** Settings ***
Documentation     Login feature tests
Resource          ../../resources/common.resource
Resource          ../../resources/pages/login_page.resource
Resource          ../../resources/pages/inventory_page.resource
Test Setup        Open Application
Test Teardown     Close Application

*** Test Cases ***
Valid User Can Login
    [Tags]    ui    smoke
    Login With Credentials    ${VALID_USER}    ${PASSWORD}
    Inventory Page Should Be Open

Locked Out User Cannot Login
    [Tags]    ui    negative
    Login With Credentials    ${LOCKED_USER}    ${PASSWORD}
    Error Message Should Contain    locked out

Wrong Password Shows Error
    [Tags]    ui    negative
    Login With Credentials    ${VALID_USER}    wrong_password
    Error Message Should Contain    do not match
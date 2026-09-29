*** Settings ***
Resource          ../../resources/common.resource
Resource          ../../resources/pages/login_page.resource
Resource          ../../resources/pages/inventory_page.resource
Test Setup        Login As Standard User
Test Teardown     Close Application

*** Keywords ***
Login As Standard User
    Open Application
    Login With Credentials    ${VALID_USER}    ${PASSWORD}
    Inventory Page Should Be Open

*** Test Cases ***
Products Are Displayed
    [Tags]    ui    smoke
    Inventory Should Show Products

Add Item To Cart Updates Badge
    [Tags]    ui
    Add Backpack To Cart
    Cart Badge Should Show    1
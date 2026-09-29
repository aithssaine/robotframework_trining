*** Settings ***
Library     SeleniumLibrary
Resource    config.resource

*** Keywords ***
Open Application
    IF    ${HEADLESS}
        Open Browser    ${BASE_URL}    ${BROWSER}
        ...    options=add_argument("--headless=new");add_argument("--window-size=1920,1080")
    ELSE
        Open Browser    ${BASE_URL}    ${BROWSER}
        Maximize Browser Window
    END
    Set Selenium Timeout    10s

Close Application
    Close All Browsers
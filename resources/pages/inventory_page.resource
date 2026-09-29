*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${INVENTORY_TITLE}         css:.title
${INVENTORY_ITEMS}         css:.inventory_item
${ADD_BACKPACK_BUTTON}     id:add-to-cart-sauce-labs-backpack
${CART_BADGE}              css:.shopping_cart_badge

*** Keywords ***
Inventory Page Should Be Open
    Wait Until Element Is Visible    ${INVENTORY_TITLE}
    Element Text Should Be           ${INVENTORY_TITLE}    Products

Inventory Should Show Products
    ${count}=    Get Element Count    ${INVENTORY_ITEMS}
    Should Be True    ${count} > 0

Add Backpack To Cart
    Click Button    ${ADD_BACKPACK_BUTTON}

Cart Badge Should Show
    [Arguments]    ${expected_count}
    Element Text Should Be    ${CART_BADGE}    ${expected_count}
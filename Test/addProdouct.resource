*** Settings ***

Library    SeleniumLibrary

*** Keywords ***

add product to cart

    Click Button     id=add-to-cart-sauce-labs-backpack

    Element Should Be Visible   id=remove-sauce-labs-backpack
    Element Should Contain   css=.shopping_cart_badge    1

    Click Element    css=.shopping_cart_badge
    Location Should Contain    cart.html
    Sleep    10s
    Close Browser

    

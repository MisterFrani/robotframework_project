*** Settings ***

Library    SeleniumLibrary
Resource    login.resource
Resource    addProdouct.resource

*** Test Cases ***

login with valide credential and add product to cart 
   [Tags]    smoke    addProduct
   login with valide credential
   add product to cart

    

    

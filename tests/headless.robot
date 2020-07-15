*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close Browser 

*** Test Cases ***
Chrome
    Open Browser                 https://www.google.fi    headlesschrome
    Page Should Contain Image    Google
*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  Collections

Resource    resources.robot
Resource    invoice-details-page.robot
Resource    navigation.robot
Resource    system.robot
Resource    data.robot

Suite Setup  Run Keywords   Initialize Test Data    Configure Selenium   Navigate To Homepage
Suite Teardown  Exit Selenium

*** Test Cases ***
Create An Invoice
    ${invoice}=     Get Dummy Invoice   demo
    Navigate To Add Invoice
    Fill Out Invoice Details    ${invoice}
    Submit Invoice Form
    ${invoice_id}=   Get Invoice Id     ${invoice}
    comment       ${invoice_id}
    Reload Page
    Click Element   css:[href="#/tables"]    
    Page Should Contain     ${invoice_id}
    sleep    5s
    #Open Invoice    ${invoice_id}


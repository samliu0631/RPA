*** Settings ***
Documentation     A simple web scraper robot.

Library     RPA.Browser
Library     RPA.FileSystem
Library     RPA.Desktop

*** Variables ***
${URL}=     http://news.baidu.com


*** Tasks ***
Store Web Page Content
    Open Browser         ${URL}   Chrome
    ${text}=    Get Text       body
    Create File    
    ...    ${CURDIR}${/}output${/}text.txt
    ...    ${text}
    ...    overwrite=True
    [Teardown]      Close Browser
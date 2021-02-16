*** Settings ***
Library           RPA.Desktop.Windows
Library           String

*** Keywords ***
Open the Calculator
    Open Executable    calc.exe   计算器
    # Calculator

*** Keywords ***
Add two numbers
    [Arguments]    ${first}    ${second}
    #Mouse Click    id:clearEntryButton
    Mouse Click    id:num${first}Button
    Mouse Click    id:plusButton
    Mouse Click    id:num${second}Button
    Mouse Click    id:equalButton

*** Keywords ***
Read the result
    ${result}=    Get Element Rich Text    id:CalculatorResults
    ${_}    ${result}=    Split String From Right    ${result}    max_split=1
    [Return]    ${result}

*** Tasks ***
Calculate and log the result
    Open the Calculator
    Add two numbers    5    7
    ${result}=    Read the result
    Log    ${result}

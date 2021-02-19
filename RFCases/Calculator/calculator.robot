*** Settings ***
Library           RPA.Desktop.Windows
Library           String

*** Keywords ***
打开计算器
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
计算加法
    打开计算器
    Add two numbers    5    9
    ${result}=    Read the result
    Log    ${result}

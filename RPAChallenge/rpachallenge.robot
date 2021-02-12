*** Settings ***
Documentation     Robot to solve the first challenge at rpachallenge.com, which consists of
...               filling a form that randomly rearranges itself for ten times, with data
...               taken from a provided Microsoft Excel file.
Library           RPA.Browser
Library           RPA.Excel.Files
Library           RPA.HTTP

*** Keywords ***
Get The List Of People From The Excel File
    Open Workbook    challenge.xlsx
    ${table}=    Read Worksheet As Table    header=True
    Close Workbook
    [Return]    ${table}

*** Keywords ***
Set Value By Xpath
    [Arguments]    ${xpath}    ${value}
    ${result}=    Execute Javascript    document.evaluate('${xpath}',document.body,null,9,null).singleNodeValue.value='${value}';
    [Return]    ${result}

*** Keywords ***
Fill And Submit The Form
    [Arguments]    ${person}
    Set Value By Xpath    //input[@ng-reflect-name="labelFirstName"]    ${person}[First Name]
    Set Value By Xpath    //input[@ng-reflect-name="labelLastName"]    ${person}[Last Name]
    Set Value By Xpath    //input[@ng-reflect-name="labelCompanyName"]    ${person}[Company Name]
    Set Value By Xpath    //input[@ng-reflect-name="labelRole"]    ${person}[Role in Company]
    Set Value By Xpath    //input[@ng-reflect-name="labelAddress"]    ${person}[Address]
    Set Value By Xpath    //input[@ng-reflect-name="labelEmail"]    ${person}[Email]
    Set Value By Xpath    //input[@ng-reflect-name="labelPhone"]    ${person}[Phone Number]
    Click Button    Submit



*** Tasks ***
Start The Challenge   # 定义RPA任务
    Open Available Browser    http://rpachallenge.com/    # 打开浏览器。
    Download    http://rpachallenge.com/assets/downloadFiles/challenge.xlsx    overwrite=True
    # 点击Start按钮
    Click Button    Start  


*** Tasks ***
Fill The Forms   
    ${people}=    Get The List Of People From The Excel File   # 获取
    FOR    ${person}    IN    @{people}
        Fill And Submit The Form    ${person}
    END
    Sleep    10s


*** Tasks ***
Collect The Results
    Capture Element Screenshot    css:div.congratulations
    # 这里的截图只是针对局部截图。
    Close All Browsers
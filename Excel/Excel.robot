*** Settings ***
Documentation   Download an Excel file and read the rows.
Library         RPA.Excel.Files
Library         RPA.HTTP

*** Variables ***
${EXCEL_FILE_URL}=     http://rpachallenge.com/assets/downloadFiles/challenge.xlsx
#https://github.com/robocorp/example-activities/raw/master/web-store-order-processor/devdata/Data.xlsx

*** Tasks ***
Download an Excel file and read the rows
    Download        ${EXCEL_FILE_URL}           overwrite=True
    Open Workbook   challenge.xlsx
    ${table}=       Read Worksheet As Table     header=True
    Close Workbook

    FOR     ${row}  IN  @{table}
        Log     ${row}
    END
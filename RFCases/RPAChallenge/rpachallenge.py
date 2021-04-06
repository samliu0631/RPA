import RPA.Browser
import RPA.Excel.Files
import RPA.HTTP
import SeleniumLibrary

# 各种功能类的实例化
Selenium    = RPA.Browser.Selenium.Selenium()   # 对浏览器的处理。
element_key = SeleniumLibrary.keywords.element.ElementKeywords(Selenium)  # Selenium 作为上下文变量传入element_key的初始化中。
http        = RPA.HTTP.HTTP()                   # 对网页的处理
fileInst    = RPA.Excel.Files.Files()           # 对Excel的处理
javascript  = SeleniumLibrary.keywords.javascript.JavaScriptKeywords(Selenium)
url         = "http://rpachallenge.com/"
DownloadURL = "http://rpachallenge.com/assets/downloadFiles/challenge.xlsx"


def get_the_list_of_people_from_the_excel_file():
    fileInst.open_workbook("E:\RPAStudy\Cases\RFCases\RPAChallenge\challenge.xlsx")   # 打开Excel
    table = fileInst.read_worksheet_as_table(header=True)  # 读取Excel里的数据。
    fileInst.close_workbook()                              # 关闭Excel
    return table


def Start_the_Challenge( url, DownloadURL ):
    Selenium.open_available_browser(url)  # 使用默认浏览器打开制定网页。
    http.download( url = DownloadURL, overwrite = True )  # 采用覆盖的方式下载Excel文件。
    element_key.click_button("Start")


def fill_and_submit_the_form(person):
    SetValuebyXPath( "//input[@ng-reflect-name=\"labelFirstName\"]", person[0])
    SetValuebyXPath( "//input[@ng-reflect-name=\"labelLastName\"]", person[1])
    SetValuebyXPath( "//input[@ng-reflect-name=\"labelCompanyName\"]", person[2])
    SetValuebyXPath( "//input[@ng-reflect-name=\"labelRole\"]", person[3])
    SetValuebyXPath( "//input[@ng-reflect-name=\"labelAddress\"]", person[4])
    SetValuebyXPath( "//input[@ng-reflect-name=\"labelEmail\"]", person[5])
    SetValuebyXPath( "//input[@ng-reflect-name=\"labelPhone\"]", str(person[6]) )   # 这里要把数字变量转换为字符串。
    element_key.click_button("Submit")


def SetValuebyXPath(XPath, Value):
    JavaCmdStr  = "document.evaluate('" + XPath + "',document.body,null,9,null).singleNodeValue.value='" + Value + "';" 
    JavaResult  = javascript.execute_javascript(JavaCmdStr)  # 为什么要使用JavaScript.
    return JavaResult


def main():
    print("The main function has been called\n")
    Start_the_Challenge(url, DownloadURL)
    table = get_the_list_of_people_from_the_excel_file()
    for person in table.data:
        print(person)
        fill_and_submit_the_form(person)



if __name__ == "__main__":
    main()

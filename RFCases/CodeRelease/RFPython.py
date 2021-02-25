from RPA.Browser import Browser
from RPA.FileSystem import FileSystem


browser     = Browser()
file_system = FileSystem()
url         = "http://news.baidu.com"

def  store_web_page_content():
    browser.open_available_browser(url)
    text = browser.get_text("body")
    file_system.create_file("output/text.txt", text, overwrite=True)
    browser.screenshot()



def main():
    try:
        store_web_page_content()
    finally:
        browser.close_all_browsers()


if __name__ == '__main__':
    main()
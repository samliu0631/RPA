from RPA.Desktop.Windows import Windows
import logging
import MyPackage

from MyPackage.subpack1 import test1



win = Windows()

def open_calculator():
    win.open_from_search("calc.exe", "计算器")
    elements = win.get_window_elements()


def make_calculations(expression):
    win.send_keys(expression)
    result = win.get_element_rich_text('id:CalculatorResults')
    return int(result.strip('显示为'))


if __name__ == "__main__":
    #open_calculator()
    #exp = '5*2='
    #result = make_calculations(exp)
    #print(f"Calculation result of '{exp}' is '{result}'")
    #win.close_all_applications()
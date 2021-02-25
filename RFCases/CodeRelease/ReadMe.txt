运行
pyinstaller -F RFPython.py


1)pyinstaller -F xxx.py 

这一步肯定会报上述错误导致失败，但是会产生一个xxx.spec文件

2)在xxx.spec文件中增加两行(添加在原文件第二行):
import sys
sys.setrecursionlimit(1000000)

3)pyinstaller xxx.spec
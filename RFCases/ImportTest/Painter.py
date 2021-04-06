from MyPackage.subpack1 import test1
from MyPackage.subpack1 import test2
#import MyPack
#import MyPack.pack1
import MyPack.MySubPack.pack21


if __name__ == "__main__":
    z = test1.AddElement(3,4)
    print( 'The result is {}'.format(z) )

    k = test2.MinusElement(4,3)
    print( 'The result is {}'.format(k) )
    
    m = MyPack.MySubPack.pack21.chengfa(4,5)
    print("The result is {}".format(m))


def  Add(x,y) ->int:
    z=x+y
    
    print(Add.__annotations__)
    return z


if __name__ == '__main__':
    x:int = 2 
    y:int = 4.0
    z = Add(x,y)
    print(z)
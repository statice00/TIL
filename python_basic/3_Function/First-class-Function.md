### 일급객체함수(First-class Function)

파이썬의 함수는 아래와 같은 항목들이 가능하다.  

1. 함수를 변수나 자료구조에 저장할 수 있다.  
    ```python
    def add(n1,n2):
        return n1 + n2

    plus = add # add함수를 변수에 할당

    # 같은 메모리 주소값
    print(add) # <function add at 0x00000218Ae94DD30>
    print(plus) # <function add at 0x00000218Ae94DD30>
    print(add is plus) # out : True

    print(var(4,5)) # out : 9
    ```
2. 함수의 매개변수(인자)에 다른 함수를 인자로 사용 가능하다.  
    ```python
    def double(x):
        return x+x
    num = [1,2,3,4]

    def first_class(function, argument):
        return [function(i) for i in argument]

    print(first_class(double, num))

    # out : [2, 3, 6, 8] 
    ```
3. 함수의 반환 값(return 값)으로 함수를 전달할 수 있다.
    ```python
    def square(x):

        def square_x():
            print(x*x)

        return square_x()
    
    square(3) # out : 9
    ```

### 고차함수(higher order function)
일급객체함수 3개 조건 중 2개에 해당  
1. 함수의 매개변수(인자)에 다른 함수를 인자로 사용 가능하다.  
2. 함수의 반환 값(return 값)으로 함수를 전달할 수 있다.  

대표적인 함수로는 map, filter, reduce, lambda  



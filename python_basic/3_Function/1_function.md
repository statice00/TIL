### function

- 선언(정의)  
함수는 사용하기 전에 선언/정의를 먼저 해야 한다  
함수를 선언할때는 def를 사용한다
- callable  
이름 뒤에 괄호()를 붙이는 것을 call(호출)이라고 한다  
이름 뒤에 괄호()를 붙일 수 있는 것을 callable이라 한다  
(1) function  
(2) class (init 정의되었을 경우)  
(3) object (call 정의되었을 경우)
```python
def prn():
    return 1

prn()  # out : 1
```
- 매개변수(parameter), 인수(argument)  
매개변수,인자(parameter) : 함수를 정의할때 쓰는 변수  
인수(argument) : 함수를 사용할때 쓰는 변수
```python
def display(a,b,c):
    return a+b+c
d,e,f = 1,2,3
display(d,e,f) # out : 6
```
- 매개변수와 인수의 7가지 사용방식
    1. positional  
    선언할때 매개변수의 순서와 호출할때 인자의 입력 순서를 그대로 매칭
    ```python
    def proc(a,b):
        return a,b
    
    proc(2,4)  # out : (2, 4)
    ```
    2. keyword
    순서와 관계없이 매개변수 이름에 따라 값이 대입
    ```python
    proc(b=4, a=2) # out  :(2, 4)
    ```
    3. positinal & keyword 혼합  
    ```python
    def proc(a,b,c):
        return a,b,c

    proc(2, c=5, b=3) # out : (2, 3, 5)   
    ```
    4. positional only
    함수를 사용할때 positional방삭으로만 인수를 사용할 수 있도록 강제하는 방법  
    '/'의 앞에 오는 인수들은 positional방식으로만 입력가능. keyword방식 불가  
    ```python
    def proc(a,b,c,/):
        return a,b,c

    proc(4,5,6) # out : (4,5,6)
    ```
    5. keyword only  
    keyword방식으로만 인수를 사용할 수 있도록 강제하는 방법
    '*'의 뒤에 오는 인수들은 keyword방식으로만 입력가능.
    ```python
    def proc(*,a,b,c):
        return a,b,c

    proc(a=3,b=4,c=5) # out : (3, 4, 5)
    ```
    6. 가변 positional  
    매개변수(parameter) 이름에 '*'을 붙인다.    
    positional방식으로 입력되는 인수의 개수에 상관없이 모두 받아온다.
    ```python
    def proc(*a):
        hap = 0
        for i in a:
            hap += i
        return hap

    proc(1,3,5)  # out : 9
    ```
    7. 가변 keyword  
    매개변수(parameter) 이름에 '**'을 붙인다.  
    keyword방식으로 입력되는 인수의 개수에 상관없이 모두 받아온다.  
    인수로 넘겨준 이름을 dictionary의 key로 사용한다.
    ```python
    def proc (**a):
        print(type(a))
        return a

    proc(x=2,y=3)
    # out : <class 'dict'>
    #       {'x' : 2, 'y' : 3}
    ```
    가변 positional, 가변 keyword 방식은 매개변수를 지정할때 한번씩만 사용할 수 있다.
    

 --- 
- signature  
함수 이름에 마우스 커서를 놓고 shift + tab 하면 함수의 signature가 나온다  
signature는 함수의 사용방법을 알려준다  
ex) sum(iterable,/,start=0))


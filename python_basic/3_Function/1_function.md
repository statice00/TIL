### function

특정 기능을 수행하는 코드의 묶음

- 선언(정의)  
  함수는 사용하기 전에 선언/정의를 먼저 해야 한다  
  함수를 선언할때는 **def**를 사용한다

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
  
  매개변수,인자(parameter) : 함수를 정의할때 쓰는 변수. 인자를 통해 함수에 값을 전달  
  
  인수(argument) : 함수를 사용할때 쓰는 변수
  
  반환 값 : 함수에서 계산된 결과값
  
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

- 변수의 유효 범위

    **지역 변수**(local variable) : 함수 안에서 정의한 변수이며 함수 안에서만 사용할 수 있다. 함수가 호출될 때 임시 저장 공간(메모리)에 할당되고 함수 실행이 끝나면 사라진다. 다른 함수에서 같은 이름으로 변수를 사용해도 각각 다른 임시 저장 공간에 할당되므로 독립적으로 동작한다.

    **전역 변수**(global variable) :  함수 밖에서 생성한 변수이며 코드 내 어디서나 사용할 수 있다.

    ```python
    a = 5 # 전역 변수
    
    def func1():
        a = 1 # 지역 변수, func1()에서만 사용
        print("func1 지역 변수 a = ", a)
        
    def func2():
        a = 2 # 지역 변수,  func2()에서만 사용
        print("func2 지역 변수 a = ", a)
        
    def func3():
        print("func3 전역 변수 a = ", a)
        
    def func4():
        global a # 함수 내에서 전역 변수를 변경하기 위해 선언
        a = 4    # 전역 변수의 값 변경
        print("func4 전역 변수 a = ", a)
        
    func1()
    func2()
    func3()
    func4()
    # out : 
    #    func1 지역 변수 a =  1
    #    func2 지역 변수 a =  2
    #    func3 전역 변수 a =  5
    #    func4 전역 변수 a =  4
    ```

---
- signature

  주피터노트북, VScode 등 지원  
  함수 이름에 마우스 커서를 놓고 shift + tab 하면 함수의 signature가 나온다  
  signature는 함수의 사용방법을 알려준다  
  ex) sum(iterable,/,start=0))


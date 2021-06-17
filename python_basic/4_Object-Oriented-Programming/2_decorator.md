### decorator

@를 붙이면 decorator이다.  
```python
def wrapper(fun):
            # 가변 포지셔널, 가변 키워드
    def inner(*args, **kwargs):
        print('------------------------')
        fun(*args, **kwargs)
        print('------------------------')
    return inner

@wrapper
def a(a):
    print(a)
    
a(4) # = wrapper(a(4))

# 데코레이터를 사용해서 inner 출력
a.__name__ # out : 'inner'
```

#### staticmethod(정적 메서드)  
클래스나 클래스의 인스턴스(객체)와는 무관하게 독립적으로 동작하는 함수   
함수를 정의할 때 인자로 self를 사용하지 않으며 정적 메서드 안에서는 인스턴스 메서드나 인스턴스 변수에 접근할 수 없음  
객체 생성 없이 클래스명을 이용해 메서드 호출 가능
```python
class Car():
    @staticmethod
    def check(model_code):
        if(model_code>=20):
            print('전기차')
        elif(10<= model_code <20):
            print('가솔린차')
        else:
            print('디젤차')

Car.check(2) # out : 디젤차
```

#### classmethod(클래스 메서드)  
클래스 변수를 사용하기 위한 함수  
클래스 전체에서 관리해야 하는 기능이 있을 때 사용  
첫번째 인자로 클래스를 넘겨받는 cls필요, cls로 클래스 변수에 접근  
객체 생성 없이 클래스명을 이용해 메서드 호출 가능
```python
class Car():
    instance_count = 0 # 클래스 변수

    #instance method 초기화
    def __init__(self,color):
        self.color = color # 인스턴스 변수
        Car.instance_count = Car.instance_count +1
        
    @classmethod
    def count_instance(cls):
        print("자동차 수 : {}" .format(cls.instance_count))
     
Car.count_instance()  # out : 자동차 수 : 0
car1 = Car("black")
Car.count_instance()  # out : 자동차 수 : 1
```

### 함수 이름 그대로 사용  
데코레이터를 사용해도 원래 함수 이름을 그대로 쓰려면  @functools.wraps() 사용
```python
def wrapper(fun):
    @functools.wraps(fun)
    def inner(*args, **kwargs):
        return fun(*args, **kwargs)
    return inner

@wrapper
def x(a):
    print(a)

x.__name__  # out : 'x'
```


### 함수 3중 중첩  
3중 중첩한 함수를 데코레이터로 사용할때 데코레이터에 괄호를 붙인다.  
괄호 안에 인자를 넣어 전달한다. (인자는 필수이며 개수가 맞아야 한다)
```python
import time # 시간 관련 기능 모아놓은 내장 라이브러리

def para(n):
    def wrapper(fun):
        @functools.wraps(fun)
        def inner(*args, **kwargs):
            start = time.time()
            print('-------')
            print('실행함수 : '+ fun.__name__)
            t = fun(*args, **kwargs)
            print('-------')
            end = time.time()
            print('실행시간:', (end-start + n)) # n사용
            return t
        return inner
    return wrapper

@para(3)  # 인자 전달 (3)
def a():
    return 1

a()
```
```python
out : 
     -------
     실행함수 : a
     -------
     실행시간: 3.000997304916382
     1
```

### 데코레이터 2중 중첩  
순서에 주의해서 사용해야 한다.
```python
def decorator1(fn):
    print('decorator1')
    def inner1(*args, **kwargs):
        print('inner1')
        return fn(*args, **kwargs)
    return inner1

def decorator2(fn):
    print('decorator2')
    def inner2(*args, **kwargs):
        print('inner2')
        return fn(*args, **kwargs)
    return inner2


@decorator1
@decorator2
def foo():
    print("foo")

foo()
```
```python
out : 
     inner1
     inner2
     foo
```

### property decoragor  
property 데코레이터는 method를 not callable로 바꿔준다
```python
class A: 
    @property    # method를 property로 사용하겠다고 decorator선언(더 이상 callable이 아님)
    def z(self):
        return 1
a = A()
a.z()   # TypeError : property decorator로 선언되어 callable 아님
```
#### getter/setter  
클래스의 속성에 값을 가져오거나 저장할때 getter setter 메소드 사용
```python
 class PersonClass:
     def __init__(self):
         self._name = ""

     def name_getter(self):      # _name의 값을 가져옴
         return self._name

     def name_setter(self, text): # _name에 값을 저장
         self._name = text


 person1 = PersonClass()  # 인스턴스 생성
 person1.name_setter("yong")
 print(person1.name_getter())  # out : yong
```
**property decorator**와 **setter**속성을 이용해 더 직관적으로 표현가능
```python
 class PersonClass:
     def __init__(self):
         self._name = ""
    @property
    def name(self):
         return self._name

    @name.setter
    def name(self, text):
         self._name = text


 person1 = PersonClass()
 person1.name = "yong"
 print(person1.name)
```

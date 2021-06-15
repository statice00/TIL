### decorator

@를 붙이면 decorator이다.  
```python
def x(fun):
    def y(x):
        return fun(x+1)
    return y

@x
def s(a)
return a

s(5) # = x(s(5))
```

#### staticmethod(정적 메서드)  
클래스나 클래스의 인스턴스(객체)와는 무관하게 독립적으로 동작하는 함수   
함수를 정의할 때 인자로 self를 사용하지 않으며 정적 메서드 안에서는 인스턴스 메서드나 인스턴스 변수에 접근할 수 없음
```python
class Car():
    @staticmethod
    def check(model_code):
        
```

#### classmethod(클래스 메서드)  

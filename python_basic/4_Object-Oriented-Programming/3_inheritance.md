### 상속(inheritance)  
이미 만들어진 클래스의 변수와 함수를 그대로 이어받고 새로운 내용만 추가해 클래스 선언

코드의 재사용성이 좋아진다

유사한 클래스를 여러 개 만들어야 할 경우 공통 부분은 부모 클래스로 구현

class 이름 뒤에 붙는 ()괄호는 상속이다.  

```python
class Parent:
    x = 'parent'

    @classmethod
    def out(cls):
        return cls.x

    @staticmethod
    def prn():
        return Parent.x

# Parent 클래스의 자원을 Son 클래스에 상속
class Son(Parent):
    x = 'son'

    def display(self):
        print(Parent.out())
        print(Son.out())

s = Son() # 인스턴스 생성
print(Parent.prn()) # out : parent
s.display()        # out : parent son
print(s.prn())      # out : parent
```


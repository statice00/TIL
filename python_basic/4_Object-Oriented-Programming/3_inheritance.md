### 상속(inheritance)  
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
s.display())        # out : parent son
print(s.prn())      # out : parent
```


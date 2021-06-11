## class

함수와 클래스 차이 : 
- 함수  
  - 정의 + 호출
  - def사용
  - 외부에서 내부 접근 불가
 
- 클래스
  - 정의 + 인스턴스
  - class 사용해서 정의
  - 외부에서 instance를 이용해서 내부 접근 가능

```python
# 사용자가 정의하는 클래스
class A:
    x = 1

# 클래스에서 접근
A.x # out : 1

aa = A() # 인스턴스 생성
aa.x     # 인스턴스에서 접근
# out : 1
```

```python
class Employee:
    x = 1                  # 클래스에서 정의한 '클래스 변수'  어떤 인스턴스를 생성하든 바로 접근 가능
    def display(self, y):  # 메소드 규칙 : 자기자신 self
        self.y = y         # 메소드에서 정의한 '인스턴스 변수'  인스턴스를 먼저 생성한 다음에 접근 가능
        print(y)

ps = Employee() # 클래스에 ()붙여서 인스턴스 생성
ps.display(3) # 인스턴스 변수 y에 3 할당
```
클래스 변수는 클래스로 접근가능
```python
Employee.x
# out : 1
```
클래스 선언 이후 클래스 변수 할당가능
```python
Employee.x = 2
```

인스턴스 메소드에서 첫번째 인자는 무조건 생략할 수 없다.  
self는 인스턴스 자기 자신을 의미한다.  
class에서 인스턴스 메소드를 실행할때 self자리에 인스턴스를 넣을 수 있다. 그러므로 self는 생략한다고 하면 안된다. 
```python
class A :
    a = 1
    def aa(self, aa):
        self.a = aa

    def bb(self):
        print(self.a)
```
```python
x = A()
x.aa(5) # 첫번쨰 인자 생략가능. 두번째 인자값부터 인식
A.aa(x,4) # x.a = 4
x.a # out : 4
A.bb(x) # print(x.a)
x.bb()  # print(x.a)
```







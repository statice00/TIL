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

- 객체  
  클래스로 구현한 실체적 대상  
- 인스턴스
  메모리에 할당되어 실제 사용되는 객체  




```python
# 클래스 이름 대문자로 시작
class Employee:
    # 클래스에서 정의한 '클래스 변수'  어떤 인스턴스를 생성하든 바로 접근 가능
    x = 1     
    # __init__ : 객체 생성될 때 호출되는 메소드. 객체의 초기화 담당           
    def __init__(self,wage):
      self.wage = wage

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

### instance method(인스턴스 메소드)  
인스턴스(객체)에 속한 메소드  
인스턴스 메소드에서 첫번째 인자는 무조건 생략할 수 없음  
self는 인스턴스 자기 자신을 의미  
모든 메소드 최소한 self 가져야함    
self를 통해서 클래스 내의 메소드 자유롭게 호출 가능
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







## 객체(Object)와 클래스(Class)

### 클래스 선언과 객체 생성

- 함수와 클래스 차이 : 

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
  
  객체의 특징인 속성은 변수로, 객체가 할 수 있는 일인 행동은 함수로 구현(변수와 함수의 묶음) 
  
- 인스턴스
  메모리에 할당되어 실제 사용되는 객체
  
  객체는 클래스에서 생성하므로 객체를 클래스의 인스턴스라고 한다.

---

#### 클래스 선언

객체를 만들려면 먼저 클래스를 선언해야 한다. 클래스는 객체의 공통된 속성과 행위를 변수와 함수로 정의한 것. 객체를 만들기 위한 기본 틀

클래스명은 알파벳 대문자로 시작, 여러 단어가 연결된 클래스 이름은 가독성을 위해 **대문자**로 시작하는 단어를 연결해 만든다.

클래스에서 정의한 함수의 첫 번째 인자는 `self` 이다. `self`는 객체 생성 후에 자신을 참조하는데 이용

클래스에서 정의한 함수를 객체를 생성한 후에 이용할 때는 **메서드(method)**라고 한다. 객체 생성과 상관없이 클래스에서 정의한 함수를 메서드라고 하기도 하므로 클래스와 객체에서 함수와 메서드라는 용어는 구분 없이 사용하지만 둘 다 클래스에서 정의한 함수를 말한다.

```python
# 클래스 선언 기본 구조

class 클래스명():       # 클래스명은 알파벳 대문자로 시작
    [변수1]            # 클래스 변수
    [변수2]
    ...
    def 함수1(self, 인자1, 인자2, ... , 인자n): # 클래스 함수
        <코드 블록>
        ...
    def 함수1(self, 인자1, 인자2, ... , 인자n): # 클래스 함수
        <코드 블록>
        ...
```

</br>

#### 객체 생성 및 활용

선언된 클래스로부터 클래스의 인스턴스인 객체를 생성하는 방법

```python
객체명 = 클래스명()
```

객체에 속성을 설정하려면 '객체명.변수명'에 '속성값'을 할당

```python
객체명.변수명 = 속성값
```

```python
class Bicycle(): # 클래스 선언
    pass # 변수도 함수도 없지만 클래스 인정

my_bicycle = Bicycle() # 인스턴스 생성

# 생성한 객체에 속성값 설정
my_bicycle.wheel_size = 26 
my_bicycle.color = 'black' 

# 객체의 속성 출력
print(my_bicycle.wheel_size) 
print(my_bicycle.color) 
# out : 26
#       black
```

</br>

앞에서 선언한 Bicycle 클래스에 함수 추가

```python
class Bicycle():
    def move(self, speed):
        print("자전거: 시속 {0}킬로미터로 전진".format(speed))
        
    def turn(self, direction):
        print("자전거: {0}회전".format(direction))
        
    def stop(self):
        print("자전거({0}, {1}): 정지".format(self.wheel_size, self.color))
```

객체를 생성한 후에는 '객체명.변수명 = 속성값' 으로 속성값을 설정하고 '객체명.변수명'으로 속성값을 가져왔지만, 클래스의 함수 안에서는 **'self.변수명 = 속성값'**으로 속성값을 설정하고 **'self.변수명'**으로 속성값을 가져옴

</br>

클래스에 함수를 추가한 후 객체의 메서드를 호출하는 방법

```python
객체명.메서드명(인자1, 인자2, ... , 인자n)
```

메서드명 = 클래스에서 정의한 함수명

객체에서 메서드를 호출할 때 인자는 클래스에서 정의한 함수의 인자만큼 필요

단, 클래스를 선언할 때 추가했던 함수의 인자 self는 필요 없음

클래스에서 self만 인자로 갖는 함수를 객체에서 이용 시 소괄호 안에 인자 지정 안함

```python
my_bicycle = Bicycle() # Bicycle 클래스의 인스턴스인 my_bicycle 객체 생성

# 생성한 객체에 속성값 설정
my_bicycle.wheel_size = 26 
my_bicycle.color = 'black' 

# 객체의 메서드 호출
my_bicycle.move(30)
my_bicycle.turn('좌')
my_bicycle.stop()

# out : 자전거: 시속 30킬로미터로 전진
#       자전거: 좌회전
#       자전거(26, black): 정지
```

선언한 클래스를 이용해 필요한 만큼의 객체를 얼마든지 만들 수 있음

</br>

#### 객체 초기화

앞에서는 클래스를 선언하고 객체를 생성한 후에 객체의 속성을 설정했지만,

클래스를 선언할 때 초기화 함수 `__init()__` 를 구현하면 객체를 생성하는 것과 동시에 속성값을 지정할 수 있음

`__init()__` 함수는 클래스의 인스턴스가 생성될 때 자동으로 실행

`__init()__` 함수에 초기화하려는 인자를 정의하면 객체를 생성할 때 속성을 초기화 가능

```python
class Bicycle():
    
    # 함수 내에서 'self.변수명 = 인자' 로 객체의 속성 초기화 
    def __init__(self, wheel_size, color):
        self.wheel_size = wheel_size
        self.color = color
        
    def move(self, speed):
        print("자전거: 시속 {0}킬로미터로 전진".format(speed))
        
    def turn(self, direction):
        print("자전거: {0}회전".format(direction))
        
    def stop(self):
        print("자전거({0}, {1}): 정지".format(self.wheel_size, self.color))        
    
```

클래스에 `__init()__` 함수가 정의돼 있으면 객체를 생성할 때 `__init()__` 함수의 인자를 입력(self 제외)

```python
my_bicycle = Bicycle(26, 'black')

my_bicycle.stop()

# out : 자전거(26, black): 정지
```

</br>

---

### 클래스를 구성하는 변수와 함수

#### 클래스에서 사용하는 변수

클래스에서 사용하는 변수는 위치에 따라 클래스 변수(class variable)와 인스턴스 변수(instance variable)로 구분

- 클래스 변수

  클래스 변수는 클래스 내에 있지만 함수 밖에서 `변수명 = 데이터` 형식으로 정의한 변수

  클래스에서 생성한 모든 객체가 공통으로 사용 가능

  클래스 변수는 `클래스명.변수명` 형식으로 접근 가능

- 인스턴스 변수

  인스턴스 변수는 클래스 내의 함수 안에서 `self.변수명 = 데이터` 형식으로 정의한 변수

  클래스 내의 모든 함수에서 `self.변수명` 으로 접근 가능

  인스턴스 변수는 각 인스턴스(객체)에서 개별적으로 관리, 객체를 생성한 후 `객체명.변수명` 형식으로 접근 가능

만약 인스턴스 변수가 정의돼 있지 않고 클래스 변수만 정의돼 있을 때 객체를 생성한 후 `객체명.변수명`으로 접근하면 클래스 변수에 접근함

```python
# 클래스 변수, 인스턴스 변수 사용한 클래스 생성
class Car():
    instance_count = 0 # 클래스 변수 생성 및 초기화
    
    def __init__(self, size, color):
        self.size = size # 인스턴스 변수 생성 및 초기화
        self.color = color # 인스턴스 변수 생성 및 초기화
        Car.instance_count = Car.instance_count + 1 # 클래스 변수 이용
        print("자동차 객체의 수: {0}".format(Car.instance_count))
        
        
    def move(self):
        print("자동차({0} & {1})가 움직입니다.".format(self.size, self.color))
     
# 클래스를 이용해 객체 생성
car1 = Car('small', 'white')
car2 = Car('big', 'black')
# out : 자동차 객체의 수: 1
#		자동차 객체의 수: 2


# 클래스 변수는 '클래스명.변수명' 형식으로 언제든지 호출 가능
print(Car.instance_count)
# out : 2

# 클래스 변수도 객체를 생성한 후 `객체명.변수명` 형식으로 접근 가능
print(car1.instance_count)
print(car2.instance_count)
# 모든 객체에서 클래스 변수가 공통으로 사용되기 때문에 car1과 car2객체에서 값이 같음
# out : 2
#       2


# 생성된 객체의 메서드 실행
car1.move()
car2.move()
# 인스턴스 변수(self.size, self.color)는 각 객체에서 별도로 관리됨
# out : 자동차(small & white)가 움직입니다.
#       자동차(big & black)가 움직입니다.
```

클래스 변수와 인스턴스 변수가 이름이 같은 경우

```python
class Car2():
    count = 0 # 클래스 변수 생성 및 초기화
    
    def __init__(self, size, num):
        self.size = size # 인스턴스 변수 생성 및 초기화
        # count로 이름은 같지만 별개로 동작
        self.count = num # 인스턴스 변수 생성 및 초기화
        Car2.count = Car2.count + 1 # 클래스 변수 이용
        print("자동차 객체의 수: Car2.count = {0}".format(Car2.count))
        print("인스턴스 변수 초기화: self.count = {0}".format(self.count))
        
    def move(self):
        print("자동차({0} & {1})가 움직입니다.".format(self.size, self.count))
        

        
# 클래스 변수 count와 인스턴스 변수 count가 별개로 동작        
car1 = Car2('big', 20)
car2 = Car2('small', 30)
# out : 자동차 객체의 수: Car2.count = 1
#       인스턴스 변수 초기화: self.count = 1
#       자동차 객체의 수: Car2.count = 2
#       인스턴스 변수 초기화: self.count = 2
```

</br>

#### 클래스에서 사용하는 함수

- 인스턴스 메서드(instance method)

  **각 객체에서 개별적으로 동작하는 함수를 만들 때 사용**하는 함수

  인스턴스 메서드는 함수를 정의할 때 첫 인자로 `self` 필요

  `self` 는 인스턴스(객체) 자신을 가리킨다.

  인스턴스 메서드에서는 `self` 를 이용해 인스턴스 변수를 만들고 사용

  **인스턴스 메서드 안에서 `self.함수명()` 형식으로 클래스 내의 다른 함수를 호출 가능**

  ```python
  # 인스턴스 메서드 구조
  
  class 클래스명():
      def 함수명(self, 인자1, 인자2, ...):
          self.변수명1 = 인자1
          self.변수명2 = 인자2
          ...      
          
          
  # 인스턴스 메서드는 객체를 생성한 후에 호출 가능
  객체명 = 클래스명()
  객체명.메서드명(인자1, 인자2, ...)
  ```

  ```python
  class Car():
      instance_count = 0 # 클래스 변수 생성 및 초기화
      
      # 초기화 함수(인스턴스 메서드)
      def __init__(self, size, color):
          self.size = size # 인스턴스 변수 생성 및 초기화
          self.color = color # 인스턴스 변수 생성 및 초기화
          Car.instance_count = Car.instance_count + 1 # 클래스 변수 이용
          print('자동차 객체의 수: {0}'.format(Car.instance_count))
          
      # 인스턴스 메서드
      def move(self, speed):
          self.speed = speed # 인스턴스 변수 생성
          print('자동차({0} & {1})가 '.format(self.size, self.color), end='')
          print('시속 {0}킬로미터로 전진'.format(self.speed))
          
      # 인스턴스 메서드
      def auto_cruise(self):
          print('자율 주행 모드')
          # 인스턴스 메서드 호출
          self.move(self.speed) # move() 함수의 인자로 인스턴스 변수를 입력  
          
          
  # 인스턴스 메서드를 실행하기 위한 객체 생성 및 메서드 호출
  car1 = Car('small', 'red') # car1 객체 생성
  car2 = Car('big', 'green') # car2 객체 생성
  
  car1.move(80) # 객체 car1의 move() 메서드 호출
  car2.move(100) # 객체 car2의 move() 메서드 호출
  
  car1.auto_cruise() # 객체 car1의 auto_cruise() 메서드 호출
  car2.auto_cruise() # 객체 car2의 auto_cruise() 메서드 호출
  
  ## 인스턴스 메서드인 move()와 auto_cruise()는 두 객체 car1, car2에서 개별적으로 동작함
  
  # out : 자동차 객체의 수: 1
  #       자동차 객체의 수: 2
  #       자동차(small & red)가 시속 80킬로미터로 전진
  #       자동차(big & green)가 시속 100킬로미터로 전진
  #       자율 주행 모드
  #       자동차(small & red)가 시속 80킬로미터로 전진
  #       자율 주행 모드
  #       자동차(big & green)가 시속 100킬로미터로 전진 
  ```

  </br>

- 정적 메서드(static method)

  클래스와 관련이 있어 클래스 안에 두기는 하지만

  **클래스의 인스턴스(객체)와는 무관하게 독립적으로 동작하는 함수를 만들고 싶을 때 이용**하는 함수

  함수 정의할 때 인자로 `self` **사용 안함** 

  정적 메서드 안에서는 인스턴스 메서드나 인스턴스 변수에 접근 불가

  함수 앞에 데코레이터(Decorator)인 `@staticmethod` 를 선언해 정적 메서드임을 표시

  ```python
  # 정적 메서드 구조
  
  class 클래스명():
      @staticmethod
      def 함수명(인자1, 인자2, ...):
          <코드 블록>
  ```

  객체를 생성한 후에 정적 메서드를 호출할 수도 있지만,

  정적 메서드는 보통 **객체를 생성하지 않고 클래스명을 이용해 바로 메서드를 호출**

  ```python
  클래스명.메서드명(인자1, 인자2, ...)
  ```

  정적 메서드는 날짜 및 시간 정보 제공, 환율 정보 제공, 단위 변환과 같이 **객체와 관계없이 독립적으로 동작**하는 함수를 만들 때 주로 이용

  ```python
  # 앞서 만든 Car() 클래스에 정적 메서드 추가
  
  class Car():
  
      # 앞의 코드 활용
      # def __init__(self, size, color):
      # def move(self, speed):
      # def auto_cruise(self):
  
      # 정적 메서드
      @staticmethod
      def check_type(model_code):
          if(model_code >= 20):
              print('이 자동차는 전기차입니다.')
          elif(10 <= model_code < 20):
              print('이 자동차는 가솔린차입니다.')
          else:
              print('이 자동차는 디젤차입니다.')
              
  
  # 클래스명.정적메서드명() 형식으로 정적 메서드 호출            
  Car.check_type(25)
  Car.check_type(2)
  # out : 이 자동차는 전기차입니다.
  #       이 자동차는 디젤차입니다.
  ```

  </br>

- 클래스 메서드(class method)

  클래스 변수를 사용하기 위한 함수

  클래스 메서드는 함수를 정의할 때 **첫 번째 인자로 클래스를 넘겨받는 `cls` 가 필요**하며 이를 이용해 클래스 변수에 접근

  클래스 메서드를 사용하기 위해서는 함수 앞에 데코레이터인 `@classmethod`를 지정해야 함

  ```python
  # 클래스 메서드 구조
  
  class 클래스명():
      @classmethod
      def 함수명(cls, 인자1, 인자2,...):
          <코드 블록>
  ```

  클래스 메서드도 **객체 생성하지 않고 클래스명을 이용해 바로 호출**

  ```python
  클래스명.메서드명(인자1, 인자2, ...)
  ```

  클래스 메서드는 생성된 객체의 개수를 반환하는 등 클래스 전체에서 관리해야 할 기능이 있을 때 주로 이용

  ```python
  # 앞서 만든 Car() 클래스에 클래스 메서드 추가
  
  class Car():
      instance_count = 0 # 클래스 변수
      
      # 초기화 함수(인스턴스 메서드)
      def __init__(self, size, color):
          self.size = size # 인스턴스 변수 생성 및 초기화
          self.color = color # 인스턴스 변수 생성 및 초기화
          Car.instance_count = Car.instance_count + 1 # 클래스 변수 이용
  
      # 앞의 코드 활용
      # def move(self, speed):
      # def auto_cruise(self):
      # @staticmethod
      # def check_type(model_code):
      
      # 클래스 메서드
      @classmethod
      def count_instance(cls):
          # cls 이용해 클래스 변수 접근
          print('자동차 객체의 개수: {0}'.format(cls.instance_count)) 
          
          
  # 클래스명.클래스메서드명() 형식으로 클래스 메서드 호출
  # 위에서 짠 코드에 따르면 객체가 생성될 때마다 __init()__에서 1씩 증가하므로 클래스 메서드 호출하면 현재까지 생성된 객체의 개수 출력
  Car.count_instance() # 객체 생성 전에 클래스 메서드 호출
  
  car1 = Car('small', 'red') # 첫 번째 객체 생성
  Car.count_instance() # 클래스 메서드 호출
  
  car2 = Car('big', 'green') # 두 번째 객체 생성
  Car.count_instance() # 클래스 메서드 호출
  
  # out : 자동차 객체의 개수: 0
  #       자동차 객체의 개수: 1
  #       자동차 객체의 개수: 2
  ```

</br>

---

### 객체와 클래스를 사용하는 이유

코드 작성과 관리가 편하기 때문. 큰 규모의 프로그램(게임 등)을 만들 때 클래스 와 객체 많이 이용. 유사한 객체가 많은 프로그램을 만들 때도 주로 클래스와 객체를 이용해 코드 작성

- 클래스와 객체를 사용하지 않고 코드 작성한 경우

  컴퓨터 게임 예제

  로봇의 속성 : 이름, 위치

  로봇의 동작 : 한 칸 이동

  ```python
  ## 한 대의 로봇 구현. 변수 2개, 함수 1개
  robot_name = 'R1' # 로봇 이름
  robot_pos = 0     # 로봇 초기 위치
  
  def robot_move():
      global robot_pos
      robot_pos = robot_pos + 1
      print('{0} positon: {1}' .format(robot_name, robot_pos))
      
  robot_move()
  # out : R1 position: 1
  
  
  ## 두 대의 로봇 구현. 변수 4개, 함수 2개
  robot1_name = 'R1'
  robot1_pos = 0
  
  def robot_move():
      global robot_pos
      robot_pos = robot_pos + 1
      print('{0} positon: {1}' .format(robot_name, robot_pos))
  
  robot2_name = 'R2'
  robot2_pos = 10
  
  def robot2_move():
      global robot2_pos
      robot2_pos = robot2_pos + 1
      print('{0} position: {1}' .format(robot2_name, robot2_pos))
      
  robot1_move()
  robot2_move()
  # out : R1 position: 1
  #       R2 positon: 11
  ```

  더 많은 로봇을 구현해야 한다면 그만큼 변수와 함수도 더 늘어나고 코드 작성과 관리가 상당히 힘들어짐

  현재 예제와 같이 로봇별로 변수와 함수의 역할이 같은 상황에서는 클래스와 객체를 이용하면 편리하게 코드 작성 가능

  

- 클래스와 객체를 이용해 구현한 경우

  ```python
  # Robot 클래스에서 속성값(self.name self.pos)은 __init__()함수에서 초기화되고 move()함수에 한칸 이동하는 함수 구현
  class Robot():
      def __init__(self, name, pos):
          self.name = name # 로봇 객체 이름
          self.pos = pos   # 로봇 객체 위치
          
      def move(self):
          self.pos = self.pos + 1
          print('{0} position: {1}' .format(self.name, self.pos))
          
  # 객체 구현
  robot1 = Robot('R1', 0)
  robot2 = Robot('R2', 11)
  robot3 = Robot('R3', 21)
  robot4 = Robot('R4', 31)
  
  # 생성된 각 로봇 객체의 메서드 실행
  robot1.move()
  robot2.move()
  robot3.move()
  robot4.move()
  # out : R1 position: 1
  #       R2 positon: 11
  #       R3 positon: 21
  #       R4 positon: 31
  ```

  클래스를 선언한 이후에는 필요할 때매다 객체만 생성. 객체가 아무리 늘어나도 변수나 함수를 추가로 구현할 필요가 없으니 앞에서 객체와 클래스 없이 구현할 때보다 코드의 양도 줄고 관리도 편리해 짐

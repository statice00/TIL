## 모듈(module)  

- 모듈로 나누면 코드 작성과 관리가 쉬워진다. 어느 정도 큰 규모의 프로그램을 작성할 경우 파일 하나에 전체 코드를 구현하지 않고 기능 별로 나눈 후에 여러 파일에서 해당 기능의 코드를 구현한다.

  이 경우, 하나의 코드 파일에 해당 기능의 구현에만 신경 쓰면 되므로 코드 작성과 관리가 편해진다.

- 특정 기능을 구현한 모듈은 다른 프로그램을 작성할 때 재사용할 수 있다. 

- 공동 작업을 할 때 전체를 모듈별로 설계하고 개인별로 나누오 코딩 후 전체 모듈을 통합하면 자신이 맡은 모듈만 신경 쓰면ㄷ ㅚ므로 공동 작업으로 인한 복잡성이 줄고 효율이 높아진다.

<br/>

-----

<br/>

#### 모듈 생성, 불러오기

모듈은 파이썬 코드가 저장된 파일이므로 확장자(.py) 파일

```python
## 코드를 파이썬 파일로 저장
## -a 옵션 사용 : 같은 이름의 파일이 있으면 기존 파일의 내용 뒤에 추가
## -a 옵션 미사용 : 덮어쓰기
%%writefile [-a] file.py
<저장할 코드>

## 저장된 파이썬 코드 파일 불러오기
%load file.py

## 파이썬 코드 파일 실행
%run file.py
```

```python
# 생성된 모듈 불러오기
# 모듈을 부르기 위해서는 모듈이 있는 위치로 이동해야 하지만, 모듈의 경로를  PYTHONPATH 환경 변수에 지정하면 부르는 위치에 상관없이 어디서나 모듈을 불러와서 실행 가능

# 환경 변수 설정 확인 윈도우 명령어
!echo %PYTHONPATH%

# PYTHONPATH 환경 변수에 경로가 지정되지 않았다면 위 코드의 결과로 %PYTHONPATH%가 출력
```

```python
# 모듈 작성
# C:/study/workspace_python 등의 경로 지정 안하면 현재 작업위치에 모듈 생성

%%writefile my_module.py

pi = 3.14

def circle_area(r):
    return pi * r ** 2
```

```python
# 현재 작업위치에 생성된 모듈이므로 현재 작업위치에서 불러올 수 있음
# import 모듈명 as 별명  
import my_module

print(my_module.pi) # 모듈의 변수 이용
print(my_module.circle_area(4)) # 모듈의 함수 이용
```

 <br/>

#### 모듈의 변수 바로 사용

모듈 내에 있는 특정한 변수와 함수, 클래스를 모듈명 없이 바로 직접 호출

```
from 모듈명 import 변수명   
from 모듈명 import 함수명  
from 모듈명 import 클래스명  
```

```python
from my_module import pi
print(pi)  # 모듈명 없이 직접 호출
```
모듈의 모든 변수, 함수, 클래스를 모듈명 없이 바로 이용
```python
from 모듈명 import *
```

<br/>

---

<br/>

### 내장 모듈  

<br/>

난수 발생 모듈
```python
import random

random.random()      # 0이상  1미만 임의의 실수 반환
random.randint(a,b)  # a이상 b이하 임의의 정수 반환
random.randrange(a,b,c)  # a이상 b미만 중 c단위만큼 차이나는 임의의 정수 반환
random.choice(sequence)  # 공백이 아닌 sequence에서 임의의 항목 반환
random.sample(population, n) # sequence로 이루어진 population에서 중복되지 않는 n개의 인자 반환 
```

<br/>

날짜, 시간 처리 모듈
```python
import datetime
date = datetime.date(year, month, day)
time = datetime.time(hour, minute, second)
datetime = datetime.datetime(year,month,day,hour,minute,second)
```

datetime 모듈의 date 객체는 타입이 date로 그 객체끼리 빼기 연산 가능

```python
import datetime

day1 = datetime.date(2021,7,1)
day2 = datetime.date(2021,9,1)

diff_day = day2 - day1
print(diff_day)
# out : 62 days, 0:00:00

print(type(day1))
print(type(diff_day))
# out : 
#    <class 'datetime.date'>
#    <class 'datetime.timedelta'>

print(diff_day.days)
# out : 62

print(datetime.date.today())
# out : 2021-10-08

print(datetime.datetime.now())
# out : 2021-10-08 15:47:07.829618

now = datetime.datetime.now()
print("Date : {:%Y, %m, %d}".format(now))
print("Time : {:%H/%M/%S}".format(now))
# out:
#    Date : 2021, 10, 08
#    Time : 15/49/43
```



<br/>

달력 생성 처리 모듈
```python
import calendar

calendar.calendar(year, m=3)
print(calendar.calendar(2021, m=6)) # 출력 6열로 변경

calendar.month(year, month)
print(calendar.month(2021,10)) # 지정 연도의 특정 월만 표시

calendar.monthrange(year, month) # 1일이 시작하는 요일, 그 달의 날짜 수 출력
print(calendar.monthrange(2021,10))
# out : (4, 31)
# 4는 금요일, 10월은 31일까지 있다는 뜻

calendar.firstweekday()  # 첫번째 요일값 반환 default = 월요일(0)
calendar.setfirstweekday()  # 첫번째 요일값 지정 월요일(0)~일요일(6)
calendar.weekday(year, month, day) # 지정 년월일의 요일 반환

calendar.isleap(2022) # 해당 연도가 윤년인지 확인
print(calendar.isleap(2020))
print(calendar.isleap(2021))
# out : 
#    True
#    False
```

<br/>

---

<br/>

## 패키지

여러 모듈을 폴더로 묶어서 계층적으로 관리

-  ``__init__.py``

  파이썬 패키지는 폴더 구조로 돼 있으며 각 폴더에는 `__init__.py`라는 파일 존재

   ``__init__.py``파일은 해당 폴더가 패키지의 일부인 것을 알려주는 역할

  패키지를 초기화하는 코드를 넣을 수도 있고 아무 코드도 없는 빈 파일일 수도 있음

  파이썬 버전 3.3 이후로 패키지를 만들 때  ``__init__.py``파일이 없어도 되지만 하위 호환성을 고려하면 파일을 포함하는 것이 좋음

### 패키지 생성

```python
mkdir C:\Users\123gu\Desktop\TIL_Code\python_basic\packages\image; C:\Users\123gu\Desktop\TIL_Code\python_basic\packages\image\io_file
```

```python
%%writefile C:\Users\123gu\Desktop\TIL_Code\python_basic\packages\image\__init__.py
    # File name: __init__.py
```

```python
%%writefile C:\Users\123gu\Desktop\TIL_Code\python_basic\packages\image\io_file\__init__.py
# File name: __init__.py
```

```python
%%writefile C:\Users\123gu\Desktop\TIL_Code\python_basic\packages\image\io_file\imgread.py
# File name: imgread.py

def pngread():
    print("pngread in imgread module")
        
def jpgread():
    print("jpgread in imgread module")
```

```python
# 폴더와 파일이 잘 생성됐는지 윈도우 명령어 tree로 확인

!tree /F C:\Users\123gu\Desktop\TIL_Code\python_basic\packages
```

</br>

### 패키지 사용

패키지를 활용하기 위해서는 파이선 참조 경로인 PYTHONPATH 환경 변수에 패키지가 위치한 폴더를 지정해야 함

OR

- 직접 경로 추가

  ```python
  # Python이 module과 packge를 찾아가는 경로 확인
  import sys
  sys.path
  ```

  ```python
  # 패키지와 모듈이 있는 경로 직접 추가
  sys.path.append("C:\\Users\\123gu\\Desktop\\TIL_Code\\python_basic\\packages")
  ```

패키지 모듈을 이용하려면 `import 패키지 내 모듈명` 으로 선언

```python
import image.io_file.imgread # image 패키지 io_file 폴더의 imgread 모듈 임포트

image.io_file.imgread.pngread() # imgread 모듈 내의 pngread() 함수 호출
image.io_file.imgread.jpgread() # imgread 모듈 내의 jpgread() 함수 호출
```

```python
# 더 간단하게 함수 호출

from image.io_file.imgread import * # imgread 모듈의 모든 함수 호출 = import pngread, jpgread

pngread() # imgread 모듈 내의 pngread() 함수 호출
jpgread() # imgread 모듈 내의 jpgread() 함수 호출

# out : 
#    pngread in imgread module
#    jpgread in imgread module
```




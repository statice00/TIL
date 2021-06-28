### 모듈(module)  

<br/>

코드가 저장된 파일

import 모듈명 as 별명  
from 모듈명 import 변수명   
from 모듈명 import 함수명  
from 모듈명 import 클래스명  

<br/>

-----

<br/>

#### 모듈 생성, 불러오기

<br/>

```python
%%writefile C:/study/workspace_python/my_module.py

pi = 3.14

def circle_area(r):
    return pi * r ** 2
```
```python
import my_module

print(my_module.pi) # 모듈의 변수 이용
print(my_module.circle_area(4)) # 모듈의 함수 이용
```

<br/>

#### 모듈의 변수 바로 사용
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

<br/>

달력 생성 처리 모듈
```python
import calendar
calendar.calendar(year, col=3)
calendar.month(year, month)
calendar.monthrange(year, month)
calendar.firstweekday()  # 첫번째 요일값 반환 default = 월요일(0)
calendar.firstweekday()  # 첫번째 요일값 지정 월요일(0)~일요일(6)
calendar.weekday(year, month, day) # 지정 년월일의 요일 반환
```

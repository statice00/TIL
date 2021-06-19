### 모듈(module)  
코드가 저장된 파일

import 모듈명 as 별명  
from 모듈명 import 변수명   
from 모듈명 import 함수명  
from 모듈명 import 클래스명  

-----
#### 모듈 생성, 불러오기

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

#### 모듈의 변수 바로 사용
```python
from my_module import pi
print(pi)  # 모듈명 없이 직접 호출
```
모듈의 모든 변수, 함수, 클래스를 모듈명 없이 바로 이용
```python
from 모듈명 import *
```
---
### 내장 모듈  
난수 발생 모듈
```python
import random

random.random()      # 0이상  1미만 임의의 실수 반환
random.randint(a,b)  # a이상 b이하 임의의 정수 반환
random.randrange(a,b,c)  # a이상 b미만 중 c단위만큼 차이나는 임의의 정수 반환
random.choice(sequence)  # 공백이 아닌 sequence에서 임의의 항목 반환
random.sample(population, n) # sequence로 이루어진 population에서 중복되지 않는 n개의 인자 반환 
```




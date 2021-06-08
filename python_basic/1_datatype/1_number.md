## Data Type
![자료형](https://076923.github.io/assets/images/Python/ch3/2.png)

---
## 숫자형(numeric)
- 정수(integer)
- 실수(flosting point)
- 복소수(complex)

### 정수(integer)
```python
a = 1
b = 0
c = -1
```
### 실수(floasting point)
- 소수점이 포함된 숫자
- e를 붙여서 지수로 부동소수 표현 가능
```python
a = .1
b = 1.
c = 3.14
d = 1e2  # out = 100.0
e = 1e-2 # out = 0.01
```
### 복소수(complex)
- j(-1의 제곱근인 허수)를 이용해서 표현
- 복소수는 실수와 허수로 구성
```python
a = 5 + 1j
```
---
#### 숫자 연산과 진법
- 숫자 연산자
```python
1+3  # 덧셈
2**3 # 제곱
10/3 # 몫
10//3 # 몫에서 정수값만 반환
10%3 # 나머지
```
- 진법
파이썬 int는 10진법이 기본  
0b : 2진법(binary) 0 ~ 1 사용  
0o : 8진법(octal) 0 ~ 7 사용  
0x : 16진법(hexadecimal) 0~9 a(10) ~ f(15) 사용  
```python
0b1111 # 15
0o11 # 9
0x1f # 17
```

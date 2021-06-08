### 튜플(tuple)
튜플의 표현법은 ()소괄호이다.  
**heterogeneous, sequence, immutable**한 container이다.  
즉, 값을 바꿀 수 없다.
```python
t = (1,2,3) 
```
- 소괄호 연산자와 튜플 구분  
먼저 계산하고 싶은 연산을 ()괄호로 묶는다.  
소괄호 안에 원소가 하나뿐인 경우, 이 소괄호는 연산자로 취급한다.
```python
1+3*4 # = 13
(1+3)*4 # = 16

c = (1)
type(c)  # out : int
```
소괄호 안에 원소가 하나뿐일 때 원소 뒤에 ,(쉼표)가 있으면 tuple
```python
c = (1,)
type(c) # out : tuple
```
단축표현으로 ()소괄호를 생략해도 tuple로 인식함
```python
a = 1,2,3
type(a) # out : tuple
```
- index, slice  
tuple도 sequence이므로 index와 slice가능
```python
a = 1,2,3
a[2] # index
a[2:3] # slice
```
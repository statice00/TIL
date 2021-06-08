### 집합(set)
중복을 허용 안하며, 순서가 유지 안됨(내부적으로 정렬함)    
**heterogeneous, non-sequence, mutable**한 container  
표기법으로 {} 중괄호 사용
```python
a = {1,2,3,3,3}
print(a) # out : {1,2,3}
b = {2,1,5,3,4}
print(b) # out : {1,2,3,4,5}
```
set은 sequence가 아니므로 index와 slice 사용불가.
```python
a[0] # out : TypeError
```
- set 요소 삭제  
remove() : 지정요소 삭제  
clear() : set 요소 모두 삭제
```python
a = {1,2,3,4,5}
a.remove(1)
print(a) # out : {2,3,4,5}

a.clear()
print(a) # out : set()
```
- set 연산  
set을 위한 특별한 연산자가 존재.  
& : 교집합
```python
a = {1,2}
b = {2.3}
a & b # out : {2}
```
| : 합집합
```python
a | b # out : {1,2,3}
```
'-' : 차집합
```python
a - b # out : {1}
```
^ : 대칭차집합
```python
a ^ b # out : {1,3}
```
- set에 데이터 추가
```python
a = {1,4,6}
a.add(3)
print(a) # out = {1,3,4,6}
```
- set 2개 결합
```python
b = {7,8,9}
a.update(b) # out : {1,4,6,7,8,9}
```
- set 제한사항  
set은  mutable인 list, set을 원소로 가질 수 없음  
set은 + 연산자를 제공 안함
---
### frozenset
mutable은 항상 immutable과 짝을 이룬다.  
set(mutable)의 짝은 frozen(immutable)이다.  
frozenset은 표기법이 제공 안되고 frozenset()을 이용해서 생성한다.  
```python
f = frozenset({1,2,3})
```
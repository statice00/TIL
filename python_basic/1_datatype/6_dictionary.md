### 딕셔너리(dictionary)
dictionary의 표현법은 중괄호 {}와 콜론: 이다.  
key:value 를 한 쌍으로 갖는다.  
{} : 비어있는 dictionary  
set() : 비어있는 set
```python
d = {'b':2, 'a':[1,2,3]}
```
- index  
dictionary는 index를 key로 함  
문자로 indexing 가능.  
(다른 container들은 숫자만 가능)
```python
d['b'] # out : 2
```
- dictionary에서는 slice 제공 안함
- dictionary는 mutable이지만 유일하게 dict만 대응하는 immutable 짝이 없음
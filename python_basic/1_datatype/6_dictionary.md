### 딕셔너리(dictionary)
dictionary의 표현법은 중괄호 {}와 콜론: 이다.  
key:value 를 한 쌍으로 갖는다. 

리스트나 튜플에서는 인덱스를 이용해 항목을 다뤘지만 딕셔너리는 인덱스 대신 키를 이용해 값을 다룬다.


{} : 비어있는 dictionary  
set() : 비어있는 set

```python
d = {"num":2, "list":[1,2,3], "tuple":(4,5,6), "dict_list_tuple":{"a":[1,2,3], "b":(4,5,6)}}
```
- index  
  dictionary는 index 대신 key를 사용한다.

  리스트나 튜플에서 인덱스는 0부터 시작하는 숫자였지만 딕셔너리의 키는 임의로 지정한 숫자나 문자열이 될 수 있으며, 값으로는 어떤 데이터 타입도 사용할 수 있다.  
  
  - dictionary에서는 slice 제공 안함
  
    ```python
    d["num"] # out : 2
    d["dict_list_tuple"]["a"] # out : [1,2,3]
    ```
  
- 데이터 추가, 변경

  생성된 딕셔너리에 새로운 키와 값을 추가하거나 기존의 값을 수정하려면

  dict_variable[key] = value 형태로 입력

  ```python
  d["abcde"] = "fu" # 키와 값으로 새로 추가
  d["num"] = 4 # 기존 값을 다른 값으로 변경
  
  d
  # out :
  #    {'num': 4,
  #     'list': [1, 2, 3],
  #     'tuple': (4, 5, 6),
  #     'dict_list_tuple': {'a': [1, 2, 3], 'b': (4, 5, 6)},
  #     'abcde': 'fu'}
  ```

- 데이터 삭제

  딕셔너리의 특정 키와 값을 삭제하려면

  del 딕셔너리데이터[key]

  ```python
  del d["abcde"]
  
  d
  # out :
  #    {'num': 4,
  #     'list': [1, 2, 3],
  #     'tuple': (4, 5, 6),
  #     'dict_list_tuple': {'a': [1, 2, 3], 'b': (4, 5, 6)}}
  ```


---

  #### 딕셔너리 메서드

- keys()

  딕셔너리에서 키 전체를 리스트 형태로 반환

  ```python
  d.keys() # out : dict_keys(['num', 'list', 'tuple', 'dict_list_tuple'])
  ```

- values()

  딕셔너리에서 값 전체를 리스트 형태로 반환

  ```python
  d.values() 
  # out : dict_values([4, [1, 2, 3], (4, 5, 6), {'a': [1, 2, 3], 'b': (4, 5, 6)}])
  ```

- items()

  딕셔너리에서 키와 값의 쌍을 (키, 값)처럼 튜플 형태로 변환

  ```python
  d.items() 
  # out: dict_items([('num', 4), ('list', [1, 2, 3]), ('tuple', (4, 5, 6)), ('dict_list_tuple', {'a': [1, 2, 3], 'b': (4, 5, 6)})])
  ```

- update()

  기존의 딕셔너리 데이터에 새로운 딕셔너리 데이터를 추가

  ```python
  d1 = {"num":2, "list":[1,2,3]}
  d2 = {"tuple":(4,5,6), "dict_list_tuple":{"a":[1,2,3], "b":(4,5,6)}}
  
  d1.update(d2)
  d1
  # out : 
  #	{'num': 2,
  #	 'list': [1, 2, 3],
  #	 'tuple': (4, 5, 6),
  #	 'dict_list_tuple': {'a': [1, 2, 3], 'b': (4, 5, 6)}}
  ```

- clear()

  딕셔너리의 모든 항목 삭제

  ```python
  d1.clear()
  d1 # out : {}
  ```

  
---
- dictionary는 mutable이지만 유일하게 dict만 대응하는 immutable 짝이 없다.
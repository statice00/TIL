### 튜플(tuple)
튜플의 표현법은 ()소괄호이다.  
**heterogeneous, sequence, immutable**한 container이다. (다른 타입의 요소를 가질 수 있으며, 순서가 중요하고 바꿀 수 없다)  

튜플의 속성은 리스트와 유사하나, 튜플 데이터는 한 번 입력하면 그 이후에는 항목을 변경할 수 없다.

```python
t = (1,2,3) 
type(t) # out : tuple
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
	
- 한번 생성된 튜플은 요소를 변경하거나 삭제할 수 없다.

  ```python 
  tuple1 = (1,2,3,4)
  
  tuple1[1] = 3 # error 한번 생성된 튜플의 요소는 변경되지 않음
  
  del tuple1[1] # error 한번 생성된 튜플 요소는 삭제되지 않음
  ```

  
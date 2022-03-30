### 리스트(list)
list의 표현법은 대괄호[]이다.  
**heterogeneous, sequence, mutable**한 container이다. (다른 타입울 요소로 가질 수 있고, 순서가 중요하며 바뀔 수 있다.)

``` python
a = [1,2,'3'] # int와 str 동시에 요소로 가질 수 있다.
```
- list 생성
    ``` python
    a = [1,2,3]
    b = list() # 빈 리스트 : 데이터는 없지만 데이터 형태는 리스트
    ```
    
- 인덱싱

    ```python
    # 0부터 N-1까지
    a[0] # out : 1
    a[-1] # out : 3
    a[0:1] # out : [1,2]
    ```

- 리스트의 특정 항목 변경

    변수명[i] = new_data

    ```python
    a[1] = 0
    a # out : [1,0,3]
    ```

- 리스트에서 항목의 존재 여부 확인

    항목 in 리스트

    ```python
    list_data1 = [1,2,3,4,5,6]
    
    print(6 in list_data1) # out : True
    print(9 in list_data1) # out : False
    ```

---

#### 리스트 메서드

- index()
  
  리스트에서 인자와 일치하는 첫 번째 항목의 위치를 반환
  
  ```python
  a = ["adsp", "sqld", "bigdata"]
  a.index("adsp") # out : 0
  ```
  
- count()
  
  리스트에서 인자와 일치하는 항목의 개수를 반환
  
  ```python
  a = ["T", "F", "T", "T", "F", "T"]
  a.count("T") # out : 4
  ```
  
- append()  
  요소를 리스트의 맨 끝에 추가
  
    ``` python
    a = [1,2,3]
    a.append(4) # out : [1,2,3,4]
    ```
  
- insert()  
  요소를 리스트의 특정 위치에 삽입
  
    ``` python
    a.insert(1,0) # 1인덱스에 0 삽입
    # out : [1,0,2,3,4]
    ```
  
- list 병합  
    extend() : 기존의 리스트의 맨 마지막에 새로운 리스트를 병합시켜 기존 리스트의 원본 구조를 변경 
    
    ``` 
    + 연산자 : 원본 리스트에는 변화가 없고 병합한 새로운 리스트 리턴
    ```
    ``` python
    b = [1,2,3]
    c = [4,5,6]
    print(b.extend(c)) # out : [1,2,3,4,5,6]
    print(b) # out : [1,2,3,4,5,6]
    d = [7,8,9]
    print(c + d) # out : [4,5,6,7,8,9]
    ```
    
- list 삭제  
  remove() : 삭제할 값을 직접 지정하여 삭제  
  del() : 삭제할 요소의 인덱스 번호를 통해 삭제  
  clear() : 리스트 내부 요소 전체 삭제
  
  pop() : 리스트의 마지막 항목을 제거한 후에 반환
  
    ```python
  a = [1,2,3,4,5]
  a.remove(3)
  print(a) # out : [1,2,4,5]
  
  b = [3,4,5,6,7]
  del(b[0:1])
  print(b) # out : [5,6,7]
  
  c = [2,3,4,5]
  c.pop()
  print(c) # out : [2,3,4]
    ```
  
- list 정렬  
  sort() : 리스트 내부 요소들을 정렬(default : reverse=False 오름차순)  
  reverse() : 리스트 요소들을 역순으로 뒤집음
  
    ```python
  a = [5,2,1]
  a.sort()
  print(a) # out : [1,2,5]
  
  a = [5,2,1]
  a.reverse()
  print(a) # out : [1,2,5]
    ```
  
- list 연산

  ```
  + : 병합. 리스트만 연결가능  
  * : 반복. int만 가능
  ```

    ```python
    a = [1,2]
    print(a*2) # out : [1,2,1,2]
    ```
    len(a) : 요소 개수  
    max(a) : 최대값  
    min(a) : 최소값
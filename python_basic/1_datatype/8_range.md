### range
![range](https://cdn.techbeamers.com/wp-content/uploads/2019/05/Python-range-function-explained.png)

**homogeneous, sequence, immutable**한 container이다. (같은 타입만 요소로 가질 수 있고, 순서가 중요하며, 바뀔 수 없다.)

- 자료 생성  
  range(start, end, stop)
    ```python
    a = range(10) # 0 이상 10 미만 숫자 생성
    b = range(1, 10, 2) # 1 이상 10 미만 숫자 2씩 증가해서 생성
    ```
- index, slice  
sequence이므로 인덱싱, 슬라이싱 가능함
    ```python
    c = range(1,10)
    c[0] # out : 1
    ```
    ```python
    c[3:9] # out : range(4,9)
    ```

- for문 이용

  ```python
  for i in range(0,9):
      print(i, end=' ')
      
  # out : 0 1 2 3 4 5 6 7 8 
  ```
  
  
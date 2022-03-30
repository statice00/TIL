### range
![range](https://cdn.techbeamers.com/wp-content/uploads/2019/05/Python-range-function-explained.png)

**homogeneous, sequence, immutable**한 container이다. (같은 타입만 요소로 가질 수 있고, 순서가 중요하며, 바뀔 수 없다.)

- 자료 생성  
  range(start, stop, step)
  
  start부터 시작해서 stop 전까지(즉, stop은 포함되지 않음) step만큼 계속 더해 <반복 범위>를 만든다.
  
  start와 stop은 양의 정수, 음의 정수, 0 모두 사용 가능
  
  step은 양의 정수와 음의 정수만 사용 가능
  
  start가 0인 경우 start 생략 가능
  
  step이 1인 경우 step 생략 가능
  
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

- for문에 이용

  ```python
  for i in range(0,9):
      print(i, end=' ')
      
  # out : 0 1 2 3 4 5 6 7 8 
  ```
  
- range() 함수 결과 출력

  바로 출력하면 안나온다. 

  ```python
  print(range(0,10))
  # out : range(0, 10)
  ```

  range() 함수로 만들어진 숫자의 리스트를 출력하려면 다음과 같이 list() 함수를 이용해 리스트 타입으로 변환한 후 출력해야 한다.

  ```python
  print(list(range(0,10)))
  # out : [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  ```

  
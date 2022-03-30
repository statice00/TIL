### while 반복문
![while](https://media.geeksforgeeks.org/wp-content/uploads/20191101170515/while-loop.jpg) 

while문은 반복 범위 없이 조건에 따라 반복  수행 여부를 결정



- while문 구조

  ```python
  while <조건문>:
      <코드 블록>
  ```

  while문 활용

  i += 1 의 뜻은  i = i + 1 
  i -= 1 의 뜻은  i = i - 1  

  ```python
  # 자연수 1부터 순차적으로 더해서 출력하다가 합이 20보다 커지면 멈추는 반복문
  
  i = 0 # 초기화
  sum = 0 # 초기화
  
  while (sum < 20): # 조건 검사
      i += 1 # i를 1씩 증가
      sum = sum + i # 이전의 sum과 현재 i를 더해서 sum 갱신
      print(i,sum) # i와 sum을 출력
  
  # out :
  #    1 1
  #    2 3
  #    3 6
  #    4 10
  #    5 15
  #    6 21
  ```

- 무한 반복 while문

  코드 블록을 무조건 계속 반복하라고 명령을 내리는 경우

  while문에서 <조건문>이 항상 참이므로 코드 블록을 무조건 수행한다.

  이 경우 코드가 무한 반복하므로 주의가 필요하다.

  ```python
  while True:
      print("infinite while Test")
  ```

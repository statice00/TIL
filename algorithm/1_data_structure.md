<img src="https://images.velog.io/images/lhb7021/post/e8e1f02b-a506-4854-8f0c-3fe49c64dcbe/stack_queue.png" alt="stack,queue" style="zoom: 50%;" />

---

### 스택(stack) 자료구조

![stack](https://hetalrachhhome.files.wordpress.com/2019/12/stack.png)

- 먼저 들어 온 데이터가 나중에 나가는 선입후출 형식의 자료구조  
  입구와 출구가 동일한 형태로 스택을 시각화 가능

- 파이썬에서 스택 구현은 별도 라이브러리가 필요 없이 기본으로 제공하는 **리스트** 자료형 사용

  **append()** 메소드 : 리스트 맨 오른쪽에 데이터 추가

  **pop()** 메소드 : 리스트 맨 뒤에 있는 하나의 원소를 꺼냄 

  둘 다 시간복잡도가 상수 O(1)인 연산이기에 스택 자료구조를 활용하기 적합하다.

  즉, 파이썬에서는 별도로 라이브러리를 이용할 필요 없이 기본적으로 제공되는 객체인 리스트를 이용해서 스택을 이용할 수 있다.

- 스택의 기본구조 파악  

  스택은 크기에 제한이 있어야 한다.  
  스택이 꽉차면 오버플로가 나기 때문에 확인하는 함수 필요  
  top으로 스택의 상태 확인 ( top 초깃값 = -1  : 스택이 비어있다.)
  ```python
  stack = []
  stack.append(5) # 삽입(5)
  stack.append(2) # 삽입(2)
  stack.append(3) # 삽입(3)
  stack.append(7) # 삽입(7)
  stack.pop()     # 삭제() : 7 삭제
  stack.append(1) # 삽입(1)
  stack.append(4) # 삽입(4)
  stack.pop()     # 삭제() : 4 삭제
  
  print(stack[::-1]) # 최상단 원소부터 출력
  # out : [1, 3, 2, 5]
  print(stack)       # 최하단 원소부터 출력
  # out : [5, 2, 3, 1]
  ```
  
  ```python
  # 심화
  
  ## 함수 선언부
  def isStackFull():
      global SIZE, stack, top
      if (top >= SIZE-1) :
          return True
      else :
          return False
  
  def push(data) :
      global SIZE, stack, top
      if (isStackFull()) :
          print('스택 꽉 찼다!')
          return
      top +=1
      stack[top] = data
      
  def isStackEmpty() :
      global SIZE, stack, top
      if (top == -1) :
          return True
      else :
          return False
      
  def pop() :
      global SIZE, stack, top
      if (isStackEmpty()) :
          print('스택 비었다!')
          return None
      print('pop --> ', stack[top])
      stack[top] = None
      top -=1
      
      
  ## 전역 변수부
  SIZE = 5
  stack = [None for _ in range(SIZE)]
  top = -1
  
  ## 메인 코드부
  push('커피1')
  push('커피2')
  push('커피3')
  push('커피4')
  push('커피5')
  print(stack)
  
  print('--------------------------------------')
  
  push('커피6')
  print(stack)
  
  print('--------------------------------------')
  
  pop()
  pop()
  pop()
  pop()
  pop()
  print(stack)
  
  pop()
  print(stack)
  ```
  
  ```python
  # out : 
  ['커피1', '커피2', '커피3', '커피4', '커피5']
  --------------------------------------
  스택 꽉 찼다!
  ['커피1', '커피2', '커피3', '커피4', '커피5']
  --------------------------------------
  pop -->  커피5
  pop -->  커피4
  pop -->  커피3
  pop -->  커피2
  pop -->  커피1
  [None, None, None, None, None]
  스택 비었다!
  [None, None, None, None, None]
  ```

---

### 큐(queue) 자료구조

![queue](https://media.vlpt.us/images/dorazi/post/a4cace31-1ec0-4371-b3db-e2177f899ce5/queue-implementation.png)

- 먼저 들어 온 데이터가 먼저 나가는 선입선출 형식의 자료구조

- 입구와 출구가 모두 뜷려 있는 터널과 같은 형태로 시각화 가능

- 파이썬에서 큐 구현을 위해  **deque 라이브러리** 사용

  **append()** 메소드 : 리스트 맨 오른쪽에 데이터 추가

  **popleft()** 메소드 : 리스트 맨 왼쪽에 있는 하나의 원소를 꺼냄 
  
  더 오래 걸리는 시간복잡도 문제로 인해 리스트를 사용하지 않고 deque를 사용한다.
  
  ```python
  from collections import deque
  
  queue = deque()
  
  queue.append(5) # 삽입(5)
  queue.append(2) # 삽입(2)
  queue.append(3) # 삽입(3)
  queue.append(7) # 삽입(7)
  queue.popleft() # 가장 왼쪽 원소 삭제() : 5 삭제
  queue.append(1) # 삽입(1)
  queue.append(4) # 삽입(4)
  queue.popleft() # 가장 왼쪽 삭제() : 2 삭제
  
  # 먼저 들어온 순서대로 출력
  print(queue[::-1]) 
  # out : [3, 7, 1, 4]
  
  # 나중에 들어온 원소부터 출력
  queue.reverse() # 역순으로 바꾸기
  print(queue)       
  # out : [4, 1, 7, 3]
  ```

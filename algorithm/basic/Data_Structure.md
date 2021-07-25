## 기본 자료구조

<br/>

<img src="https://images.velog.io/images/lhb7021/post/e8e1f02b-a506-4854-8f0c-3fe49c64dcbe/stack_queue.png" alt="stack,queue" style="zoom: 50%;" />

<br/>

---

<br/>

### 스택(stack) 자료구조

<br/>

![stack](https://hetalrachhhome.files.wordpress.com/2019/12/stack.png)

<br/>

- 먼저 들어 온 데이터가 나중에 나가는 선입후출 형식의 자료구조  
  입구와 출구가 동일한 형태로 스택을 시각화 가능

<br/>

- 파이썬에서 스택 구현은 별도 라이브러리가 필요 없이 기본으로 제공하는 리스트 자료형 사용


<br/>

- 스택의 기본구조 파악  

  스택은 크기에 제한이 있어야 한다.  
  스택이 꽉차면 오버플로가 나기 때문에 확인하는 함수 필요  
  top으로 스택의 상태 확인 ( top 초깃값 = -1  : 스택이 비어있다.)  
  데이터 추출(삭제) : pop
  ```python
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
  out : 
  ```
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

  <br/>

- 빠른이해를 위해 간결하게 만든 코드
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

  <br/>

- java

  ```java
  import java.utuil,*;
  
  public class Main {
      
      public static void main(String[] args) {
          Stack<integer> s = new Stack();
          
          // 삽입(5) - 삽입(2) - 삽입(3) - 삽입(7) - 삭제() - 삽입(1) - 삽입(4) - 삭제()
          s.push(5);
          s.push(2);
          s.push(3);
          s.push(7);
          s.pop;
          s.push(1);
          s.push(4);
          s.pop();
          
          // 스택의 최상단 원소부터 출력
          while (!s.empty()) {
              System.out.print(s.peek() + " ");
              s.pop();
          }
      }
  }
  ```




<br/>



### 큐(queue) 자료구조

<br/>

![queue](https://media.vlpt.us/images/dorazi/post/a4cace31-1ec0-4371-b3db-e2177f899ce5/queue-implementation.png)

<br/>

- 먼저 들어 온 데이터가 먼저 나가는 선입선출 형식의 자료구조
- 입구와 출구가 모두 뜷려 있는 터널과 같은 형태로 시각화 가능

<br/>

- 파이썬에서 큐 구현을 위해  deque 라이브러리 사용

  더 오래 걸리는 시간복잡도 문제로 인해 리스트를 사용하지 않고 deque를 사용한다.

  ```python
  from collections import decque
  
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

  <br/>

- java

  ```java
  import java.utuil,*;
  
  public class Main {
      
      public static void main(String[] args) {
          Queue<integer> q = new LinkedList<>();  // 연결리스트 방식이 가장 기본
          
          // 삽입(5) - 삽입(2) - 삽입(3) - 삽입(7) - 삭제() - 삽입(1) - 삽입(4) - 삭제()
          q.offer(5);
          q.offer(2);
          q.offer(3);
          q.offer(7);
          q.poll();   // 가장 먼저 보관한 자료 꺼냄
          q.offer(1);
          q.offer(4);
          q.poll();
          
          // 먼저 들어온 원소부터 추출
          while (!q.isEmpty()) {   // 큐가 비어있는지 확인해 비게 될때까지~
              System.out.print(q.poll() + " ");  // poll 메소드는 return도 수행      
          }
      }
  }
  ```





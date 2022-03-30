### 반복문 제어

for문에서는 <반복 범위>동안, while문에서는 <조건문>을 만족할 때까지 계속해서 <코드 블록>의 코드를 실행

반복문이 수행되고 있는 동안에 특정 조건을 만족하는 경우 반복을 멈추고 빠져나오거나 다음 반복을 수행하게 하는 경우 break와 continue 사용



- break

  break는 반복문을 중단시키고 빠져나옴 
  break가 실행되면 반복문이 완벽하게 실행된 것이 아니므로 else가 실행되지 않음

    ```python
  # a = 5 에서 반목문을 나왔기 때문에 5부터 print 안됨
  
  a = 10 
  while a > 1: 
      a -= 1
      if a == 5:
          break
      print(a)
  else:
      print('end')
  
  # out : 9 8 7 6
    ```
  
  
  
- continue

  반복문 안에서 continue를 만나면 반복문의 처음으로 돌아가서 다음 반복을 진행(다음 루프로 바로 넘어감) 
  
  반복문을 중단하지 않음
    ```python
  # a = 5 에서 다음 루프로 넘어가기 때문에 5는 print안됨 
  
  a = 10
  while a>1:
      a -= 1
      if a == 5:
          continue
      print(a)
  else:
      print('end')
  
  # out : 9 8 7 6 4 3 2 1 end
    ```
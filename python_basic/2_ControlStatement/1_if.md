![if_else](https://cdn.educba.com/academy/wp-content/uploads/2019/09/If-Else-in-Python.jpg)

### if_else 조건문  
다른 언어에서는 여러 문장을 실행할때 {}블록을 만드는데, python에서는 들여쓰기를 맞춰주면 블록 실행됨  
tab 대신에 스페이스바(space bar) 4번 권장

주피터 노트북, VScode 등 편집기에서는 자동 들여쓰기

- True일때만 수행  
  else를 생략할 수 있다.
    ```python
    a = 5
    if a > 3:
        print('y')
    # out : y
    ```
  
- False일 때 else 실행
    ```python
    a = 3
    if a>3:
        print('y')
    else :
        print('n')
    # out : n
    ```
    
- 인스턴스 방식으로 괄호 안이 비어 있는 값을 만들면 if에서 모두 False이다.
    ```python
    a = int()
    b = float()
    c = complex()
    d = list()
    ```
    
- 연산자
    |비교 연산자|설명|
    |:---:|:---:|
    |x<y|x가 y보다 작다|
    |x >y|x가 y보다 크다|
    |x==y|x와 y가 같다|
    |x!=y|x와 y가 같지 않다|
    |x>=y|x가 y보다 크거나 같다|
    |x<=y|x가 y보다 작거나 같다|
    ```python
    weight = 100
    if weight >= 90 :
    print("다이어트 필요")
    else :
    print("건강")
    # out : 다이어트 필요
    ```
    |논리 연산자|설명|
    |:---:|:---:|
    |x or y|x와 y 둘중에 하나만 참이어도 참이다|
    |x and y|x와 y 모두 참이어야 참이다|
    |not x|x가 거짓이면 참이다|
    ```python
    average_score = 70
    min_score = 30
    if average_score >= 60 and min_score >= 40 :
    print('합격')
    else : 
    print('불합격')
    # out : 불합격
    ```
    
- in, not in
  
    in : 있으면 True
    
    not in : 없으면 True
    
    ```python
    grade = ['A','B','C','D']
    my_grade = 'F'
    if my_grade in grade :
        print('pass')
    else :
        print('Fail')
    # out : Fail
    ```
    
- if ~ elif ~ else

    <조건문 1>이 True인지 검사하고 만족하면 <코드 블록 1> 수행

    만약 <조건문 1>을 만족하지 않는다면 그다음 조건문인 <조건문 2>를 검사하고 만족하면 <코드 블록 2>를 수행...

    마지막 조건문까지 갔을 때 만족하지 않는다면 else 이하 <코드 블록 m> 수행

    ```python
    if <조건문 1> :
        <코드 블록 1>
    elif <조건문 2>:
        <코드 블록 2>
        .
        .
        .
    elif <조건문 n>:
        <코드 블록 n>
    else :
        <코드 블록 m>
    ```

    ```python
    x = 85
    
    if x >= 90:
        print("A")
    elif (x >= 80) and (x < 90):
        print("B")
    else :
        print("C")
    # out : B 
    ```

- 중첩 조건문

    <조건문 1>을 만족하면 다시 <조건문 1-1>을 만족하는지 검사 후 만족하면 <코드 블록 1-1>을 수행, 만족하지 않으면 <코드 블록 1-2> 수행.

    ```python
    if <조건문 1>:
        if <조건문 1-1>:
            <코드 블록 1-1>
        else:
            <코드 블록 1-2>
    elif <조건문 2>:
        <코드 블록 2>
    else:
        <코드 블록 m>
    ```

    ```python
    x = 100
    
    if x >= 90:
        if x == 100:
            print("A+")
        else:
            print("A")
    elif (x >= 80) and (x <= 90):
        print("B")
    else:
        print("C")
    # out : A+
    ```

    
---
- 전체적인 구조 잡을 때 pass 활용

  pass는 코드가 실행되기는 하지만 아무 일도 일어나지 않는다.

  코드의 전체적인 구조를 먼저 만들 때 이용한다.

  ```python
  x = 75
  
  if x >= 80:
      pass
  else:
      pass
  ```

  


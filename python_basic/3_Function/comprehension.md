### comprehension

 - comprehension이란 iterable한 오브젝을 생성하기 위한 방법 중 하나이다. (값을 초기화할 때 사용)  
 - comprehension은 실행속도가 빠르고, 코드가 간결하다.
 - 파이썬에는 다음과 같은 3가지 종류의 comprehension이 있다.  
 1. List Comprehension(LC)  
 [표현식 for 변수 in sequence]  
 list(표현식 for 변수 in sequence)
     ```python
     a = [i for i in range(5)]
     a
     # out : [0,1,2,3,4]
     ```
     ```python
     b = [ i*2 for i in range(3) if i % 2==0]
     b
     # out : [0,4]
     ```
 2. Set Comprehension(SC)  
     [표현식 for 변수 in sequence]  
    set(표현식 for 변수 in sequence)  
    ```python
    c = set( i for i in 'apple' if i not in 'apl')
    c
    # out : {'e'}
    ```
 3. Dict Comprehencsion(DC)  
     {key:value for key, value in sequence}  
    dict([key:value for key, value in sequence})
    ```python
    d = { x:y for x,y in enumerate(['red','green','blue']) if x%2==0}
    d
    # out : {0: 'red', 2: 'blue'}
    ```
    
  

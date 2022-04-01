### Comprehension

간단하게 반복하는 한 줄 for 문

 - 컴프리헨션(Comprehension)은 내포(혹은 내장)라는 뜻으로 리스트, 세트, 딕셔너리에 코드가 내포돼 실횡되는 것을 의미한다.
 - comprehension은 실행속도가 빠르고, 코드가 간결하다.
 - 파이썬에는 다음과 같은 3가지 종류의 comprehension이 있다.  
 - 기본 구조

    ```python
    [<반복 실행문> for <반복 변수> in <반복 범위> if <조건문>] 
    ```
    
---


 1. List Comprehension(LC

     ```python
     [표현식 for 변수 in sequence]
     list(표현식 for 변수 in sequence)
     ```
     
     ```python
     # for 문
     numbers = [1.2.3.4.5]
     square = []
     
     for i in numbers:
         if i >= 3:
             square.append(i**2)        
     print(square) 
     # out : [9, 16, 25]
     
     
     # list comprehension
     numbers = [1,2,3,4,5]
     square = [i**2 for i in numbers if i >= 3] # list(i**2 for i in numbers if i >= 3)
     print(square) 
     # out : [9, 16, 25]
     ```
     
 2. Set Comprehension(SC)  
     
    ```python
    {표현식 for 변수 in sequence}
    set(표현식 for 변수 in sequence)  
    ```
    
    ```python
    c = {i for i in 'apple' if i not in 'apl'} # set(i for i in 'apple' if i not in 'apl')
    c
    # out : {'e'} 
    ```
    
 3. Dict Comprehencsion(DC)  
     
    ```python
    {key:value for key, value in sequence}  
    dict({key:value for key, value in sequence})
    ```
    
    ```python
    d = {x:y for x,y in enumerate(['red','green','blue']) if x%2==0} 
    # dict({x:y for x,y in enumerate(['red','green','blue']) if x%2==0})
    d
    # out : {0: 'red', 2: 'blue'}
    ```
    


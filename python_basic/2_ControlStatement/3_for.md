### for문
![for](https://media.geeksforgeeks.org/wp-content/uploads/20191101172216/for-loop-python.jpg) 



지정된 범위(iterable)만큼 반복하는 반복문 

in 뒤에 있는 iterable에서 값을 하나씩 뽑아서 변수에 할당

```python
for <반복 변수> in <iterable 반복 범위>:
    <코드 블록>
```



- 반복 범위 지정에 list 이용

    ```python
    for a in [1,2,3,[1,2]]:
        if a==1:
            continue # for문의 처음으로 돌아감
        print(a)
    else:
        print('end')
    
    # out : 2 3 [1.2] end
    ```
    
    리스트가 여러 개인 경우 len() 함수 활용
    
    len() 함수로 리스트의 길이 구한 후에 range() 함수의 인자로 넣어서 <반복 범위> 설정
    
    ```python
    names = ["Kim", "Park", "Choi"]
    scores = ["90", "80", "98"]
    
    for i in range(len(names)):
        print(names[i], scores[i])
    # out : 
    #    Kim 90
    #    Park 80
    #    Choi 98
    ```
    
- 반복 범위 지정에 range() 함수 이용

    range도 iterable이므로 for문에서 사용 가능
    
    ```python
    for i in range(1,4):
        print(i)
    
    # out : 1 2 3
    ```
    
- 중첩 for문
  
    ```python
    x_list = ["x1", "x2"]
    y_list = ["y1", "y2"]
    
    for x in x_list:
        for y in y_list:
            print(x,y)
    # out : 
    #    x1 y1
    #    x1 y2
    #    x2 y1
    #    x2 y2
    
    
    for i in range(2,4):
        for j in range(1,3):
            print(i*j)
    # out : 2 4 3 6
    ```
    
- 반복 범위 지정에 str 사용가능
    ```python
    for i in 'python':
        print(i)
    
    # out : p y t h o n
    ```
    
- 반복 범위 지정에 tuple 사용가능
    ```python
    for i in (1,2,3,4,5):
        print(i)
    
    # out : 1 2 3 4 5
    ```
    
- 반복 범위 지정에 set 사용가능  
  중복된 값은 제거됨  
  오름차순 정렬
  
    ```python
  for i in {2,3,2,1}:
      print(i)
  
  # out : 1 2 3
    ```
  
- 반복 범위 지정에 dictionary  
  set과 달리, dictionary는 정의된 순서대로 값을 반환  
  dictionary를 그냥 쓰면 for문에서 key만 반환
  
    ```python
  for i in {'b':2, 'a':1}:
      print(i)
  
  # out : b a
    ```
  key만 꺼내는 방법
    ```python
  for i in {'b':2, 'a':1}.keys():
      print(i)
  
  # out : b a
    ```
  value값만 가져오기
    ```python
  for i in {'b':2, 'a':1}.values():
      print(i)
  
  # out : 2 1
    ```
  둘 다 튜플로 리턴
    ```python
  for i in {'b':2, 'a',1}.items():
      print(i)
  
  # out : ('b',2 ) ('a', 1)
    ```
  
---

- zip()

  같은 길이의 데이터를 하나로 묶어줌

   zip() 함수를 이용해 for문 구성하면 <반복 범위>인 zip() 안에 있는 list1과 list2의 항목이 각각 순서대로 동시에 <반복 변수>인 var1, var2에 대입되고 <코드 블록> 수행

    ```python
    for var1, var2 in zip(list1, list2):
        <코드 블록>
    ```

  zip은 iterable 여러개를 받아서 새로운 iterable을 만들어 준다.  
  이때 zip의 결과는 같은 인덱스의 요소들을 묶어서 튜플로 반환  

  ```python
  for i in zip([1,2,3,4,5],['a','b','c','d','e'],[10,20,30,40,50]):
      print(i)
  
  # out : (1, 'a', 10) (2, 'b', 20) (3, 'c', 30) (4, 'd', 40) (5, 'e', 50)
  ```

  위에 있는 반복 범위 지정에 list를 사용한 경우 대신 zip()을 사용한 경우

    ```python
    for n, s in zip(names, scores):
        print(n, s)
    # out : 
    #    Kim 90
    #    Park 80
    #    Choi 98
    ```
- enumerate  
  enumerate는 index을 생성해서 사용할 때 이용한다.  
  for에 넣어 사용할 수 있다.  
  (순서, 값)형태로 literable을 바꿔준다.
  
    ```python
    for i in enumerate([1,2,3]):
        print(i)
    # out : (0,1) (1,2) (2,3)
    ```
   순서와 값을 unpacking
     ```python
  for i, v in enumerate([1,2]):
      print(i,v)
  # out : 
  #     0 1
  #     1 2
     ```

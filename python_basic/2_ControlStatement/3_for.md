### for문
![for](https://media.geeksforgeeks.org/wp-content/uploads/20191101172216/for-loop-python.jpg) 

 - in 다음에 iterable이 온다. (for 변수 in iterable)
 - iterable은 하나 이상의 데이터를 가지고 있는 container이다.
 - iterable은 ***iter***에 대해서 정의되어 있는 객체이다.
  

 for 변수 in iterable:  
    수행할 문장1  
    수행할 문장2  
    ..

in 뒤에 있는 iterable에서 값을 하나씩 뽑아서 변수에 할당
```python
for a in [1,2,3,[1,2]]:
    if a==1:
        continue # for문의 처음으로 돌아감
    print(a)
else:
    print('end')

# out : 2 3 [1.2] end
```
- range도 iterable이므로 for문에서 in 다음에 사용가능
```python
for i in range(1,4):
    print(i)

# out : 1 2 3
```
- for문은 중첩이 가능
```python
for i in range(2,4):
    for j in range(1,3):
        print(i*j)

# out : 2 4 3 6
```
- in 다음에 str 사용가능
```python
for i in 'python':
    print(i)

# out : p y t h o n
```
- in 다음에 tuple 사용가능
```python
for i in (1,2,3,4,5):
    print(i)

# out : 1 2 3 4 5
```
- in 다음에 set 사용가능  
중복된 값은 제거됨  
오름차순 정렬
```python
for i in {2,3,2,1}:
    print(i)

# out : 1 2 3
```
- in dictionary  
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
- zip  
zip은 iterable 여러개를 받아서 새로운 iterable을 만들어 준다.  
zip의 결과를 튜플로 반환한다.  
같은 인덱스의 요소들을 묶어서 반환한다.  
```python
for i in zip([1,2,3,4,5],['a','b','c','d','e'],[10,20,30,40,50]):
    print(i)

# out : (1, 'a', 10) (2, 'b', 20) (3, 'c', 30) (4, 'd', 40) (5, 'e', 50)
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
# out : 0 1
#       1 2
```

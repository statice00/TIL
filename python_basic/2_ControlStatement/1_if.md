![if_else](https://cdn.educba.com/academy/wp-content/uploads/2019/09/If-Else-in-Python.jpg)

### if_else 조건문  
다른 언어에서는 여러 문장을 실행할때 {}블록을 만드는데, python에서는 들여쓰기를 맞춰주면 블록 실행됨  
tab 대신에 스페이스바(space bar) 4번 권장 
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
|비교연산자|설명|
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
|연산자|설명|
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
```python
grade = ['A','B','C','D']
my_grade = 'F'
if my_grade in grade :
    print('pass')
else :
    print('Fail')
# out : Fail
```


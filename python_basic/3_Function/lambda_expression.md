### lambda
- 식 형태로 되어 있다고 해서 람다 표현식(lamba expression)이라고 부른다.  
- 특히, 람다 표현식은 함수를 간편하게 작성할 수 있어 다른 함수의 인수로 넣을 때 주로 사용한다.  
- lambda는 재사용하지 않을 함수를 만들 때 사용해서 익명함수라 부르기도 한다.
1. 일반함수와 람다(lambda)표현식  
```python
def plus_ten(x):
    return x+10

plus_ten(3) 
# out : 13
```
```python
plus_ten2 = lambda x : x+10
plus_ten2(3)
# out : 13
```
2. 람다표현식 자체를 호출하기  
(lambda 매개변수 : 식)(인수)
```python
(lambda x: x+10)(3)
# out : 13
```
3. 람다표현식 바깥에 있는 변수 사용가능
```python
y = 10
(lambda x: x+y)(3)
# out : 13
```
4. 람다표현식으로 매개변수가 없는 함수 만들기  
매개변수들은 생략할 수 있지만 : 뒤의 표현식은 생략불가
```python
(lambda : 1)()
# out : 1
```
5. 람다 표현식을 인수(argument)로 사용하기  
map(함수, 리스트) : 리스트의 요소를 지정된 함수로 처리해주는 함수  
    ```python
    list(map(lambda x : x+10, [1,2,3]))
    # out : [11, 12, 13]
    ```
    filter(함수, iterable) : iterable을 함수에 적용해 True이면 남기고, False이면 제거하는 함수
    ```python
    a = [1,2,3,4,5,6,7]
    list(filter(lambda x : x%2==0, a))
    # out : [2, 4, 6, 8]
    ```

- 여러개의 원소로 구성되어 있는 것을 container라 한다.

||container의 특징|||
|:---:|:---:|:---:|:---:|
|구분|예||아니오||
|같은 타입만 요소로 갖는가?|homogeneous|<->|heterogeneous|
|순서가 중요한가?|sequence|<->|non-sequence|
|바뀔 수 있는가?|mutable|<->|immutable|
---
## sequence
다른 데이터를 포함하는 순서가 있는 집합 자료형
![sequence](https://dojang.io/pluginfile.php/13491/mod_page/content/4/011002.png)



</br>



### 문자열(string)

**homogeneous, sequence, immutable**한 container이다. (같은 타입만 요소로 같고, 순서가 중요하며 바뀔 수 없다.)

작은따옴표(')로 묶거나 큰따옴표(")로 묶는다. 둘 중 어떤 것을 사용해도 되지만 양쪽에는 같은 기호를 사용해야 함

```python
a = 'python'
b = "sql"

type(a) # out : str
```
- 삼중 따옴표로 묶기

    만약 문자열에 큰따옴표와 작은따옴표를 모두 포함하고 싶거나 문장을 여러 행 넣고 싶거나 입력한 그대로 출력하고 싶을 때는 문자열 전체를 삼중 큰따옴표나 삼중 작은따옴표로 감싸면 된다.

    파이썬에서 sql문 쓸때 사용

    ```python
    sql = """
    SELECT  *
      FROM  TEST_TABLE
    """
    ```

- index

    ```python
    a[0]  # 첫번째 문자
    a[-1] # 오른쪽부터 역순으로 가져옴
    ```

- slice  
  대괄호[]안에 시작할 인덱스와 끝나는 인덱스를 :(콜론)으로 구분  
  (-)음수를 넣으면 역순으로 가져온다.

    ```python
    a[0:2] # 0이상 2미만 요소 리턴
    a[:2]  # 시작인덱스 생략 : 0부터
    a[0:]  # 끝 인덱스 생략 : 끝까지
    a[:]   # 처음부터 끝까지
    a[::1] # 처음부터 끝까지 1씩 간격
    a[::-2] # 거꾸로 2씩 간격
    ```
  
- 포맷팅  
  %d : 10진수 정수  
  %f : 실수  
  %s : 문자열  
  %c : 단일 문자 
  %h : 16진수 정수 
  %o : 8진수 정수  
  %% : 문자 %   
  format() 메소드

    ```python
    total = 100
    print('총 인원은 %d명 입니다.' % total)
    print('%d명 %d명 %d명' % (20,30,40))
    ```
  format() 메소드
    ```python
    print('총 인원은 {}명 입니다.' .format(total))
    print('{}명 {}명 {}명' .format(20,30,40))
    ```
  
- 제어문자  
  제어문자는 \로 시작하는 escape sequence  
  \n : 다음 줄로 이동  
  \t : tab

    ```python
    print(1,2,3, sep = '\n')
    print('1\t2\t3')
    ```
  
- 정수,소수 자리수 지정

    ``` python
    pi = 3.14159256
    print('%10.2f' % pi) # 정수자리 10개, 소수자리 2개
    ```

- 문자열 반복

    ``` python
    'python' * 3
    ```

- replace()  
  문자열을 대체함  
  replace('바꿀문자', '대체문자') 

    ``` python
    a = '파ython'
    print(a.replace('파','p')) 
    ```
  
- find(), index()  
  문자열 내부에 특정 문자가 들어있는 인덱스번호를 리턴  

    ``` python
    a.find('p')
    a.index('p')
    ```
  
- count()  
  문자열에서 검색하는 문자가 등장하는 횟수를 리턴 

    ``` python
    a.count('p') 
    ```
  
- isalpha()
  모든 문자가 알파벳 형태인지 검색(True, False)

    ``` python
    a.isalpha()
    ```
  
- isdecimal()  
  모든 문자가 숫자형태인지 검색(True, False)

    ``` python
    a.isdecimal()
    ```
  
- split()  
  구분자를 기준으로 문자열을 분할하여 list로 리턴

    ``` python
    data = 'python java oracle'
    print(data.split()) # 공백으로 분할
    # out : ['python', 'java', 'oracle']
    ```
  
- 공백제거  
  lstrip() : 왼쪽 공백 제거  
  rstrip() : 오른쪽 공백 제거  
  strip() : 양쪽 공백 제거

    ``` python
    data = '    python'
    data.lstrip() # out : python
    ```
  
- 대소문자 변경  
  lower() : 영문자를 모두 소문자로 변경  
  upper() : 영문자를 모두 대문자로 변경  
  swapcase() : 영문자의 대소문자를 모두 반대로 변경  
  capitalize() : 문장의 맨 첫 글자만 대문자로 변경  
  title() : 단어마다 첫글자를 대문자로 변경

    ``` python
    data = 'python korea'
    print(data.upper()) # out : PYTHON KOREA
    print(data.title()) # out : Python Korea
    ```




### 입력과 출력

실행한 결과를 화면이나 파일로 출력

- sep 인자

  print() 출력 구분자로 빈칸 대신 다른 문자열을 넣을때 사용

  ```python
  print("Mon", "Tues", "Wedns", "hustle days", sep = "day ")
  # out : Monday Tuesday Wednsday hustle days
  ```

- 더하기 연산자

  print()출력 시 빈칸을 없애고 문자열을 연결하려면 콤마 대신 더하기 연산자 사용

  ```python
  print("ber"+"serk")
  # out : berserk
  ```

- 이스케이프 문자

  \로 시작하는 escape sequence 

  ```python
  print("\n") //줄바꿈
  print("\t") //수평 탭(Tab)
  print("\\") // \ 백슬래시
  print("\"") // " 큰 따옴표
  print("\'") // ' 작은 따옴표
  ```

  ```python
    print("A\nB\nC") # print("A", "B", "C", sep = "\n")
    # out :
    #    A
    #    B
    #    C
    
    print("A\tB\tC") # print("A", "B", "C", sep = "\t")
    # out : A	B	C
  ```


---

#### 형식 지정 출력

- %연산자 이용해 형식 및 위치 지정  
  %d : 10진수 정수  
  %f : 실수  
  %s : 문자열  
  %c : 단일 문자 
  %h : 16진수 정수 
  %o : 8진수 정수  
  %% : 문자 %   
  
    ```python
    total = 100
    print('총 인원은 %d명 입니다.' % total)  # % (100)
    # out : 
    #    총 인원은 100명 입니다.
    
    print('%d명 %d명 %d명' % (20,30,40))
    # out :
    #    20명 30명 40명
    ```

- format() 메소드

    출력 형식을 지정하지 않아도 데이터의 타입에 맞게 출력함

    {N}의 N은 0부터 시작하는 숫자로 format()에서 데이터의 위치(0부터 시작)을 의미한다.

    ```python
    total = 100
    print('총 인원은 {}명 입니다.' .format(total))
    # out : 총 인원은 100명 입니다.
    
    # format() 안의 데이터를 순차적으로 지정하려면 N없이 {}만 지정해도 된다.
    print('{}명 {}명 {}명' .format(20,30,40))
    # out : 20명 30명 40명
    
    # 지정한 순서대로 출력
    print('{2}명 {0}명 {1}명' .format(20,30,40))
    # out : 40명 20명 30명
    
    # format() 안에 데이터의 내용 중 일부만 출력 가능
    print('{2}명 {0}명' .format(20,30,40))
    # out : 40명 20명
    ```

- 정수,소수 자리수 지정

    {N:'출력 형식'}
    
    ``` python
    pi = 3.14159256
    print('%10.2f' % pi) # 정수자리 10개, 소수자리 2개
    # out : 3.14
    
    a = 0.123456789
    print("{0:.2f}, {0:.5f}" .format(a)) # format()의 0번째 데이터를 소수자리 2개, 5개로 출력
    # out : 0.12, 0.12346
    
    data = 3
    money = 7457000
    print("{0:05d}" .format(data)) # 정수 5자리, 남는 앞부분은 0으로 채움
    # out : 00003
    
    print("{0:>5d}" .format(data)) # 정수 5자리, 오른쪽 정렬
    # out :     3
    
    print("{0:,}" .format(money)) # 통화 표시처럼 끝에서 셋째 자리마다 콤마 표시
    # out : 7,457,000
    
    print("{0:.2%}" .format(a)) # 소수를 퍼센트(%) 표시. 지정 소수점 자리까지 반올림
    # out : 12.35%
    
    print("{0:.2e}" .format(a)) # 소수를 지수로 표시. 지수 표시에서 소수점 자리 수는 '.'다음 숫자
    # out : 1.23e-01
    ```

---

#### 키보드 입력

- input()

  키보드로 데이터를 입력하기 위해 input() 함수 사용.

  input() 함수 안의 문자열은 화면에 표시되고 키보드로 데이터를 입력한 후 Enter를 누르면 입력된 데이터는 문자열 형태로 변수에 대입된다.

  input()으로 입력받으면 문자열로 처리되기 때문에 입력한 숫자를 연산에 이용하려면 정수나 실수로 변환해야 사용가능하다.

  ```python
  yourName = input("What is your name?") # 입력창에서 입력 후 Enter
  print("Oh, your name is {}" .format(yourName)) 
  # out : Oh, your name is HY
  
  a = input("정사각형 한 변의 길이는?: ")
  area = float(a)**2 # 정수 입력해서 정수로 출력하고 싶으면 int() 사용
  print("정사각형의 넓이 : {}" .format(area))
  # out : 정사각형의 넓이 : 9.0
  ```

---

#### 파일 읽고 쓰기

출력 결과를 화면이 아니라 파일로 출력 or 파일에서 데이터를 읽어야 하는 상황

open('파일경로', '파일열기모드')  
- 파일 열기

  파일을 읽고 쓰려면 먼저 open() 함수 사용해 파일을 연다. 
  
  ```python
  f = open("file_name", "mode")
  ```
  
  | mode  | 의미                                                         |
  | ----- | ------------------------------------------------------------ |
  | **r** | 읽기 모드로 파일 열기(기본). 모드를 지정하지 않으면 기본적으로 읽기 모드로 지정 |
  | **w** | 쓰기 모드로 파일 열기. 같은 이름의 파일이 있으면 기존 내용은 모두 삭제 |
  | x     | 쓰기 모드로 파일 열기. 같은 이름의 파일이 있을 경우 오류가 발생 |
  | **a** | 추가 모드로 파일 열기. 같은 이름의 파일이 있으면 기존 내용은 모두 삭제 |
  | b     | 바이너리 파일 모드로 파일 열기                               |
  | t     | 텍스트 파일모드로 파일 열기(기본). 지정하지 않으면 기본적으로 텍스트 모드로 지정 |
  
  mode는 혼합해서 사용 가능하며, default는 "rt"

- 파일 쓰기

  파일 쓰기를 하려면 우선 파일을 쓰기 모드로 열고 지정한 내용을 쓴 후 닫아야 한다.

  ```python
  # 상대경로에 만드는 경우. 이미 설정된 폴더에 생성
  # 절대경로는 파일경로 자리에 직접 위치주소를 넣음.
  f = open("file_name", "w")
  f.write(str)
  f.close()
  ```

  열 파일이 사전에 생성되지 않은 경우 문자열이 저장된 파일 하나가 만들어짐

  ```python
  str = "My plan"
  
  f = open("./test.txt", "w") # 파일 쓰기 모드로 열기
  f.write(str)                    # 연 파일에 문자열 쓰기
  f.close()                       # 파일 닫기
  ```

- 파일 읽기

  파일 읽기를 하려면 우선 파일을 읽기 모드로 열어야 한다.

  ```python
  f = open("file_name", "r") # f = open("file_name") 도 가능
  data = f.read()
  f.close()
  ```

  ```python
  f = open("./test.txt", "r") # 파일 읽기 모드로 열기
  file_text = f.read()            # 파일 내용 읽은 후에 변수에 저장
  f.close()                       # 파일 닫기
  
  print(file_text)
  # out : My plan
  ```

- 파일에 문자열 한 줄씩 쓰기

  반복문 for문을 이용해 문자열을 한 줄씩 파일에 작성

    ```python
    fwrite = open("sample.txt", "w") # sample.txt 파일에 데이터를 출력한다. w는 update
    for i in range(1,11):
        data = "%d번째 줄입니다.\n" % i
        fwrite.write(data)
    f.close() # 파일 닫기 필수   
    ```
  
  ```python
  # 파일이 잘 생성됐는지 확인
  # !type 파일이름
  !type sample.txt
  
  # out : 
  #    1번째 줄입니다.
  #    2번째 줄입니다.
  #    3번째 줄입니다.
  #    4번째 줄입니다.
  #    5번째 줄입니다.
  #    6번째 줄입니다.
  #    7번째 줄입니다.
  #    8번째 줄입니다.
  #    9번째 줄입니다.
  #    10번째 줄입니다.
  ```
  
- 파일에서 문자열 한 줄씩 읽기

  open() 함수로 파일을 연 후 read()로 내용을 읽으면 파일 내용 전체를 반환하므로 내용을 한 줄씩 처리해야 할 때는 사용하기 힘들다.

  파일 내용을 한 줄씩 읽고 처리하려면 readline() 이나 readlines() 를 사용한다.

  - readline()

    파일을 연 후 readline()을 실행하면 실행한 횟수만큼 파일로부터 문자열 한 줄씩 읽는다.

    마지막 한 줄을 읽고 나서 readline()을 실행하면 빈 문자열을 반환

    ```python
    f = open("sample.txt")
    line1 = f.readline()
    line2 = f.readline()
    f.close
    
    # readline()으로 읽은 문자열에는 이미 \n 이 포함되어있으므로 줄 바꿈이 중복되지 않게 end=""
    print(line1, end="")
    print(line2, end="")
    
    # out :
    #    1번째 줄입니다.
    #    2번째 줄입니다.
    ```

    readline()은 파일의 맨 끝 줄을 읽고 난 후 다시 실행하면 빈 문자열을 반환하는 특성을 갖는데, 이를 활용해 while() 문과 readline()으로 파일 전체에서 문자열을 한 줄씩 읽어올 수 있다.

    ```python
    f = open('sample.txt', 'r') # 파일을 읽기 모드로 연다
    line = f.readline()         # 문자열 한 줄 읽기 
    while line:                 # line이 공백인지 검사해서 반복 여부 결정
        print(line, end="")     
        line = f.readline()
    f.close()
    ```

    ```python
    fread = open('sample.txt', 'r') # sample.txt.파일의 데이터를 읽어온다
    while True :
        # 파일의 끝이 어딘지 모르므로 무한루프 돌리고 중간에 빠져나온다
        line = fread.readline()  # readline()은 파일에서 한 라인씩 읽어옴
        if not line:  # not False = True 읽을 line이 없으면 현재 반복문을 빠져 나간다.
            print("line 없음", line)
            break
        print(line, end="")
    fread.close()
    ```

  - readlines()

    readline()은 파일에서 문자열을 한 줄씩 읽었지만 readlines()는 파일 전체의 모든 줄을 읽어서 한 줄씩을 요소로 갖는 리스트 타입으로 반환

    ```python
    f = open("sample.txt")
    lines = f.readlines()
    f.close()
    
    print(lines)
    # out : ['1번째 줄입니다.\n', '2번째 줄입니다.\n', '3번째 줄입니다.\n', '4번째 줄입니다.\n', '5번째 줄입니다.\n', '6번째 줄입니다.\n', '7번째 줄입니다.\n', '8번째 줄입니다.\n', '9번째 줄입니다.\n', '10번째 줄입니다.\n']
    
    
    # 리스트로 반환하므로 반복 범위로 지정 가능
    f = open("sample.txt")
    lines = f.readlines()
    for line in lines:
        print(line[0], end=" ")
    # out : 1 2 3 4 5 6 7 8 9 1 
    
    # 반복 범위에 f.readlines() 대신 f만 입력해도 가능
    f = open("sample.txt")
    for line in f:
        print(line[0], end="\t")
    # out : 1 2 3 4 5 6 7 8 9 1
    ```

#### with 문을 활용해 파일 읽고 쓰기 

기존 : 파일 열기 -> 파일 읽고/쓰기 -> 파일 닫기

with문 : 파일 열기 -> 파일 읽고/쓰기

즉, with문과 함께 파일을 사용하면 읽기, 쓰기할때 close()를 안해도 된다. (열린 파일 객체는 자동으로 닫힘)

```python
with open("file_name", "mode") as f:
    <코드 블록>
```

파일 쓰기

```python
with open("file_name", "w") as f:
    f.write(str)
```

파일 읽기

```python
with open("file_name") as f:
    data = f.read()
```

- with 문 활용

    ```python
    # 파일 쓰기
    with open('sample.txt', 'w') as f:
        for i in range(1,11):
            data = '%d번째 줄입니다.\n' % i
            f.write(data) 
    
    # 파일 읽기
    with open('sample.txt', 'r') as f:
        while True : 
            line = f.readline()
            if not line:
                break
            print(line)
    ```
    
    ```python
    with open('info.txt', 'r') as f:
        for line in f:
            #print(line)
            name, weight, height = f.readline().strip().split(',')
            #print(name,weight,height)   
            bmi = int(weight) / ((int(height)/100) * (int(height)/100))
            #print(bmi)
    
            # bmi : 산출된 값이 18.5 이하면 저체중, 18.5~23은 정상, 23~25는 과체중
            # 25~30은 비만 30이상은 고도비만
            result = ""
            if 25 <= bmi :
                result = "과체중"
            elif 18.5 <= bmi :
                result = "정상체중"
            else :
                result = "저체중"
            #print(result)
            print('\n'.join(['이름:{}', '몸무게:{}', '키:{}', 'BMI:{}', '결과:{}']).format(name,weight,height,bmi,result))
    ```

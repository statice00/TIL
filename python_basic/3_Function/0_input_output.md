### 파일 입출력
open('파일경로', '파일열기모드')  
- 파일열기모드
 - w : 쓰기모드 - 파일에 내용을 쓸 때 사용  
 - r : 읽기모드 - 파일에 내용을 읽을 때 사용  
 - a : 추가모드 - 파일에 내용을 추가할 때 사용    

 ```python
# 상대경로에 만드는 경우. 이미 설정된 폴더에 생성
# 절대경로는 파일경로 자리에 직접 위치주소를 넣음.
fwrite = open('sample.txt', 'w') # sample.txt 파일에 데이터를 출력한다. w는 update
for i in range(1,11):
    data = '%d번째 줄입니다.\n' % i
    fwrite.write(data)
f.close() # 파일 닫기 필수   
 ```
 ```python
 fread = open('sample.txt', 'r') # sample.txt.파일의 데이터를 읽어온다
while True :                   # 파일의 끝이 어딘지 모르므로 무한루프 돌리고 중간에 빠져나온다
    #line = fread.readline()  # readline()은 파일에서 한 라인씩 읽어옴
    line = fread.read()     # read()는 파일에서 전체를 읽어와 str으로 리턴한다.
    if not line:  # not False = True 읽을 line이 없으면 현재 반복문을 빠져 나간다.
        print("2:", line)
        break     # False가 되면 수행이 안됨. not False = True로 바꿈
    print(line)
fread.close()
```

```python
# open('파일경로', '모드')
# 모드 : 파일을 r읽을거냐 w쓸거냐 a추가할거냐
fwrite = open('sample.txt', 'a') # sample.txt 파일에 데이터를 추가한다 a는 append
for i in range(11,21):
    data = '%d번째 줄입니다.\n' % i
    fwrite.write(data)
f.close() # 파일 닫기 필수
```

### with 문과 같이 사용  
- with문과 함께 파일을 사용하면 읽기, 쓰기할때 close()를 안해도 된다.

```python
with open('sample.txt', 'w') as f:
    for i in range(1,11):
        data = '%d번째 줄입니다.\n' % i
        f.write(data) 

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


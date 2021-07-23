## pandas
<br/>

numpy datatype : array, matrix

pandas datatype : series, DataFrame

- csv파일 불러올때 오류

  1. 해결책 : encoding=’utf-8’ or encoding='cp949'등 파일 인코딩에 맞춰서 해결

  ```
  train = pd.read_csv("C:\\Users\\song1\\acorn\\Project\\Final-Project\\parking.csv", engine='python')
  ```

  pandas에서 read_csv 옵션으로 encoding을 'utf-8'로 지정해 주는 것입니다.

   

  2. 해결책 : engine=’python’

  ```
  train = pd.read_csv("C:\\Users\\song1\\acorn\\Project\\Final-Project\\parking.csv", engine='python')
  ```

  pandas에서 read_csv 옵션으로 engine을 python으로 지정해 주는 것입니다.



- 웹 주소에서 데이터 불러오기

  ```python
  data = pd.read_csv("https://raw.githubusercontent.com/mwaskom/seaborn-data/master/tips.csv")
  ```

- pandas dataframe 정보 확인

  Column이름, Null값 존재여부, DataType, 메모리 사용 확인가능

  ```python
  data.info()
  ```

- pandas dataframe 데이터 확인 - head(), tail(), sample()

  ()안에 값을 지정하면 지정한 값만큼 보여주며, 지정안하면 default값은 다음과 같음

  ```python 
  data.head() # 앞의 5개 행을 보여준다
  
  data.tail() # 마지막 5개 행을 보여준다
  
  data.sample() # random으로 1개씩 보여준다.
  ```

- pandas dataframe 데이터만 가져오기

  ```python
  data.values # dataframe이 풀리며 안에 있는 데이터 값들이 가져와진다
  ```

- pandas  dataframe index, column명확인

  ```python
  data.index # index 정보만 가져온다
  
  data.columns # 현재 데이터의 column명을 확인
  ```

- pandas dataframe 값 가져오기

  column을 slicing을 이용해 가져오는 건 불가 ex)  data['column1':'column2']

  ```python
  data['column1'][2] # dictionary방식.  column1의 2번째 행 출력
  
  data.column1  # attribute방식.  column1 출력
  
  data[['column1', 'column2']] # fancy indexing을 이용해 여러 열들을 동시에 가져올 수 있음
  ```

  row를 slicing을 이용해 가져올 수 있음

  ```python
  data[1:3]  # 1번 index 이상 3번 index 미만. 즉, 1, 2 index 행 출력
  ```

  data.iloc : index를 이용해 데이터를 가져옴

  data.loc : 이름을 이용해서 데이터를 가져옴 

  ```python
  data.iloc[3]  # 3 index 행 출력
  
  data.iloc[0:5]  # 0~4 index 행 출력
  
  data.iloc[[0,3,5]]  # fancy indexing. 0,3,5 index 행 출력
  
  data.iloc[3][1]  # 3번째 행, 1번째 열에 위치한 값
  
  data.iloc[0:3, 1:4] # 0이상 3미만 행, 1이상 4미만 열 가져옴
  
  data.iloc[[0,3,5], [1,4,5]]  # fancy indexing
  ```

  ```python
  # 행은 이름이 설정돼 있지 않아 자동으로 생성된 Range index가 이름이 된다.
  # 즉, index로 가져오는게 아니어서 숫자 그대로 가져옴
  data.loc[0:5, 'column1':'column3']  # 0~5번째 행, column1~column3 열
  ```
<br/>
  ---

  ---
<br/>
  
### dataframe 전처리, 핸들링

- pandas dataframe 중복행 제거

  ```python
  DataFrame.drop_duplicates(subset=None, keep='first', inplace=False, ignore_index=False)[source]
  ```

- pandas dataframe 행 추가

  ```python
  # dataframe끼리 결합
  df = pd.concat([df, new_df])
  
  # dictionary(칼럼 이름은 키,  데이터를 값)
  df = df.append(new_data, ignore_index=True)
  
  # list를 새로운 행으로
  df.loc[len(df)] = new_data
  ```

- pandas 특정 값과 일치하는 데이터 필터링

  ```python
  is_df = df['name'] == 'kim'
  new_df = df[is_df]
  new_df
  ```

- pandas dataframe 필요한 열 추출

  ```python
  df_sample = df[['주소', 'col2']]
  ```

- pandas join

  ``` python
  df_INNER_JOIN = pd.merge(dataframe_A, dataframe_B, left_on='key', right_on='key', how='inner')
  print(df_INNER_JOIN)
  
  df_OUTER_JOIN = pd.merge(dataframe_A, dataframe_B, left_on='key', right_on='key', how='outer')
  print(df_OUTER_JOIN)
  
  df_LEFT_JOIN = pd.merge(dataframe_A, dataframe_B, left_on='key', right_on='key', how='left')
  print(df_LEFT_JOIN)
  
  df_RIGHT_JOIN = pd.merge(dataframe_A, dataframe_B, left_on='key', right_on='key', how='right')
  print(df_RIGHT_JOIN)
  ```

- pandas dataframe column명 수정

  ```python
  # 전체수정
  df.columns = ['c1', 'c2', 'c3']
  
  # 부분수정
  df.columns.values[0] = "KK"
  
  # 직접수정
  df.rename(columns = {'old_name':'new_name','old_name2':'new_name2' }, inplace = True)
  ```

- pandas dataframe 열 삽입

  ```python
  df.insert(위치 인덱스, 'column이름', data, allow_duplicates = True)
  ```

- pandas dataframe index 재설정

  ```python
  df.reset_index()
  
  # 원래 인덱스까지 삭제
  df.reset_index().drop(['index'], axis=1)
  ```

- 행,열 삭제

  ```python
  df.drop(['행이름'], axis = 0)
  df.drop(['열이름'], axis = 1)
  ```

- 조건에 맞는 여러 행 삭제

  ```python
  is_true = df_price[df_price['시장이름']=='방림시장'].index
  df_price.drop(is_true, inplace=True)
  ```

- 열에서 중복값제거한 값들 확인

  ```python
  print(len(df_price['시장이름'].unique()), df_price['시장이름'].unique())
  ```

- null 확인

  ```python
  df.info()
  df[['열 이름'].isnull()]
  ```

- 결측값이 있는 행만 빼고 선택

  ```python
  df = df[df['총_생활인구_수'].notna()]
  ```

- 특정 열 내에서 값의 빈도수 계산

  ```python
  freq = df[['시장이름','품목이름']].groupby(['품목이름']).count()
  freq.sort_values(by = ['시장이름'], ascending = False)
  ```

- dataframe 조건설정해서 추출

  ```python
  df['state'] == 'NY'
  
  # 복수조건 and : &    or : |
  df(df['age'] < 35) & ~(df['state'] == 'NY')
  ```

  ```python
  data[data['tip']>=5].loc[:,'tip':'day']  # loc
  
  data[data['tip']>=5].iloc[:,1:5]  # iloc
  
  data[data['tip']>=5][['tip','day']]  # fancy indexing
  
  data[(data['day']=='Sun') | (data['day']=='Sat')] # | : 또는
  data[(data['day']=='Sun') & (data['sex']=='Male')] # & : 그리고
  ```

- pandas dataframe 생략없이 출력

  ```python
  # row 생략 없이 출력
  pd.set_option('display.max_rows', None)
  # col 생략 없이 출력
  pd.set_option('display.max_columns', None)
  ```


- dataframe groupby 
df.groupby()
만약 c1을 제외한 모든 열들이 연속형 변수라면, c1을 기준으로 전체 연속형 변수에 대해 집계함
  ```python
  df.groupby().count() # 열에서 값이 발생하는 횟수 계산

  df.groupby().sum()

  df.groupby().mean()
  ```
  집계된 dataframe에서 집계된 기준도 열로 빼고 싶으면 .reset_index()를 사용한다.

- dataframe 정렬
  ```python
  df.sort_values(by='c1', axis=0) # c1기준으로 오름차순 정렬

  df.sort_values(by='c1', axis=1) # 내림차순 정렬

  df.sort_values(by=['c1'], axis=0, na_position='first') # 결측값 처음에 위치

  df.sort_values(by=['c1'], axis=0, na_position='last') # 결측값 마지막에 위치

  ```

<br/>

---

- 문자열 관련 전처리   

  1. 인덱싱  .str[]
  ```python
  df['주소'].str[:5] # 앞 5자리까지만 추출

  df['주소'].str[-1] # 마지막 한글자만 추출
  ```
  2. 분할  .str.split()
  ```python
  df['주소'].str.split(" ")  # 공백을 기준으로 분리해 각 행을 리스트로 

  df['주소'].str.split(" ", expand+True)  # 분할된 개별 리스트를 바로 데이터프레임으로 만든다
  ```
  3. 시작글자 인식  .str.starswith()
  ```python
  # 서울로 시작하는 데이터만 필터링
  df[df['주소'].str.startswith("서울")].head()
  ```
  4. 끝글자 인식  .str.endswith()
  ```python
  # 동으로 끝나는 데이터만 필터링
  df[df['주소'].str.endswith("동")].head()
  ```
  5. 포함글자  .str.contains()
  ```python
  # 관악구가 들어간 데이터만 필터링
  df[df['주소'].str.contains("관악구")].head()
  ```
  6. 문자 위치찾기 
  ```python
  # 왼쪽부터 검색후 위치반환 없으면 -1
  df['주소'].str.find(' ').head()

  # 찾은 모든 값 반환(정규식)
  df['주소'].str.findall('\w+동').head()
  ```
  7. 문자 대체  .str.replace()
  ```python
  # 공백을 "_"로 대체
  df['주소'].str.replace(" ", "_").head()
  ```
  8. 원하는 문자 추출  .str.extract()
  ```python
  df['주소'].str.extract('( \w*시 )|( \w*군 )|( \w*구 )')

  df['주소'].str.extract('( \w*시 )|( \w*군 )|( \w*구 )').dropna(how='all')
  ```
  9. 문자열 패딩
  문자열의 길이가 고정되어 부족할 경우 채워준다
  ```python
  # 문자열 길이 20자, 왼쪽부터 "_"로 채우기
  df['주소'].str.pad(width=20, side='left', fillchar='_').head(10)

  # 문자열 길이 20자, 오른쪽부터 "_"로 채우기
  df['주소'].str.pad(width=20, side='right', fillchar='_').head(10)

  # 문자열 길이 20자, 좌우로 "_"로 채우기
  df['주소'].str.center(width=20, fillchar='_').head(10)

  # 왼쪽부터 0으로 채우기
  df['주소'].str.zfill(width=20).head(10)
  ```
  10. 공백제거 .str.strip()
  ```python
  df['주소'].str.strip()  # 앞 뒤 공백을 제거
  df['주소'].str.lstrip()  # 앞 공백을 제거
  df['주소'].str.rstrip()  # 뒤 공백을 제거
  ```
  11. 대소문자변경 
  ```python
  df['col1'].str.lower()      # 모두 소문자로 변경
  df['col1'].str.upper()      # 모두 대문자로 변경
  df['col1'].str.swapcase()   # 소문자는 대문자, 대문자는 소문자로 변경 
  ```
  

<br/>

- array transpose

  ```python
  np.array(a).T
  ```
  
  <br/>
---
#### category

- category는 문자(object)보다 더 많은 기능을 할 수 있다.  

- category는 문자 또는 숫자도가능하다.  

- category는 몇개로 분류할 수 있을 때 사용한다. ex)성멸(남,여)

  ```python
  # object를 category로 데이터 타입을 변경한다.
  data['sex'] = data['sex'].astype('category')
  ```

<br/>

---
#### 파일 읽고 쓰기

```python
%%writefile pdsample/gosu.txt
hello
안녕
```

'wb'는 write + binary의 줄임표현이다.  
쓰기모드로 파일을 불러오며, binary로 저장한다는 의미이다.

```python
a = open('pdsample/gosu2.txt','wb')
```

```python
# 'hello'의 타입은 str이므로 저장할 수 없다. 왜냐하면 binary로 설정이 되어 있기 때문이다.
a.write('hello')

a.write(b'hello')
```

- with
with 구문은 시작할 때 enter를, 종료할 때 __ exit를 자동으로 실행해준다. exit가 실행되었기 때문에 close()를 안해준다. with가 끝난 후 write()하면 'write to closed file'에러가 발생한다.

```python
with open('pdsample/gosu3.txt', 'wb') as c:
    c.write(b'aaa')
    c.write(b'bbb')
```

```python
with open('pdsample/gosu3.txt') as c:
    print(c.read())
```




















## Spark SQL JDBC Connector

##### 이 작업을 안하면 MySql 연동 시`java.lang.ClassNotFoundException: com.mysql.jdbc.Driver` 에러 발생

SparkSession은 파일 로딩 및  JDBC나 여러 Connector를 사용한 SQL서버와의 연결이 가능

즉, JDBC나 ODBC를 지원하는 모든 SQL서버는 Spark와 연결 가능



### JDBC Connector

Spark를 MySQL과 연결하기 위해서는 JDBC Connector를 다운받아야 함.

https://dev.mysql.com/downloads/connector/j/

`Platform Independent` 를 선택해 다운(최신버전으로 다운로드함), 작업 디렉토리에 넣어두고
```bash
tar -zxvf mysql-connector-java-8.0.26.tar.gz
```

로 압축해제



- AWS ubuntu인 경우

  다운받은 mysql-connector-java-8.0.26.jar 파일을 구글드라이브에 업로드하고 공유링크 생성

  https://drive.google.com/file/d/1e1awKvZZRR-wslqKlk1LA_BdTRzU-nIC/view?usp=sharing

  이 중 d/`_______`/view?  `______`부분이 사용할 필드이다

   1e1awKvZZRR-wslqKlk1LA_BdTRzU-nIC

  

  서버 터미널 접속 - ubuntu로 로그인

  wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=`________`' -O mysql-connector-java-8.0.26.jar

  ```bash
  $ cd /etc/spark/jars
  $ wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1e1awKvZZRR-wslqKlk1LA_BdTRzU-nIC' -O mysql-connector-java-8.0.26.jar
  ```

- 위 방식으로 jars폴더에 직접 connector.jar파일을 넣었음에도 spark-mysql연동이 안된다면

  ```python
  import os
  os.getwd() # 현재 작업위치 확인
  ```

  현재 작업위치에 폴더(폴더이름 jdbc) 생성, filezila 등으로 mysql-connector-java-8.0.26.jar 파일 업로드

  이후 SparkConf나 SparkSession 생성 시

  ```python
  conf = SparkConf.set("spark.driver.extraClassPath", "jdbc/mysql-connector-java-8.0.26.jar")
  
  spark = SparkSession.builder.config('spark.driver.extraClassPath', 'jdbc/mysql-connector-java-8.0.26.jar').config('spark.executor.extraClassPath', 'jdbc/mysql-connector-java-8.0.26.jar')
  ```

  로 spark.executor 경로 지정



### SparkContext

위의 Connector를 내장하고 있는 SparkContext 생성

`set`함수를 이용해 MySql Connector를 지정

```python
import pyspark import SparkConf, SparkContext

conf = SparkConf()\
        .setAppName("spark-sql")\
        .set("spark.driver.extraClassPath", "jdbc/mysql-connector-java-8.0.26.jar")
sc = pyspark.SparkContext(conf=conf)
```

다음 SQLContext를 생성, 그 안에 내장된 SparkSession 가져옴

```python
from pyspark.sql import SQLContext
sqlCtx = SQLContext(sc)
spark = sqlCtx.sparkSession
```



### 또는, 바로 SparkSession 생성 -> 채택

```python
import findspark
findspark.init()

import pyspark # only run after findspark.init()

from pyspark import SparkConf, SparkContext
from pyspark.sql import *
from pyspark.sql.functions import col, lit, get_json_object
from pyspark.sql.types import *

spark = SparkSession.builder.config('spark.driver.extraClassPath', 'jdbc/mysql-connector-java-8.0.26.jar').config('spark.executor.extraClassPath', 'jdbc/mysql-connector-java-8.0.26.jar').getOrCreate()
```



### SQL Connection

JDBC를 사용해 SQL을 연결해 주기 위한 준비

MySQL서버에서 `hoit` 이라는 사용자를 만든 뒤 비밀번호를 `141008` 로 설정해주고,

외부접속 허용, DB의 모든 권한 부여

```bash
mysql> create user 'hoit'@'%' identified by '141008';
mysql> grant all privileges on *.* to 'hoit'@'%' with grant option;
```

pymysql 이용 사용할 DB생성

```python
!pip install pymysql

import pymysql

# farmoney DB생성
conn = pymysql.connect(host='localhost', user='hoit', password='141008', charset='utf8')
cursor = conn.cursor()

sql = 'CREATE DATABASE farmoney'

cursor.execute(sql)

conn.commit()
conn.close()
```

DB접속정보 설정

```python
# DB 접속정보 설정
DB_URL = 'jdbc:mysql://localhost:3306/farmoney?useUnicode=true&characterEncoding=UTF-8'
DB_USER = 'hoit'
DB_PASS = '141008'
```

생성한 spark dataframe을 MySql과 연동해 DB에 weather 테이블로 저장

```python
### DB에 저장
df_weather\
    .write \
    .format('jdbc') \
    .mode('append') \
    .option('driver','com.mysql.cj.jdbc.Driver') \
    .option('url', DB_URL) \
    .option('dbtable', "weather") \
    .option('user', DB_USER) \
    .option('password', DB_PASS) \
    .save()
```

저장한 table 로드

```python
# db에서 로드

dataframe_mysql = spark.read.format("jdbc").options(
    url="jdbc:mysql://localhost:3306/farmoney",
    driver = "com.mysql.cj.jdbc.Driver",
    dbtable = "weather",
    user="hoit",
    password="141008").load()

dataframe_mysql.show()
```





#### 한글 입력 오류

ubuntu에 MySql설치 시 CHARSET의 기본값이 latin1으로 되어있어 발생하는 문제



ubuntu에서 MySql 접속 후 weather 테이블의 CHARSET 확인해보면 기본값이 latin1으로 되어 있다.

```bash
mysql> SHOW CREATE TABLE weather;
```

utf8으로 변경한다.

```bash
mysql> ALTER TABLE weather CONVERT TO CHARACTER SET utf8;
```

CHARSET=utf8으로 변경 확인

```bash
mysql> SHOW CREATE TABLE weather;
```



- 앞으로 farmoney DB에 생성되는 table들의 기본 CHARSET을 utf8로 변경

  DB 설정 변경

  ```bash
  mysql> alter database farmoney default character set utf8 collate utf8_general_ci;
  ```

  farmoney라는 db는 이제 CHARSET 기본값이 utf8으로 변경됨


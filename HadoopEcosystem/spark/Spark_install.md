## Window10(local)에 spark 설치 및 환경변수 설정



### 1. 필요 프로그램 설치

- 언어 : Java, Python(3.0 이상), Scala

  파이썬, 자바는 이미 설치된 상태

  [python](https://www.python.org/downloads/)

  [java](https://www.oracle.com/java/technologies/javase-downloads.html)

  Spark의 메인 언어인 scala 설치

  

- spark 설치 (spark-3.1.2-bin-hadoop3.2)

  [spark](https://spark.apache.org/downloads.html)

  

- Winutils 설치
  
  spark를 다운로드할 때 선택한 하둡 버전(3.2)에 맞춰 winutils.exe파일 다운로드
  
  [winutils](https://github.com/cdarlint/winutils)
  
  Hadoop/bin 폴더 생성 후, 다운로드한 파일 저장
  
  
  
  

### 2. 환경변수 설정

시스템 속성 - 고급 - 환경변수

시스템 변수 편집에서 경로 설정

- java

  변수 이름 : JAVA_HOME

  변수 값 : C:\Program Files\Java\jdk1.8.0_301\bin

  (공백으로 인한 오류 발생 시 : C:\Progra~1\Java\jdk1.8.0_301\bin)

- spark

  변수 이름 : SPARK_HOME

  변수 값 : C:\spark\spark-3.1.2-bin-hadoop3.2

- Hadoop

  변수 이름 : HADOOP_HOME

  변수 값 : C:\Hadoop

시스템 변수 중 Path 편집 - 새로 만들기

%SPARK_HOME%\bin

%HADOOP_HOME%\bin





### 3. 실행 확인

cmd나 PowerShell을 켜고

```powershell
pyspark
```

입력해 실행 확인

```powershell
spark
```

입력해 sparksession 확인


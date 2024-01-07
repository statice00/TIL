## 기본 문법 정리
</br>

### DB 다루기
> 윈도우 환경에서 MySQL은 데이터베이스 이름의 대소문자를 구분하지 않는다.  
유닉스 환경에서는 대소문자를 구분한다.  
**될 수 있으면 항상 데이터베이스의 이름은 대소문자를 구분해서 사용하는 것이 가독성 면에서 좋다.**
```sql
# 데이터베이스 보기
show databases;

# 만약 sqlDB가 존재하면 우선 지운다
drop database if exists sqlDB;

# 데이터베이스 생성
create database sqlDB;

# 데이터베이스 선택
use sqlDB;
```
</br>

### 테이블 생성
```sql
CREATE TABLE db명.테이블명 (
    컬럼명1 INT PRIMARY KEY AUTO_INCREMENT, # 기본키 숫자 자동 증가 설정
    컬럼명2 CHAR(15) NOT NULL,
    컬럼명3 INT,

    PRIMARY KEY(컬럼명1)
    FOREIGN KEY(컬럼명2) REFERENCES 테이블명(컬럼명)
    FOREIGN KEY(컬럼명3) REFERENCES 다른테이블명(컬럼명b)
)
```
```sql
# 테이블 이름을 띄어쓰기 하고 싶으면 ''안에 넣는다
create table 'my table'(id InT);
```

- 테이블 제약 조건  
    - NOT NULL : 해당 필드는 NULL 값을 저장할 수 없게 된다.
    - UNIQUE : 해당 필드는 서로 다른 값을 가져야 한다.
    - PRIMARY KEY : 해당 필드가 NOT NULL과 UNIQUE 제약 조건의 특징을 모두 가지게 된다. 테이블에서 유일한 값을 가지는 속성을 의미한다.
    - FOREIGN KEY : 하나의 테이블을 다른 테이블에 의존하게 만든다. 외부 테이블에서 참고하려는 주 키(primary key)를 의미한다. 
    **외부 키가 참조할 수 있는 값은 꼭 primary key가 아니라도, unique이면 가능하다.**
    - DEFAULT : 해당 필드의 기본값을 설정한다.
    - AUTO_INCREMENT : 해당 필드의 값을 1부터 시작해 새로운 레코드가 추가될 때마다 1씩 증가된 값을 저장한다. 
    - ON UPDATE CASCADE : primary key를 업데이트 했을 때, 이 primary key를 외부키로 가지는 테이블의 값들까지 같이 업데이트하도록 만든다. 
    - ON DELETE CASCADE : primary key에서 값 삭제 시(delete from TABLE where PRIMARY KEY = 삭제하려는 값) 이 primary key를 외부키로 가지는 테이블의 값들까지 같이 삭제한다.
    - ON DELETE SET NULL : primary key에서 값 삭제 시, 이 primary key를 외부키로 가지는 테이블의 값을 null로 바꿔준다.
```sql
create table userTBL
(
    userID char(8) primary key,
    name varchar(10) not null unique, # 만약 기본키 지정을 안했으면 not null, unique가 기본키가 된다
    birthYear int not null,
    addr char(2) not null,
    mobile char(3),
    mdate date
)
```
```sql
create table buyTBL
(
    num int auto_increment not null primary key, # 자동으로 숫자 순서대로 증가
    userID char(8) not null,
    price int not null default 80, # 값이 입력되지 않을 때 기본값 지정
    
    constraint 외래키이름 foreign key (userID) references userTBL(userID) on update cascade
    # 외래키 지정. constraint 사용하면 외래키 이름 지정, 안쓰면 필드값 자체가 이름이 된다.
    # 만일 부모키가 변경될 경우 외래키값도 같이 변경
)
```
</br>

### 테이블 조회
```sql
show tables

show table STATUS # 더 자세히
```
- Name : 테이블 이름
- Type : 테이블 타입
- Row_format : 행 저장 형태(Fixed, Dynamic, Compressed, Redundant, Compact)  
- Rows : 행의 수
- Avg_row_length : 평균 행 길이
- Data_length : 데이터 파일의 최대길이
- Index_length : 인덱스 파일의 길이
- Data_free : 사용되지 않는 bytes에 할당된 수 
- Auto_increment : 다음 자동증가 변수
- Create_time : 테이블이 생성된 시간
- Update_time : 데이터파일의 마지막 업데이트 시간
- Check_time : 테이블의 마지막 체크 시간
- Create_options : 테이블 생성시의 기타옵션
- Comment : 테이블 생성시의 명령어
</br>

### 테이블 구성도
```sql
show columns from 테이블명
describe 테이블명
desc 테이블명
```
</br>

### 테이블 데이터 조회
```sql
SELECT 컬럼명, 집계함수 as 별명
FROM 테이블명
WHERE 테이블 조건
GROUP BY 컬럼명
HAVING 그룹 조건
ORDER BY 컬럼명
```
순서  
1. FROM : SQL은 구문이 들어오면 테이블을 가장 먼저 확인한다. 테이블이 없는데 다른 것들을 먼저 조회하면 헛수고이기 때문이다.
2. WHERE : 테이블명을 확인한 후, 테이블에서 주어진 조건에 맞는 데이터들을 추출한다.(select문에 집계함수 유무에 관계없이 무조건 **where조건부터 맞추고 집계한다.**)
3. GROUP BY : 조건에 맞는 데이터가 추출되었으니, 공통적인 데이터들끼리 묶어 그룹을 만든다.
4. HAVING : 공통적인 데이터들이 묶여진 그룹 중, 주어진 조건에 맞는 그룹들은 추출한다.
5. SELECT : 최종적으로 추출된 데이터들을(또한 함수로 묶어 계산결과를) 조회한다.
6. ORDER BY : 추출된 데이터들을 정렬한다.
</br>

- 그룹핑 정리
    - 그룹핑은 뭔가 sum()이나 avg() 같은 묶음데이터들을 통계 낼 때 사용하는 편이다.
    - 분담하고 싶은 필드를 정하고 그룹핑 해주면, 각 필드들의 값들이 임시로 묶음 처리 된다. 다만 이 묶음 처리된 데이터를 테이블 구조로 표현할 수 없으니 빈칸으로 보여지게 되지만, 사실 안에는 여러 데이터들이 뭉쳐있다.
    - 그래서 이 데이터들을 이용해 sum()을 쓰면 값들을 더하고, avg()를 쓰면 평균을 구하게 되는 원리가 그룹핑 정의이다.
    - 다만 **그룹화 한 것들은 특별해서, 따로 조건을 줄 때에는 where가 아닌 having으로 써야 한다.**
        - where는 그룹핑 전 테이블을 제어
        - having은 그룹핑 후 테이블을 제어
</br>

### 테이블 구조 수정
- 필드 추가 add
```sql
ALTER TABLE 테이블명 ADD 필드명 필드타입 AFTER 기존필드명
# AFTER : 컬럼을 추가하는데 어느 필드 이후에 추가하는지 위치를 지정해 줄 수 있다.
```
- 필드 제거 drop
```sql
ALTER TABLE 테이블명 DROP 필드명
```
- 필드 수정 change
```sql
ALTER TABLE 테이블명 change 필드명 새필드명 새필드타입
```
- 필드 타입만 수정 modify
```sql
ALTER TABLE 테이블명 modify 필드명 새필드타입
```
- 키 추가 add ...key
```sql
ALTER TABLE 테이블명 add constraint 기본키명 primary key (필드값)

ALTER TABLE 테이블명 add foreign key(columnName) references 참조테이블(참조컬럼);
```
- 키 제거 drop ...key
```sql
ALTER TABLE 테이블명 drop foreign key 외래키명
```
- 테이블 이름 변경 rename
```sql
ALTER TABLE table_name1 RENAME table_name2;
```
</br>

### 테이블 데이터 수정 update
```sql
UPDATE 테이블이름
SET 필드이름1=데이터값1, 필드이름2=데이터값2, ...
WHERE 필드이름=데이터값;
# 조건문을 안쓰면 테이블 전체 레코드가 모두 바뀐다.
```
- ALTER : 테이블 구조 타입 추가 및 수정
- UPDATE : 테이블 데이터값만 수정
</br>

### 테이블 삽입
```sql
# 필드 몇개만 정해서 넣는 경우
INSERT INTO 테이블명(필드명1, 필드명2, 필드명3, ...)
VALUES (데이터값1, 데이터값2, 데이터값3,...)

# 필드 전체를 넣는 경우(필드명 생략 가능)
INSERT INTO 테이블명
VALUES (데이터값1, 데이터값2, 데이터값3,...)
```
- 추가하는 레코드가 반드시 모든 필드의 값을 가져야 할 필요는 없다. 빈 값은 자동으로 NULL로 채워진다.
</br>

### 테이블 삭제  
```sql
DROP TABLE 테이블명

DROP DATABASE IF EXISTS Hotel; # 에러 방지를 위해 if문 추가
DROP TABLE IF EXISTS Reservation;
```
</br>

### 테이블 데이터 삭제
- DELETE(휴지통)
    - 트랜잭션 로그를 기록해서 **속도가 느림**
    - 삭제한 데이터 **복구가능**
    - 테이블 자체 용량은 줄어들지 않음. 휴지통 개념
```sql
DELETE FROM 테이블명
WHERE 필드명 = 데이터값;
# 만약 WHERE 절을 생략하면, 해당 테이블에 저장된 모든 데이터가 삭제
```
- TRUNCATE(영구 삭제)
    - 테이블 구조는 남기고 데이터 값만 삭제
    - **복구 불가**
    - WHERE 절 사용 불가.(개별적 행 삭제 불가능)
    - 테이블 용량 초기화
```sql
TRUNCATE TABLE 테이블명;
```
</br>

### 레코드 정렬
- 오름차순(default) : ASC
- 내림차순 : DESC  

|구 분|오름차순(ASC)|내림차순(DESC)|
|---|---|---|
|숫자|작은 값부터 정렬(0,1,2,...)|큰 값부터 정렬(10,9,8,...)|
|문자|사전 순 정렬(a,b,c,...)|사전 역순 정렬(z,y,x,..._)|
|날짜|빠른 날짜 순(오래된 순)|늦은 날짜 순(최신 순)|
|NULL|마지막에 나옴|먼저 나옴|

```sql
# 기본 오름차순
SELECT [column_names] FROM [table_name] ORDER BY [column_name];

# 각각 컬럼을 따로따로 정렬 설정이 가능하다
SELECT [column_names] FROM [table_name] ORDER BY [column_name1] DESC, [column_name2] ASC; 
```
- 예제
동물 보호소에 들어온 모든 동물의 아이디와 이름, 보호 시작일을 이름 순으로 조회하는 SQL문을 작성하라. 단, 이름이 같은 동물 중에서는 보호를 나중에 시작한 동물을 먼저 보여줘야 한다.
```sql
# 먼저 name을 정렬하는데 동명이인이 있을 경우 datetime에 따라서 순서를 결정
SELECT animal_id, name, datetime
FROM animal_ins
ORDER BY name ASC, datetime DESC;
```
</br>

### 테이블 별칭 alias
```sql
SELECT col1 FROM employee AS E
# 테이블 별칭을 쿼리에 사용 가능. E.col1

SELECT col1 AS '성명', col2 AS '국어점수' FROM grade;
# 필드명을 한글로 별명 붙이기 가능
```
</br>

### 중복 비허용  
**DISTINCT**
- 해당 컬럼의 중복된 값을 합쳐서 보여줌
- 어떤 데이터들이 있는지 확인할 때 사용
```sql
SELECT DISTINCT 컬럼명 FROM 테이블명
```
- 예제
학교에 다니는 재학생 이름들의 수(동명이인을 하나로 친다.)
```sql
SELECT COUNT(DISTINCT name) FROM school_tbl
```
</br>

### Null값 검색
- null이 아니라 **is null** 이다.
```sql
SELECT name
FROM usertbl
WHERE mobile1 is null; 
```

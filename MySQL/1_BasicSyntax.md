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
    - PRIMARY KEY : 해당 필드가 NOT NULL과 UNIQUE 제약 조건의 특징을 모두 가지게 된다.
    - FOREIGN KEY : 하나의 테이블을 다른 테이블에 의존하게 만든다.
    - DEFAULT : 해당 필드의 기본값을 설정한다.
    - AUTO_INCREMENT : 해당 필드의 값을 1부터 시작해 새로운 레코드가 추가될 때마다 1씩 증가된 값을 저장한다. 
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
1. FROM : SQL은 구문이 들어오면 테이블을 가정 먼저 확인한다. 테이블이 없는데 다른 것들을 먼저 조회하면 헛수고이기 때문이다.
2. WHERE : 테이블명을 확인한 후, 테이블에서 주어진 조건에 맞는 데이터들을 추출한다.(select문에 집계함수 유무에 관계없이 무조건 **where조건부터 맞추고 집계한다.**)
3. GROUP BY : 조건에 맞는 데이터가 추출되었으니, 공통적인 데이터들끼리 묶어 그룹을 만든다.
4. HAVING : 공통적인 데이터들이 묶여진 그룹 중, 주어진 조건에 맞는 그룹들은 추출한다.
5. SELECT : 최종적으로 추출된 데이터들을(또한 함수로 묶어 계산결과를) 조회한다.
6. ORDER BY : 추출된 데이터들을 정렬한다.
</br>

- 그룹핑 정리


### 테이블 구조 수정
- 필드 추가 add
- 필드 제거 drop
- 필드 수정 change
- 필드 타입만 수정 modify
- 키 추가 add ...key
- 키 제거 drop ...key
- 테이블 이름 변경 rename

### 테이블 데이터 수정 update

### 테이블 삽입

### 테이블 삭제

### 테이블 데이터 삭제
- 휴지통 delete
- 영구 삭제 truncate

### 레코드 정렬

### 테이블 별칭 alias

### 중복 비허용

### Null값 검색


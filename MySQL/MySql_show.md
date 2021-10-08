## MySql 정보 조회

- 데이터베이스 목록(현재 계정이 접근 가능한 데이터베이스)

  ```mysql
  SHOW DATABASES;
  ```

- 현재 데이터베이스에 테이블 목록

  ```mysql
  USE [database_name]; /* 데이터베이스 선택 */
  
  SHOW TABLES;
  ```

- 특정 데이터베이스에 있는 테이블 목록

  ```mysql
  SHOW TABLES FROM [database_name];
  ```

- 특정 데이터베이스에서 조건이 맞는 테이블 목록

  ```mysql
  SHOW TABLES FROM [database_name] LIKE '키워드%';
  ```

- 특정 테이블에 인덱스 보기

  ```mysql
  SHOW INDEX FROM [table_name];
  ```

- 특정 테이블에 컬럼 보기

  ```mysql
  SHOW COLUMNS FROM [table_name];
  ```

- 현재 데이터베이스에 모든 테이블 정보 보기

  ```mysql
  SHOW TABLE STATUS;
  ```

- 특정 데이터베이스 모든 테이블 정보 보기

  ```mysql
  SHOW TABLE STATUS FROM [database_name];
  ```

  - #### SHOW TABLE STATUS로 가져온 정보

    - Name : 테이블 이름
    - Type : 테이블 타입
    - Row_format : 열 저장 형태 (Fixed, Dynamic, Compressed)
    - Rows : 열의 수
    - Avg_row_length : 열의 평균 길이
    - Data_length : 데이타파일의 길이
    - Max_data_length : 데이타파일의 최대길이
    - Index_length : 인덱스 파일의 길이
    - Data_free : 사용되지않는 bytes 에 할당된 수
    - Auto_increment : 다음 자동증가 변수
    - Create_time : 테이블이 생성된 시간
    - Update_time : 데이타파일의 마지막 UPDATE 시간
    - Check_time : 테이블의 마지막 체크시간
    - Create_options : 테이블 생성시의 기타옵션
    - Comment : 테이블 생성시의 명령어

  

  ### 서버 관련

 - 서버의 설정 사항 보기

   ```mysql
   SHOW VARIABLES;
   ```

- 서버의 특정 설정 사항 보기

  ```mysql
  SHOW VARIABLES LIKE  '키워드%';
  ```

- 서버 설정 사항 중 문자셋 관련 정보 보기

  ```mysql
  SHOW VARIABLES LIKE 'character%';
  ```

- 서버 상태 보기

  ```mysql
  SHOW STATUS;
  ```

  




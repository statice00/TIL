## pymysql 기본 명령어



- pymysql 설치

  ```bash
    $ pip install pymysql
    ```
    
    or

    ```python
    !pip install pymysql
    
    import pymysql
    ```
    
- database 생성

    기본 root계정에 farmoney 데이터베이스 생성

    ```python
    conn = pymysql.connect(host='localhost', user='root', password='password', charset='utf8') 
    cursor = conn.cursor() 
    
    sql = "CREATE DATABASE farmoney" 
    
    cursor.execute(sql) 
    
    conn.commit() 
    conn.close() 
    ```

    MySql에서 생성한 db 확인

    ```bash
    mysql> SHOW databases;
    ```

    

- table 생성

    conn에 table을 생성할 db를 지정

    ```python
    conn = pymysql.connect(host='localhost', user='root', password='password', db='farmoney', charset='utf8') 
    cursor = conn.cursor() 
    
    sql = '''CREATE TABLE user ( 
    id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    email varchar(255), 
    department varchar(255) 
    ) 
    ''' 
    
    cursor.execute(sql) 
    
    conn.commit() 
    conn.close() 
    ```

    MySql에서 생성한 table의 schema확인

    ```bash
    mysql> DESC user;
    ```

    

- 데이터 삽입

    ```python
    conn = pymysql.connect(host='localhost', user='root', password='password', db='farmoney', charset='utf8') 
    
    cursor = conn.cursor() 
    
    sql = "INSERT INTO user (email, department) VALUES (%s, %s)" 
    
    cursor.execute(sql,("developer_lim@limsee.com", "AI")) 
    cursor.execute(sql,("developer_kim@limsee.com", "AI")) 
    cursor.execute(sql,("developer_song@limsee.com", "AI")) 
    
    conn.commit() 
    
    conn.close() 
    ```

    MySql에서 삽입한 데이터 확인

    ```bash
    mysql> SELECT * FROM user;
    ```

    

- 데이터 검색

    특정 테이블에 있는 정보 확인.

    ex) AI부서에 있는 개발자 명단 조회.

    fetchall()  : 모든 정보 가져옴

    fetchone() : 하나의 데이터만 가져옴

    ```python
    conn = pymysql.connect(host='localhost', user='root', password='password', db='farmoney', charset='utf8') 
    
    cursor = conn.cursor() 
    
    sql = "SELECT * FROM user where department = %s" 
    
    cursor.execute(sql, ("AI")) 
    res = cursor.fetchall() 
    
    for data in res: 
            print(data) 
    
    conn.commit() 
    conn.close() 
    ```

    

- 데이터 수정

  ex) developer_song을 Testing부서로 옮김

  ```python
  conn = pymysql.connect(host='localhost', user='root', password='password', db='farmoney', charset='utf8') 
  
  cursor = conn.cursor() 
  
  sql = "UPDATE user SET department = %s WHERE email = %s" 
  cursor.execute(sql, ("Testing", "developer_song@limsee.com")) 
  
  conn.commit() 
  conn.close() 
  ```

  

- 데이터 삭제

  ex) developer_song을 user 테이블에서 삭제

  ```python
  conn = pymysql.connect(host='localhost', user='root', password='password', db='farmoney', charset='utf8') 
  
  cursor = conn.cursor() 
  
  sql = "DELETE FROM user WHERE email = %s" 
  cursor.execute(sql, ("developer_song@limsee.com")) 
  conn.commit() 
  
  conn.close() 
  ```

  

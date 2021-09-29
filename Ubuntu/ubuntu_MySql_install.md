### ubuntu에 MySQL 설치 및 계정 설정



- 설치

  apt-get 관리자 권한으로 실행
  
  ```bash
  $ sudo apt-get update
  $ sudo apt-get install mysql-server
  ```
  
- 외부접속 허용

  vi모드
  
  /bind-address 로 bind-address 위치 찾고
  
  i 로 삽입모드 -> bind-address값 0.0.0.0 으로 수정
  
  ```bash
  $ cd /etc/mysql/mysql.conf.d
  $ sudo vi mysqld.cnf
  ```
  
  0.0.0.0으로 수정하면 모든 접근을 허용하는것이다. 다른 특정 ip값으로도 지정가능하다.

- 사용자 계정 설정

  ```bash
  $ mysql -u root -p
  ```

  만약 root계정 비밀번호 까먹어서

  ERROR 1698 (28000): Access denied for user 'root'@'localhost'

  오류가 뜬다면

    ```bash
    $ sudo mysql -u root # sudo를 사용하여 root계정으로 mysql 접속
    # password는 관리자계정 pasword
    ```
  
  로 mysql 접속 후
  
  **유저 생성**
  
  ```bash
  mysql> create user '유저이름'@'%' identified by '비밀번호';
  mysql> grant all privileges on *.* to '유저이름'@'%' with grant option;
  ```
  
  유저이름 뒤에 `%`는 모든 호스트를 허용한다는 뜻이며, 이를 통해 외부 접속을 허용할 유저를 생성하게 된다.
  
  로컬 호스트만 허용할 경우는 대신에 `localhost`를 입력한다
  
  
  
  이후 생성한 유저와 비밀번호로 접속
  
  ```bash
  $ mysql -u 유저이름 -p
  ```
  



MySql Workbench 등에서 생성한 유저로 접속 시 안될 경우 MySql을 재시작한 다음에 접속을 시도해보자.


MySQL error code 1054

- unknown column 'id in field list

  오류가 뜨는 이유는

  1. 데이터를 입력할 때 문자형 데이터를 ''로 묶지 않고 넣는 경우
  2. 테이블에 id column이 없는 경우

  

- 해결

  ```mysql
  alter table weather add id int PRIMARY KEY auto_increment first; 
  ```

  id 컬럼은 key로 정의되어야 하기 때문에 키 조건 추가하고, 자동으로 숫자가 증가하게 한다. first는 테이블의 맨앞에 열을 추가한다는 뜻이다.




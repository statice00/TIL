/* table 생성 */
create table dept(
 num int(3),
 dname varchar(50),
 dloc varchar(30)
);

/* data 추가 */
INSERT INTO dept(num, dname, dloc)
VALUES(10, '재무부', '서울');

INSERT INTO dept(num, dname, dloc)
VALUES(20, '인사부', '인천');

INSERT INTO dept(num, dname, dloc)
VALUES(20, NULL, NULL);

INSERT INTO dept(num, dloc) /* 지정 안하면 NULL로 채워짐 */
VALUES(40, '부산');


/* 수정 */
UPDATE dept
SET dname = 'management', dloc = 'gangneung'
WHERE num = 40;



/* create database 
   명령을 이용해서 스키마 만들기 */
SHOW DATABASES;

CREATE DATABASE shop;

use shop;

CREATE TABLE person(
id int(10) primary key,
name varchar(3),
age int(3));
/* 한글을 못읽는 등의 ERROR나면 스키마 인코딩 값 바꿔야 함   */
/*
SELECT schema_name , default)character_set_name
FROM information_schema.schemata ;
코딩으로 인코딩 하는법
ALTER DATABASE shop DEFAULT CHARACTER SET utf8
ALTER SCHEMA shop DEFAULT COLLATE utf8mb4)general_ci ;

ALTER TABLE shop.person
CHARACTER SET = ut8 ;
*/

INSERT INTO person(id, name, age)
VALUES(10, '홍길동', 40);

INSERT INTO person(id, name, age)
VALUES(20, '유대위', 35);

INSERT INTO person(id, name, age)
VALUES(30, '고수', 30);

UPDATE person
SET age = 30
WHERE id = 20;





/*여기서부터 파이썬 주피터노트북 연계*/
/* 파이썬에서 수정 후 commit하면 insert한 table이 수정됨 */
SELECT * FROM person;



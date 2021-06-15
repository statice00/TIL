/*database 변경*/
use classicmodels;

/* = SELECT 1+2 FROM dual;*/
SELECT 1+2;

/*SELECT 호출할 컬럼 FROM db.table*/
SELECT customernumber 
FROM classicmodels.customers;

/* SELECT 집계함수(count, sum, avg..) FROM 테이블 */
SELECT sum(amount), count(checknumber)
FROM classicmodels.payments;

/* 테이블의 모든 칼럼 출력
   SELECT * FROM table */
   
/* 칼럼 명을 변경해서 조회 */
SELECT count(productcode) AS n_products
FROM classicmodels.products;

/* 중복을 제외하고 조회 */
SELECT DISTINCT ordernumber
FROM classicmodels.orderdetails;

/* 조건에 해당하는 데이터만 출력 */
SELECT *
FROM classicmodels.orderdetails
WHERE priceEach BETWEEN 30 AND 50;

SELECT *
FROM classicmodels.orderdetails
WHERE priceEach >= 30;

/* 특정 값을 포함하는 데이터만 출력 */
SELECT customernumber
FROM classicmodels.customers
WHERE country IN ('USA', 'Canada');

/* 특정 값을 포함하지 않는 데이터만 출력 */
SELECT customernumber
FROM classicmodels.customers
WHERE country NOT IN ('USA','Canada');

/* NULL : DATABASE에서 결측치
   값이 비어있다는 뜻이다. 0이 아니다.
특정 칼럼의 값이 비어 있는(NULL) 데이터만 출력*/
SELECT employeenumber
FROM classicmodels.employees
WHERE reportsTo IS NULL;

/* 특정 칼럼의 값이 NULL이 아닌 것만 출력 */
SELECT employeenumber
FROM classicmodels.employees
WHERE reportsTo IS NOT NULL;

/*  % : 모든 문자 여러개
    _ : 문자 하나 
특정 문자를 포함하는 데이터 조회 */
SELECT addressline1
FROM classicmodels.customers
WHERE addressline1 LIKE '%ST%'; /* ST가 포함된 addressline1 출력 */

SELECT addressline1
FROM classicmodels.customers
WHERE addressline1 LIKE '%ST_'; /* ST 뒤에 문자 하나만 있는 addressline1 출력 */

/* 칼럼의 값들을 그룹화해 그룹별로 구하고 싶은값 출력 */
SELECT country, city, count(customernumber) AS n_customers
FROM classicmodels.customers
GROUP BY country, city;

/* LEFT JOIN : 왼쪽 테이블을 기준으로 오른쪽 테이블을 결합  (left_table <- right_table)
   SELECT * FROM left_table
   LEFT JOIN right_table
   ON left_table.column1 = right_table.column2;
*/
/* ERD 생성 : Database - Reverse Engineer 클릭
  테이블들의 관계 확인하기 
  Foreign key : 빨간색
*/
SELECT a.ordernumber, b.country
FROM classicmodels.orders AS a
LEFT JOIN classicmodels.customers AS b
ON a.customernumber = b.customernumber
WHERE b.country = 'France';

/* INNER JOIN : 두 테이블에 공통으로 존재하는 정보만 출력 */
SELECT a.customernumber, b.country
FROM classicmodels.orders AS a
INNER JOIN classicmodels.customers AS b
ON a.customernumber = b.customernumber
WHERE b.country = 'USA';

/* FULL JOIN : 두 테이블의 합집합을 모두 출력 
MySQL에서는 FULL JOIN 지원 안함
LEFT JOIN 과 RIGHT JOIN을 UNION해서 사용가능
*/
SELECT * FROM classicmodels.orderdetails AS a 
LEFT JOIN classicmodels.orders AS b ON a.ordernumber = b.ordernumber
UNION
SELECT * FROM classicmodels.orderdetails AS a
RIGHT JOIN classicmodels.orders AS b ON a.ordernumber = b.ordernumber;

/* 조건에 따른 값을 다르게 출력 */
SELECT sum(CASE WHEN country = 'USA' THEN 1 ELSE 0 END) AS N_USA,
	   sum(CASE WHEN country = 'USA' THEN 1 ELSE 0 END)/count(*) AS USA_PORTION
FROM classicmodels.customers;

SELECT CASE WHEN country IN ('USA', 'Canada') then 'NORTH AMERICA' ELSE 'OTHERS' END AS region,
       count(customernumber) AS n_customers
FROM classicmodels.customers
GROUP BY 1;  /* SELECT의 첫번째 칼럼으로 그룹핑 */

/* 데이터 순위 매기는 함수
   동점처리방식에 따라 구분 
*/
SELECT buyprice, row_number() over(ORDER BY buyprice) AS rownumber,  /* 동정인 경우 서로 다른 등수로 계산 */
                 rank() over(ORDER BY buyprice) AS rnk,              /* 동점인 경우 같은 등수로 계산, 중복등수 반영해서 다음등수 정함 */
                 dense_rank() over(ORDER BY buyprice) AS denserank   /* 동점인 경우 같은 등수로 계산, 동점의 등수 바로 다음 수로 순위 매김 */
FROM classicmodels.products;

/* SUBQUERY */
SELECT ordernumber
FROM classicmodels.orders
WHERE customernumber in (SELECT customernumber 
    FROM classicmodels.customers 
    WHERE city = 'NYC');
    
SELECT customernumber
FROM (SELECT customernumber
    FROM classicmodels.customers
    WHERE city = 'NYC') A; /* A라는 테이블명칭으로 쿼리 내부에서 사용 */
    
SELECT ordernumber
FROM classicmodels.orders
WHERE customernumber in (SELECT customernumber
    FROM classicmodels.customers
    WHERE country = 'USA');
    


/* default : 오름차순 ASC
   내림차순 : DESC       
*/
SELECT buyprice 
FROM classicmodels.products
ORDER BY buyprice DESC;

/* 대소문자 구분해서 검색
WHERE addressLine1 LIKE BINARY '%ST%';
*/















## 중첩 CASE WHEN 문  

동일한 열에서만 조건을 주고 값을 바꾸는 것이 아닌, 다른 열의 조건에 따라 값을 바꾸는 등에 사용  

```sql
SELECT employee_id
    , first_name
    , department_id
    , salary
    , CASE department_id
        WHEN 1 THEN
                CASE WHEN salary >= 4000 THEN '1등급'
                    WHEN salary >= 3000 THEN '2등급'
                    WHEN salary >= 2000 THEN '3등급'
                END
        WHEN 3 THEN
                CASE WHEN salary >= 4000 THEN '1등급'
                    WHEN salary >= 3000 THEN '2등급'
                    WHEN salary >= 2000 THEN '3등급'
                END
    END AS [salary_grade] 
FROM employees
WHERE department_id IN (1, 3)
```
</br>

```sql
SELECT
title,
CASE
    WHEN rental_rate < 1 THEN
        CASE
            WHEN rental_duration <= 3 THEN 'Low rate (3 days or less)'
            ELSE 'Low rate (more than 3 days)'
        END
    WHEN rental_rate < 3 THEN 'Moderate rate'
    ELSE 'High rate'
END AS rental_category
FROM film
```
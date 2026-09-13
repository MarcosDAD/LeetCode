# Write your MySQL query statement below
SELECT DISTINCT
    tt1.NAME
FROM SALESPERSON tt1
LEFT JOIN (
    SELECT
        t3.sales_id, count(t2.name) as company_count
    FROM ORDERS t1
    LEFT JOIN COMPANY T2
        on t1.com_id = t2.com_id
    LEFT JOIN SALESPERSON T3
        on t1.sales_id = t3.sales_id
    WHERE t2.name = 'RED'
    GROUP BY t3.name, t2.name
) tt2 on tt1.sales_id = tt2.sales_id
WHERE tt2.sales_id is null

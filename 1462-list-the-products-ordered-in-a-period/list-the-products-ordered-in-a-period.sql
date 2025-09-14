# Write your MySQL query statement below

SELECT
    p.product_name,
    SUM(o.unit) AS unit
FROM Products p
LEFT JOIN Orders o ON o.product_id = p.product_id
WHERE EXTRACT(YEAR_MONTH FROM o.order_date) = '202002'
GROUP BY o.product_id
HAVING unit >= 100;
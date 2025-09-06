# Write your MySQL query statement below

SELECT 
    v.customer_id,
    COUNT(v.customer_id) AS count_no_trans
FROM Visits v
WHERE v.visit_id NOT IN (
    SELECT t.visit_id
    FROM Transactions t
)
GROUP BY v.customer_id;
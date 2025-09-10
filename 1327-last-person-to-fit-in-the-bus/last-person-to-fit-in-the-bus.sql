# Write your MySQL query statement below

WITH CTE AS (SELECT 
    person_name,
    SUM(weight) OVER (ORDER BY turn) AS cumm_sum,
    turn
FROM Queue
)

SELECT 
    person_name
FROM CTE
WHERE cumm_sum <= 1000
ORDER BY turn DESC
LIMIT 1;
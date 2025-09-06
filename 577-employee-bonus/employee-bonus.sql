# Write your MySQL query statement below

SELECT
    e.name,
    CASE WHEN e.empId NOT IN (
            SELECT empId
            FROM Bonus
        ) THEN NULL 
        ELSE b.bonus
    END AS bonus
FROM Employee e
LEFT JOIN Bonus b ON b.empId = e.empId
WHERE bonus < 1000 
    OR bonus IS NULL;
# Write your MySQL query statement below

SELECT 
    e1.employee_id,
    e1.name,
    COUNT(e2.employee_id) AS reports_count,
    ROUND(AVG(e2.age), 0) AS average_age
FROM Employees e1
CROSS JOIN Employees e2 ON e2.reports_to = e1.employee_id
GROUP BY e1.employee_id
ORDER BY e1.employee_id;
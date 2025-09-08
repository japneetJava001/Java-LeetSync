# Write your MySQL query statement below

SELECT 
    su.user_id,
    ROUND(AVG(IF(c.action = 'confirmed', 1, 0)), 2) AS confirmation_rate
FROM Signups su
LEFT JOIN Confirmations c ON su.user_id = c.user_id
GROUP BY user_id;
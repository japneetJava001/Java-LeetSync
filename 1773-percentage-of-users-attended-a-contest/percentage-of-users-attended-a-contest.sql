# Write your MySQL query statement below

WITH user_ids AS (
    SELECT 
        COUNT(DISTINCT user_id) AS total_user_ids,
        user_id
    FROM users
),
group_contest AS (
    SELECT 
        COUNT(user_id) AS total_user_id_contest,
        user_id,
        contest_id
    FROM Register
    GROUP BY contest_id
)
SELECT
    contest_id,
    ROUND((total_user_id_contest / total_user_ids) * 100, 2) AS percentage
FROM group_contest gc
CROSS JOIN user_ids ui
ORDER BY percentage DESC, contest_id ASC



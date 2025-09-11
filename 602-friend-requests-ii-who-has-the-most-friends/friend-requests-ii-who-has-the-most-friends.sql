# Write your MySQL query statement below

WITH requested_CTE AS (
    SELECT
        requester_id AS id,
        COUNT(accepter_id) AS requested_friends
    FROM RequestAccepted
    GROUP BY requester_id
),
accepted_CTE AS (
    SELECT
        accepter_id AS id,
        COUNT(requester_id) AS accepted_friends
    FROM RequestAccepted
    GROUP BY accepter_id
),
all_friends AS (
    SELECT
        COALESCE(r.id, a.id) AS id,
        COALESCE(requested_friends, 0) + COALESCE(accepted_friends, 0) AS num
    FROM requested_CTE r
    LEFT JOIN accepted_CTE a ON r.id = a.id

    UNION

    SELECT
        COALESCE(r.id, a.id) AS id,
        COALESCE(requested_friends, 0) + COALESCE(accepted_friends, 0) AS num
    FROM accepted_CTE a
    LEFT JOIN requested_CTE r ON r.id = a.id
)

SELECT
    id,
    num
FROM all_friends
ORDER BY num DESC
LIMIT 1;
# Write your MySQL query statement below

SELECT results FROM (
    SELECT
        u.name AS results
    FROM MovieRating mr
    JOIN Users u ON u.user_id = mr.user_id
    GROUP BY mr.user_id
    ORDER BY COUNT(mr.user_id) DESC, u.name ASC
    LIMIT 1
) AS MostActiveUser

UNION ALL

SELECT results FROM (
    SELECT
        m.title AS results
    FROM MovieRating mr
    JOIN Movies m ON m.movie_id = mr.movie_id
    WHERE EXTRACT(YEAR_MONTH FROM created_at) = 202002
    GROUP BY mr.movie_id
    ORDER BY AVG(mr.rating) DESC, m.title ASC
    LIMIT 1
) AS HighestRatedMovie;
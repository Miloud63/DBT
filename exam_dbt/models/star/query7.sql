{{ config(
    materialized='view',
    tags=['star_query']
) }}

SELECT 
g.name as Genres,
COUNT(*) AS num_genres
FROM {{ref("TrackFact")}} tf
JOIN {{ref("dim_genre")}} g ON tf.GenreId=g.GenreId
GROUP BY Genres
ORDER BY num_genres DESC
LIMIT 1

{{ config(
    materialized='view',
    tags=['star_query']
) }}

SELECT 
g.name AS Genres,
avg(longueur) AS Longueur_Moyenne
FROM (SELECT name,genreid,len(name) as longueur FROM {{ref("TrackFact")}}) tf
JOIN {{ref("dim_genre")}} g ON tf.GenreId=g.GenreId
GROUP BY Genres

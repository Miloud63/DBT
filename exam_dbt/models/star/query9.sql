{{ config(
    materialized='view',
    tags=['star_query']
) }}

SELECT 
tf.name AS Morceaux
FROM {{ref("TrackFact")}} tf
JOIN {{ref("dim_genre")}} g ON tf.GenreId=g.GenreId
JOIN {{ref("dim_artist")}} a ON tf.artistid=a.artistid
WHERE country='France' AND g.Name='Rock'

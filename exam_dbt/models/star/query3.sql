{{ config(
    materialized='view',
    tags=['star_query']
) }}

SELECT DISTINCT tf.name, tf.artistid, composer
FROM {{ref("TrackFact")}} tf
JOIN {{ref("dim_genre")}} g
WHERE g.name = 'Rock' OR g.name = 'Jazz'

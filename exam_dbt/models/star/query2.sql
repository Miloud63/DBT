{{ config(
    materialized='view',
    tags=['star_query']
) }}

SELECT tf.name
FROM {{ref("TrackFact")}} tf
JOIN {{ref("dim_album")}} a ON tf.AlbumId = a.AlbumId
WHERE a.prod_year = 2000 OR a.prod_year = 2002


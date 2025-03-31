{{ config(
    materialized='view',
    tags=['star_query']
) }}

SELECT DISTINCT
p.Name AS Playlists,
FROM {{ref("TrackFact")}} tf
JOIN {{ref("dim_playlist")}} p ON tf.PlaylistId=p.PlaylistId
WHERE (milliseconds/60000)>=4

{{ config(
    materialized='view',
    tags=['star_query']
) }}

SELECT DISTINCT
p.Name AS Playlists,
FROM {{ref("TrackFact")}} tf
JOIN {{ref("dim_playlist")}} p ON tf.PlaylistId=p.PlaylistId
JOIN {{ref("dim_artist")}} a ON tf.artistid=a.artistid
WHERE birthyear<1990

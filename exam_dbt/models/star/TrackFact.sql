{{ config(
    materialized='table',
    tags=['star_creation']
) }}

SELECT
    t.TrackId,
    t.Name,
    t.Composer,
    t.Milliseconds,
    t.Bytes,
    t.UnitPrice,
    t.MediaTypeId,
    t.GenreId,
    t.AlbumId,
    a1.ArtistId,
    p.PlayListId
FROM {{ source('EXAM', 'TRACK') }} t
JOIN {{ source('EXAM', 'ALBUM') }} a2 ON t.AlbumId = a2.AlbumId
JOIN {{ source('EXAM', 'ARTIST') }} a1 ON a2.ArtistId = a1.ArtistId
LEFT JOIN {{ source('EXAM', 'PLAYLISTTRACK') }} pt ON t.TrackId = pt.TrackId
LEFT JOIN {{ source('EXAM', 'PLAYLIST') }} p ON pt.PlayListId = p.PlayListId

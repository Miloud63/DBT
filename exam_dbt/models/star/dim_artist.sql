{{ config(
    materialized='table',
    tags=['star_creation']
) }}

SELECT
    ArtistId,
    name,
    Birthyear,
    country
FROM {{ source('EXAM', 'ARTIST') }}

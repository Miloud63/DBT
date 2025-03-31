{{ config(
    materialized='table',
    tags=['star_creation']
) }}

SELECT
    PlaylistId,
    Name
FROM {{ source('EXAM', 'PLAYLIST') }}

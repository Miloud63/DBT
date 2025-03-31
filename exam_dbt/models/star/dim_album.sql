{{ config(
    materialized='table',
    tags=['star_creation']
) }}

SELECT
    AlbumId,
    Title,
    Prod_year,
    Cd_year
FROM {{ source('EXAM', 'ALBUM') }}


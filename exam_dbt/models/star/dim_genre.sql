{{ config(
    materialized='table',
    tags=['star_creation']
) }}

SELECT
    GenreId,
    Name
FROM {{ source('EXAM', 'GENRE') }}


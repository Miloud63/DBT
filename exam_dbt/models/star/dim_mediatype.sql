{{ config(
    materialized='table',
    tags=['star_creation']
) }}

SELECT
    MediaTypeId,
    Name
FROM {{ source('EXAM', 'MEDIATYPE') }}


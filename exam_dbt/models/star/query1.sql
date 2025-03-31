{{ config(
    materialized='view',
    tags=['star_query']
) }}

SELECT
    title,
FROM {{ ref('dim_album') }}
WHERE cd_year>1

{{ config(
    materialized='view',
    tags=['star_query']
) }}

SELECT title 
FROM {{ref("dim_album")}}
ORDER BY len(title) DESC limit 10

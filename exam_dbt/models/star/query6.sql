{{ config(
    materialized='view',
    tags=['star_query']
) }}

SELECT artistId,  
       COUNT(*) AS num_music
FROM {{ref("TrackFact")}}
GROUP BY artistid
ORDER BY num_music DESC

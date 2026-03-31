
{{
   
   config (
    materialized = 'incremental',
    unique_keys = 'event_id',
    on_schema_change = 'sync_all_columns'
    )
}}

WITH source AS (
   
    SELECT 
        id, 
        user_id,
        city,
        created_at
    FROM {{ source('thelook_ecommerce', 'events') }}
    ORDER BY created_at LIMIT 7 

)

SELECT * FROM source 

{% if is_incremental() %}

WHERE created_at > (SELECT MAX(created_at) FROM {{ this }})

{% endif %}

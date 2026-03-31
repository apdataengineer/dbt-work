
{{
   
   config (
    materialized = 'incremental',
    unique_key = 'id',
    on_schema_change = 'sync_all_columns',
    incremental_strategy = 'merge'
    )
}}


WITH source AS (
   
    SELECT 
        id, 
        user_id,
        city,
        created_at
    FROM {{ ref('stg_ecommerce__test_increment') }}
    

)

SELECT * FROM source 

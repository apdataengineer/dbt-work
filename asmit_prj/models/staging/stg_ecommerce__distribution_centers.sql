WITH source AS (
    SELECT *  
    FROM {{ source('dbt_test', 'distribution_centers') }}
)

SELECT * FROM source
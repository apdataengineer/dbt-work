{% snapshot snapshot__distribution_centers %}

{{
    config(
      target_schema='dbt_test_new',
      unique_key='id',
      strategy='check',
      check_cols=['name', 'latitude', 'longitude']
    )
}}

SELECT * FROM {{ source('dbt_test', 'distribution_centers') }}

{% endsnapshot %}
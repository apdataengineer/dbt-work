{{ config(materialized="table") }}

with base_table as (select * from {{ source("bigquery_mydataset", "demo") }})

select *
from base_table
where gender = 'F'

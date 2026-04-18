{% macro say_hello(name) %}
  {{ log("Hello " ~ name, info=True) }}
{% endmacro %}


{% macro generate_say_hello(name) %}
  'Hello {{ name }}'
{% endmacro %}



{% macro log_my_list() %}

{% set my_list = ['a','b','c'] %}

SELECT  
{%- for item in my_list %}
  {{ log(item, info =True) }}
{%- endfor %}

{% endmacro %}

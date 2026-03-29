{% test check_primary_key(model, column_name) %}

WITH validation AS (

    SELECT 
        {{ column_name}} AS primary_key, 
        COUNT(1) AS occurrences
    FROM 
        {{ model }}
    GROUP BY 1 
) 

SELECT 
    * 
FROM validation 
WHERE primary_key IS NOT NULL OR occurrences > 1 

{% endtest %}

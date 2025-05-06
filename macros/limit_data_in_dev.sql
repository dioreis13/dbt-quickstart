{%- macro limit_data_in_dev(date_column, days_to_filter) -%}
{%- if target.name == 'default' -%}
--where {{ date_column }} >= dateadd('day', - {{ days_to_filter }}, current_timestamp) -- snowflake version
WHERE {{ date_column }} >= CAST(TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL {{ days_to_filter }} DAY) AS DATE) --bigquery version
{%- endif -%}
{%- endmacro %}
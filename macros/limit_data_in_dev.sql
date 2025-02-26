{%- macro limit_data_in_dev(date_column, days_to_filter) -%}
{%- if target.name == 'default' -%}
where {{ date_column }} >= dateadd('day', - {{ days_to_filter }}, current_timestamp)
{%- endif -%}
{%- endmacro %}
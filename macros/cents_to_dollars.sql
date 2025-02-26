```jinja

{% macro cents_to_dollars(colunm_name, decimal_places=2) -%}
round( 1.0 * {{ colunm_name }} / 100.0, {{ decimal_places }})
{%- endmacro %}

```
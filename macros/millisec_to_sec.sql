{%- macro millisec_to_sec(column_name) -%}
    ({{ column_name }}::int / 1000)::timestamp
{%- endmacro -%}


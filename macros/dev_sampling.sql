{%- macro dev_sampling(percent_sample=30) -%}
    {%- if target.schema == 'dev' -%}
        tablesample system ({{ percent_sample }} percent)
    {%- endif -%}
{%- endmacro -%}
{{
    config(
        unique_key='unique_id',
        incremental_strategy='merge', 
        partition_by={
            "field":"session_started_at",
            "data_type": "timestamp",
            "granularity": "day"            
        }

    )
}}

{% set date_grains = ['day','week','month'] %}

select
    unique_id,
    full_visitor_id,
    session_started_at,
    visit_number,
    channel_grouping,
    totals.bounces is not null as is_bounced,
    {% for date_grain in date_grains -%}
        date_trunc(session_started_at, {{ date_grain }}) as session_started_{{ date_grain }}{{ ',' if not loop.last }}
    {%- endfor %}

from {{ ref('base_ga__sessions') }}
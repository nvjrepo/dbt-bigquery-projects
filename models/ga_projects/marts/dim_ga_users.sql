with sessions as (
    select * from {{ ref('base_ga__sessions') }}
)

select
    full_visitor_id as customer_id,
    min(visit_started_at) as first_visit_at,
    max(visit_started_at) as last_visit_at,
    sum(visit_number) as total_visits
from sessions
{{ dbt_utils.group_by(1) }}
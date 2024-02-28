select
    unique_id,
    full_visitor_id,
    session_started_at,
    visit_number,
    channel_grouping,
    totals.bounce is not null then is_bounce,

from {{ ref('base_ga__sessions') }}
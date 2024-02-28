{{
    config(
        unique_key='unique_id',
        incremental_strategy='merge', 
        partition_by={
            "field":"visit_date",
            "data_type": "date",
            "granularity": "day"            
        }

    )
}}

select
    {{ dbt_utils.generate_surrogate_key(['fullvisitorid','visitstarttime']) }} as unique_id,
    fullvisitorid as fullvisitor_id,
    visitorid as visitor_id,
    visitid as visit_id,
    userid as user_id,
    clientid as client_id,
    
    parse_date('%Y%m%d',`date`) as visit_date,
    timestamp_seconds(visitstarttime) as visit_started_at,
    
    visitnumber as visit_number,
    totals,
    trafficsource as traffic_source,
    device,
    geonetwork as geo_network,
    hits,
    customdimensions as custom_dimensions,
    channelgrouping as channel_grouping,
    socialengagementtype as social_engagement_type,

from {{ source('ga','ga_sessions_*') }} {{ dev_sampling(percent_sample=30) }}
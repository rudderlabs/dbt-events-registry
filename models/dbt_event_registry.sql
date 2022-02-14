{{ config(materialized='table') }}

select
    event,
    cast(min(received_at) as timestamp) as first_triggered,
    cast(max(received_at) as timestamp) as last_triggered,
    count(*) as event_count,
    count(distinct(anonymous_id)) as event_user_count,
    event_count/(datediff(day,first_triggered,CURRENT_TIMESTAMP)) as event_daily_average,
    CURRENT_TIMESTAMP as record_created_at
from
    {{ source("schema","tracks")}}
group by
    event

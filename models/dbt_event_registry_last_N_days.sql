{{ config(materialized='table') }}

select
    event,
    count(*) as event_count,
    count(distinct(anonymous_id)) as event_user_count,
    21 as window_width, /* vary 21 as required */
    event_count/window_width as event_daily_average,
    CURRENT_TIMESTAMP as record_created_at
from
    {{ source("schema","tracks")}}
where
    datediff(day,cast(received_at as timestamp),CURRENT_TIMESTAMP) > window_width
group by
    event

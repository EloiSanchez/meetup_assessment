with raw_events as (select * from {{ source("meetup_data", "events") }})

select
    md5(data:group_id::varchar || data:name::varchar || data:time::varchar) as event_id,
    *
from raw_events


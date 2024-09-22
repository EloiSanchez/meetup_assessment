with raw_events as (select * from {{ source("meetup_data", "events") }})

select
    md5(
        data:group_id::varchar
        || data:name::varchar
        || coalesce(data:time::varchar, 'null')
        || data:created::varchar
    ) as event_id,
    *
from raw_events


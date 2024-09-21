with raw_events as (select * from {{ source("meetup_data", "events") }})

select *
from raw_events


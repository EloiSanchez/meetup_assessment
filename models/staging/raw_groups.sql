with raw_groups as (select * from {{ source("meetup_data", "groups") }})

select *
from raw_groups


with raw_venues as (select * from {{ source("meetup_data", "venues") }})

select *
from raw_venues


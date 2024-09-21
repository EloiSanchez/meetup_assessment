with raw_users as (select * from {{ source("meetup_data", "users") }})

select *
from raw_users


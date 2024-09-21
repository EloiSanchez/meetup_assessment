with
    raw_users as (select * from {{ ref("raw_users") }}),

    parsed_users as (
        select
            -- ids
            data:user_id::varchar as user_id,

            -- strings
            data:city::varchar as city,
            data:country::varchar as country,
            data:hometown::varchar as hometown

        from raw_users
    )

select *
from parsed_users


with
    raw_users as (select * from {{ ref("raw_users") }}),

    parsed_users as (
        select
            -- ids
            data:user_id::varchar as user_id,

            -- strings
            lower(data:city::varchar) as city,
            lower(data:country::varchar) as country,
            lower(data:hometown::varchar) as hometown

        from raw_users
    )

select *
from parsed_users


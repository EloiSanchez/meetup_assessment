with
    raw_users as (select * from {{ ref("raw_users") }}),

    parsed_users as (
        select
            data:user_id::int as id,
            data:city::varchar as city,
            data:country::varchar as country,
            data:hometown::varchar as hometown
        from raw_users
    )

select *
from parsed_users


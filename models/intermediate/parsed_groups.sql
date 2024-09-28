with

    raw_groups as (select * from {{ ref("raw_groups") }}),

    parsed_groups as (
        select
            -- ids
            data:group_id::varchar as group_id,

            -- strings
            lower(data:name::varchar) as name,
            data:description::varchar as description,
            lower(data:city::varchar) as city,
            data:link::varchar as link,

            -- numerics
            data:lat::real as lat,
            data:lon::real as lon,

            -- timestamps
            {{ millisec_to_sec("data:created") }} as created_at

        from raw_groups
    )

select *
from parsed_groups


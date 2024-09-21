with

    raw_groups as (select * from {{ ref("raw_groups") }}),

    parsed_groups as (
        select
            data:group_id::varchar as id,
            data:name::varchar as name,
            data:description::varchar as description,
            data:city::varchar as city,
            {{ millisec_to_sec("data:created") }} as created,
            data:lat::real as lat,
            data:lon::real as lon,
            data:link::varchar as link
        from raw_groups
    )

select *
from parsed_groups


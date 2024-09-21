with
    raw_venues as (select * from {{ ref("raw_venues") }}),

    parsed_venues as (
        select
            data:venue_id::int as venue_id,
            data:name::varchar as name,
            data:city::varchar as city,
            data:country::varchar as country,
            data:lat::float as lat,
            data:lon::float as lon
        from raw_venues
    )

select *
from parsed_venues


with
    raw_events as (select * from {{ ref("raw_events") }}),

    parsed_events as (
        select
            data:group_id::varchar as group_id,
            data:name::varchar as name,
            data:description::varchar as description,

            {{ millisec_to_sec("data:created") }} as created,
            {{ millisec_to_sec("data:time") }} as time,

            data:duration::int as duration,
            data:rsvp_limit::int as rsvp_limit,
            data:venue_id::int as venue_id,
            data:status::varchar as status,
        from raw_events
    )
select *
from parsed_events


with
    raw_events as (select * from {{ ref("raw_events") }}),

    parsed_events as (
        select
            -- ids
            event_id::varchar as event_id,
            data:group_id::varchar as group_id,
            data:venue_id::varchar as venue_id,

            -- strings
            data:name::varchar as name,
            data:description::varchar as description,
            data:status::varchar as status,

            -- numerics
            data:duration::int as duration,
            data:rsvp_limit::int as rsvp_limit,

            -- timestamp
            {{ millisec_to_sec("data:created") }} as created_at,
            {{ millisec_to_sec("data:time") }} as start_at,

        from raw_events
    )
select *
from parsed_events


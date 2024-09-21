with
    raw_rsvps as (select event_id, data:rsvps as rsvps from {{ ref("raw_events") }}),

    parsed_event_rsvps as (
        select
            -- ids
            event_id::varchar as event_id,
            rsvps.value:user_id::varchar as user_id,

            -- strings
            rsvps.value:response::varchar as response,

            -- numerics
            rsvps.value:guests::int as guests,

            -- timestamps
            {{ millisec_to_sec("rsvps.value:when") }} as rsvp_at,

        from raw_rsvps, lateral flatten(input => raw_rsvps.rsvps) rsvps
    )

select *
from parsed_event_rsvps


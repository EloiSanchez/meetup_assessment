with
    raw_rsvps as (
        select id as event_id, data:rsvps as rsvps from {{ ref("raw_events") }}
    ),

    parsed_rsvps as (
        select
            event_id,
            rsvps.value:guests::int as guests,
            rsvps.value:response::varchar as response,
            rsvps.value:user_id::int as user_id,
            {{ millisec_to_sec("rsvps.value:when") }} as
        when,
        from raw_rsvps, lateral flatten(input => raw_rsvps.rsvps, path => '') rsvps
    )

select *
from parsed_rsvps


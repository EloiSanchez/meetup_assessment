with
    event_rsvps as (select * from {{ ref("parsed_event_rsvps") }}),

    events as (select * from {{ ref("parsed_events") }}),

    rsvps_count as (
        select event_id, response, count(*) + sum(guests) as rsvp_responses
        from event_rsvps
        group by event_id, response
    )

select *
from rsvps_count


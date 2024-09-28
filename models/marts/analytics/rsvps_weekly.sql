with

    events as (select * from {{ ref("parsed_events") }}),

    rsvps_count as (select * from {{ ref("rsvps_count") }}),

    rsvps_weekly as (
        select
            date_trunc('week', events.start_at) as date,
            rsvps_count.response,
            avg(rsvps_count.rsvp_responses) as rsvp_responses
        from events
        left join rsvps_count on events.event_id = rsvps_count.event_id
        where events.status = 'past'
        group by date, response
    )

select *
from rsvps_weekly


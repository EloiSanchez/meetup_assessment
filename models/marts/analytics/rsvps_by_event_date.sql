with

    events as (select * from {{ ref("parsed_events") }}),

    rsvps_count as (select * from {{ ref("rsvps_count") }}),

    rsvps_by_event_day as (
        select
            year(events.start_at) as year,
            quarter(events.start_at) as quarter,
            month(events.start_at) as month,
            dayofweekiso(events.start_at) as day_of_week,
            rsvps_count.response,
            avg(rsvps_count.rsvp_responses) as rsvp_responses
        from events
        left join rsvps_count on events.event_id = rsvps_count.event_id
        where events.status = 'past'
        group by year, quarter, month, day_of_week, response
    )

select *
from rsvps_by_event_day


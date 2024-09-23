with

    events as (select * from {{ ref("parsed_events") }}),

    rsvps_count as (select * from {{ ref("rsvps_count") }}),

    rsvps_by_anticipation as (
        select
            events.*,
            timestampdiff('day', events.created_at, events.start_at) as anticipation,
            rsvps_count.* exclude event_id
        from events
        left join rsvps_count on events.event_id = rsvps_count.event_id
        where events.status = 'past'
    )

select *
from rsvps_by_anticipation


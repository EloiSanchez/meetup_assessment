with

    events as (select * from {{ ref("parsed_events") }}),

    venues as (select * from {{ ref("parsed_venues") }}),

    rsvps_count as (select * from {{ ref("rsvps_count") }}),

    rsvps_by_event_country as (
        select
            venues.country,
            venues.city,
            rsvps_count.response,
            avg(rsvps_count.rsvp_responses) as rsvp_responses
        from events
        left join venues on events.venue_id = venues.venue_id
        left join rsvps_count on events.event_id = rsvps_count.event_id
        where events.status ilike 'past'
        group by country, city, response
    )

select *
from rsvps_by_event_country


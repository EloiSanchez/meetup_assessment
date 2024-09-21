with

    raw_group_topics as (
        select data:group_id as group_id, data:topics as topics
        from {{ ref("raw_groups") }}
    ),

    parsed_group_topics as (
        select
            -- ids
            group_id::varchar as group_id,

            -- strings
            topics.value::varchar as topic

        from raw_group_topics, lateral flatten(input => raw_group_topics.topics) topics
    )

select *
from parsed_group_topics


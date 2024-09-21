with
    raw_memberships as (
        select data:user_id as user_id, data:memberships as memberships
        from {{ ref("raw_users") }}
    ),

    parsed_user_memberships as (
        select
            -- ids
            user_id::varchar as user_id,

            -- strings
            memberships.value:group_id::varchar as group_id,

            -- timestamps
            {{ millisec_to_sec("memberships.value:joined::varchar") }} as joined_at,
        from
            raw_memberships,
            lateral flatten(input => raw_memberships.memberships) as memberships
    )

select *
from parsed_user_memberships


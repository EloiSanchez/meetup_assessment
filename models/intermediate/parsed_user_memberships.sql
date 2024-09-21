with
    raw_memberships as (
        select data:user_id as user_id, data:memberships as memberships
        from {{ ref("raw_users") }}
    ),

    parsed_user_memberships as (
        select
            user_id::int as id,
            memberships.value:group_id::varchar as group_id,
            {{ millisec_to_sec("memberships.value:joined::varchar") }} as joined,
        from
            raw_memberships,
            lateral flatten(input => raw_memberships.memberships) as memberships
    )

select *
from parsed_user_memberships


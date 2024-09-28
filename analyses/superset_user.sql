use role securityadmin
;

create or replace role superset_analyst_role;

grant usage
on database meetup_assessment
to role superset_analyst_role
;
grant usage
on all schemas in database meetup_assessment
to role superset_analyst_role
;
grant usage
on future schemas in database meetup_assessment
to role superset_analyst_role
;

grant select
on all tables in database meetup_assessment
to role superset_analyst_role
;
grant select
on future tables in database meetup_assessment
to role superset_analyst_role
;
grant select
on all views in database meetup_assessment
to role superset_analyst_role
;
grant select
on future views in database meetup_assessment
to role superset_analyst_role
;


grant usage
on warehouse compute_wh
to role superset_analyst_role
;

grant role superset_analyst_role
to role sysadmin
;

use role useradmin
;

create or replace user superset_analyst
  PASSWORD = 'xyjA28vfQ7gUU0'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_WAREHOUSE = compute_wh
  DEFAULT_ROLE = superset_analyst_role
  COMMENT = 'Used by superset to connect to Snowflake';

use role securityadmin
;

grant role superset_analyst_role
to user superset_analyst
;


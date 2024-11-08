use role securityadmin
;

create or replace role dbt_worker_role;

grant usage, create schema
on database meetup_assessment
to role dbt_worker_role
;
grant usage, create table, create view
on all schemas in database meetup_assessment
to role dbt_worker_role
;
grant usage, create table, create view
on future schemas in database meetup_assessment
to role dbt_worker_role
;

grant select
on all tables in database meetup_assessment
to role dbt_worker_role
;
grant select
on future tables in database meetup_assessment
to role dbt_worker_role
;
grant select
on all views in database meetup_assessment
to role dbt_worker_role
;
grant select
on all views in database meetup_assessment
to role dbt_worker_role
;


grant usage
on warehouse compute_wh
to role dbt_worker_role
;

grant role dbt_worker_role
to role sysadmin
;

use role useradmin
;

create or replace user dbt_worker
  PASSWORD = 'xyjA28vfQ7gUU0'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_WAREHOUSE = compute_wh
  DEFAULT_ROLE = dbt_worker_role
  COMMENT = 'Used by dbt to connect to Snowflake';

use role securityadmin
;

grant role dbt_worker_role
to user dbt_worker
;


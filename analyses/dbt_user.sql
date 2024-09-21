use role securityadmin
;

create or replace role dbt_worker_role;

grant usage, create schema
on database meetup_assessment
to role dbt_worker_role
;
grant usage, create table
on all schemas in database meetup_assessment
to role dbt_worker_role
;
grant usage, create table
on future schemas in database meetup_assessment
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
  password = 'xyjA28vfQ7gUU0'
  must_change_password = false
  default_warehouse = compute_wh
  default_role = dbt_worker_role
  comment = 'used by dbt to connect to snowflake';

use role securityadmin
;

grant role dbt_worker_role
to user dbt_worker
;


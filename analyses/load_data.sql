use schema meetup_assessment.sources
;

-- If all data files are actually the same format, as they are here, could be worth it 
-- to create a script that produced the create table and copy into commands for each of
-- the files in the data folder, instead of creating them manually for each file. For 
-- now it is OK like this
create table if not exists events(
	data variant
	);

copy into events
from @meetup_data/events.json
;

create table if not exists users(
	data variant
	);

copy into users
from @meetup_data/users.json
;

create table if not exists groups(
	data variant
	);

copy into groups
from @meetup_data/groups.json
;

create table if not exists venues(
	data variant
	);

copy into venues
from @meetup_data/venues.json
;


use database meetup_assessment
;

create schema if not exists sources;
use schema sources
;

create or replace file format json_format
	type = 'JSON'
	strip_outer_array = true;

create stage if not exists meetup_data
	file_format = json_format;

put file://data/*.json @meetup_data;


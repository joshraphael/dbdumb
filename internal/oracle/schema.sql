alter session set "_ORACLE_SCRIPT"=true;

create user fred identified by flintstone;

GRANT CONNECT, RESOURCE, DBA TO fred;

GRANT UNLIMITED TABLESPACE TO fred;

GRANT CREATE SESSION TO fred;

alter session set current_schema = fred;

CREATE TABLE person (
  id int,
  l varchar(255),
  f varchar(255),
  a varchar(255)
);

INSERT INTO person (id, l, f, a) VALUES (1, 'last', 'first', '123 E North Street');

GRANT ALL ON person TO fred;

create user fred identified by flintstone
  DEFAULT TABLESPACE users
  TEMPORARY TABLESPACE temp
  QUOTA UNLIMITED ON users;

GRANT CONNECT, RESOURCE, DBA, CREATE TABLE TO fred;

GRANT UNLIMITED TABLESPACE TO fred;

GRANT CREATE SESSION TO fred;

alter session set current_schema = fred;

CONN fred/flintstone;

CREATE TABLE fred.person (
  id int,
  l varchar(255),
  f varchar(255),
  a varchar(255)
);

INSERT INTO fred.person (id, l, f, a) VALUES (1, 'last', 'first', '123 E North Street');
INSERT INTO fred.person (id, l, f, a) VALUES (2, 'last1', 'first', '123 E North Street');

GRANT ALL ON fred.person TO fred;

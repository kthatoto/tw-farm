CREATE TABLE seeds (
  id integer primary key,
  user_id integer,
  plant_id integer,
  count integer default 0,
  level integer default 1
)

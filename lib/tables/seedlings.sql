CREATE TABLE seedlings (
  id integer primary key,
  user_id integer,
  plant_id integer,
  level integer default 1,
  growth integer default 0,
  max_growth integer
)

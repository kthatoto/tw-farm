CREATE TABLE larders (
  id integer primary key,
  user_id integer,
  level integer default 1,
  capacity integer
)

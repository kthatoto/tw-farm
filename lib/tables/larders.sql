CREATE TABLE larders (
  id integer primary key,
  display_id string,
  user_id integer,
  level integer default 1,
  capacity integer
)

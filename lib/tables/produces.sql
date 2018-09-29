CREATE TABLE produces (
  id integer primary key,
  user_id integer,
  plant_id integer,
  larder_id integer,
  level integer default 1,
  size_potential float,
  growth_potential float,
  levelup_probability float,
  size float,
  price integer
)

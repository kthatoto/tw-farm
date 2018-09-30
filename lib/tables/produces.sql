CREATE TABLE produces (
  id integer primary key,
  display_id string,
  user_id integer,
  plant_id integer,
  larder_id integer,
  level integer default 1,
  size_potential float,
  growth_potential float,
  levelup_probability float,
  size float,
  price integer,
  max_seeds_number integer,
  min_seeds_number integer
)

CREATE TABLE seedlings (
  id integer primary key,
  display_id string,
  user_id integer,
  plant_id integer,
  field_id integer,
  level integer default 1,
  size_potential float,
  growth_potential float,
  levelup_probability float,
  growth_per_tick float,
  current_growth float,
  maturity_growth float,
  max_seeds_number integer,
  min_seeds_number integer
)

CREATE TABLE shop_items (
  id integer primary key,
  user_id integer,
  type_id integer,
  count integer,
  level integer default 1
)

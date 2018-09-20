CREATE TABLE shop_items (
  id integer primary key,
  shop_itemable_id integer,
  shop_itemable_type string,
  price integer,
  level integer default 1,
  count integer
)

WITH stg_order_items AS (
  SELECT
    *
  FROM {{ ref('stg_order_items') }}
), stg_orders AS (
  SELECT
    *
  FROM {{ ref('stg_orders') }}
), stg_products AS (
  SELECT
    *
  FROM {{ ref('stg_products') }}
), stg_supplies AS (
  SELECT
    product_id,
    supply_cost
  FROM {{ ref('stg_supplies') }}
), join_e4a4 AS (
  SELECT
    stg_order_items.order_item_id,
    stg_order_items.order_id,
    stg_order_items.product_id,
    stg_orders.ordered_at,
    stg_order_items.product_id AS product_id_1
  FROM stg_order_items
  LEFT JOIN stg_orders
    ON stg_order_items.order_id = stg_orders.order_id
), aggregation_8c35 AS (
  SELECT
    product_id,
    SUM(supply_cost) AS supply_cost
  FROM stg_supplies
  GROUP BY
    product_id
), join_7823 AS (
  SELECT
    join_e4a4.order_item_id,
    join_e4a4.order_id,
    join_e4a4.product_id,
    join_e4a4.ordered_at,
    join_e4a4.ordered_at AS ordered_at_1,
    stg_products.product_name,
    stg_products.product_price,
    stg_products.is_food_item,
    stg_products.is_drink_item,
    join_e4a4.product_id AS product_id_1
  FROM join_e4a4
  LEFT JOIN stg_products
    ON join_e4a4.product_id = stg_products.product_id
), join_f170 AS (
  SELECT
    join_7823.order_item_id,
    join_7823.order_id,
    join_7823.product_id,
    join_7823.ordered_at,
    join_7823.product_name,
    join_7823.product_price,
    join_7823.is_food_item,
    join_7823.is_drink_item,
    join_7823.ordered_at AS ordered_at_1,
    join_7823.product_name AS product_name_1,
    join_7823.product_price AS product_price_1,
    join_7823.is_food_item AS is_food_item_1,
    join_7823.is_drink_item AS is_drink_item_1,
    aggregation_8c35.supply_cost
  FROM join_7823
  LEFT JOIN aggregation_8c35
    ON join_7823.product_id = aggregation_8c35.product_id
), order_items AS (
  SELECT
    *
  FROM join_f170
)
SELECT
  *
FROM order_items
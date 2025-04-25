WITH customers AS (
  /* Customer overview data mart, offering key details for each unique customer. One row per customer. */
  SELECT
    customer_id,
    customer_name,
    count_lifetime_orders,
    first_ordered_at,
    lifetime_spend,
    customer_type
  FROM {{ ref('jaffle_shop', 'customers') }}
  LIMIT 25
), downstream_of_customers_sql AS (
  SELECT
    *
  FROM customers
)
SELECT
  *
FROM downstream_of_customers_sql
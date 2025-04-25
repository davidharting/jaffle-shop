WITH customers AS (
  /* Customer overview data mart, offering key details for each unique customer. One row per customer. */
  SELECT
    customer_id,
    customer_name
  FROM {{ ref('jaffle_shop', 'customers') }}
), downstream_of_customers_sql AS (
  SELECT
    *
  FROM customers
)
SELECT
  *
FROM downstream_of_customers_sql
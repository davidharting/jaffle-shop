WITH customers AS (
  /* Customer overview data mart, offering key details for each unique customer. One row per customer. */
  SELECT
    *
  FROM {{ ref('jaffle_shop', 'customers') }}
), first_sql AS (
  SELECT
    *
  FROM customers
)
SELECT
  *
FROM first_sql
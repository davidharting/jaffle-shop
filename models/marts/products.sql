WITH stg_products AS (
  SELECT
    *
  FROM {{ ref('stg_products') }}
), products AS (
  SELECT
    *
  FROM stg_products
)
SELECT
  *
FROM products
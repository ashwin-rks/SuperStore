SELECT

  ord_id          AS order_id,
  prod_id         AS product_id,
  ship_id         AS shipping_id,
  cust_id         AS customer_id,
  sales,
  discount,
  CAST(order_quantity AS INT) AS order_quantity,
  profit,
  shipping_cost,
  CASE
    WHEN TRY_TO_NUMBER(PRODUCT_BASE_MARGIN) IS NOT NULL THEN CAST(PRODUCT_BASE_MARGIN AS DECIMAL(10, 2))
    ELSE NULL
  END AS product_base_margin
  
FROM {{ source('shopping', 'market') }}

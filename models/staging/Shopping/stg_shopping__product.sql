SELECT

  prod_id             AS product_id,
  product_category,
  product_sub_category

FROM {{ source('shopping', 'product') }}
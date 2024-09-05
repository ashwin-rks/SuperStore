SELECT

  ord_id                            AS order_id,
  TO_DATE(order_date, 'DD-MM-YYYY') AS order_date,
  order_priority,
  order_id                          AS shipping_order_id

FROM {{ source('shopping', 'orders') }}
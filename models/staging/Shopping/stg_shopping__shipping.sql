SELECT

  ship_id         AS shipping_id,
  order_id        AS shipping_order_id,
  ship_mode,
  TO_DATE(ship_date, 'DD-MM-YYYY') AS shipping_date

FROM {{ source('shopping', 'shipping') }}
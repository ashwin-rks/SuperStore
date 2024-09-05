WITH

orders AS (

  SELECT * FROM {{ ref('stg_shopping__orders') }}

),

market AS (

  SELECT * FROM {{ ref('stg_shopping__market') }}

),

final AS (

  SELECT
    orders.order_id,
    orders.order_date,
    orders.order_priority,
    market.customer_id,
    market.sales

  FROM 
    
    orders

  LEFT JOIN

    market

    USING (order_id)

)

SELECT * FROM final
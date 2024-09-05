WITH

customer AS (

  SELECT * FROM {{ ref('stg_shopping__customer') }}

),

orders AS (

  SELECT * FROM {{ ref('fct_order') }}

),

customer_order AS (

  SELECT
    
    customer_id,
    MIN(order_date)     AS first_ordered_date,
    MAX(order_date)     AS most_recent_date,
    SUM(sales)          AS lifetime_value,
    COUNT(customer_id)  AS total_orders

  FROM 

    orders

  GROUP BY customer_id

),

final AS (

  SELECT

    customer.customer_id,
    customer.customer_name,
    customer.region,
    customer_order.first_ordered_date,
    customer_order.most_recent_date,
    customer_order.lifetime_value,
    customer_order.total_orders

  FROM customer
  LEFT JOIN customer_order
  USING (customer_id)

  WHERE 
    customer.region <> 'NUNAVUT'
)

SELECT * FROM final
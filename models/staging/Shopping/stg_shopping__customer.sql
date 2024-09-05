SELECT
    cust_id         AS customer_id,
    customer_name,
    customer_segment,
    province,
    region

FROM {{ source('shopping', 'customer') }}
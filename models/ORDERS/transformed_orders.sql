

WITH orders AS (
    SELECT
        order_id,
        customer_id,
        order_date,
        product_id,
        quantity,
        price,
        status,
        -- derive calculated fields
        quantity * price AS total_amount,
        UPPER(status) AS status_clean
    FROM {{ source('bigquery_source', 'orders') }} --staging:orders
)

SELECT *
FROM orders

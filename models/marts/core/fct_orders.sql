select
    orders.order_id,
    customers.customer_id,
    coalesce(payments.amount,0) as amount
from {{ ref('stg_orders')}} orders
left outer join {{ ref('stg_customers')}} customers
  on customers.customer_id = orders.customer_id
left outer join {{ ref('stg_payments')}} payments
  on orders.order_id = payments.order_id
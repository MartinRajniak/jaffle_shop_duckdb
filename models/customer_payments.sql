with payments as (

    select * from {{ ref('stg_payments') }}

),

orders as (

    select * from {{ ref('stg_orders') }}

),

final as (

    select
        orders.customer_id,
        payments.payment_method,
        count(payments.payment_id) as number_of_payments,
        sum(payments.amount) as total_amount

    from payments

    left join orders
        on payments.order_id = orders.order_id

    group by orders.customer_id, payments.payment_method

)

select * from final

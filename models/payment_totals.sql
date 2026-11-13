{{ config(materialized='table') }}

with payments as (

    select * from main.raw_payments

)

select
    order_id,
    sum(amount) as amount

from payments

group by order_id

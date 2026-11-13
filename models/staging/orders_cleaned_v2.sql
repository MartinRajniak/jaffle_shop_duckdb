with source as (

    select * from {{ ref('raw_orders') }}

),

renamed as (

    select
        id,
        user_id as cust,
        order_date as dt,
        status = 'returned' as flag

    from source

)

select * from renamed

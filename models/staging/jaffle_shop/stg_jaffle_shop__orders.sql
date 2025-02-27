with

source as (

    select * from {{ source('jaffle_shop', 'orders') }}

),

transformed as (

    select 

        id as order_id,
        user_id as customer_id,
        order_date,
        status as order_status,
        row_number() over (
            partition by user_id
            order by order_date, id
        ) as user_order_seq
        , _etl_loaded_at as order_placed_at

    from source
    {{ limit_data_in_dev('order_date',3000) }}
)

select * from transformed
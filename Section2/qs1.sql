-- Documentation
    -- car_list temporary table - to select customer name and the 
    --          corresponding serial numbers of the cars they bought


    -- main_query - to select customer name and the total corresponding
    --          price of the cars they bought
with 
    car_list as 
    (
        select c.customer_name, t.car_serial_number 
        from 
            transaction as t 
        left join 
            customer as c 
        on 
            t.customer_id = c.customer_id),

    main_query as 
    (
        select cl.customer_name, sum(c.price) as spending 
        from 
            car_list as cl 
        left join 
            car as c 
        on 
            cl.car_serial_number = c.car_serial_number 
        group by 
            cl.customer_name
    )

select * from main_query;
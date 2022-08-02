-- Documentation
    -- count_list temporary table - to select the manufacturer id and the corresponding
    --         count of products sold using the number of corresponding transaction fields

    -- top_list temporary table - to select the top 3 bu arranging the count_list table
    --         descending order and getting the top 3

    -- month_sales  temporary table - to select manufacturer_id and corresponding count
    --         of products given the specific month

    -- main_query -- to select the manufacturer name and the corresponding sales count 
    --         for the desired current month

with 
    count_list as
    (
        select c.manufacturer_id, count(t.transaction_id) as count 
        from 
            transaction as t 
        left join 
            car as c 
        on 
            c.car_serial_number = t.car_serial_number 
        group by 
            c.manufacturer_id
    ),

    top_list as
    (
        select * 
        from 
            count_list
        order by
            count DESC limit 3
    ),

    month_sales as
    (
        select tl.manufacturer_id, count(t.transaction_id) as month_count
        from
            top_list as tl
        left join 
            car as c
        on 
            tl.manufacturer_id = c.manufacturer_id
        right join
            transaction as t
        on 
            c.car_serial_number = t.car_serial_number
        where
            (SELECT EXTRACT(MONTH FROM DATE(t.date))) as month = 1 and (SELECT EXTRACT(YEAR FROM DATE t.date)) as year = 2021
        group by 
            tl.manufacturer_id
    ),

    main_query as 
    (
        select m.manufacturer_name, ms.month_count from month_sales as ms 
        inner join 
            manufacturer as m 
        on
            ms.manufacturer_id = m.manufacturer_id)

    select * from main_query;
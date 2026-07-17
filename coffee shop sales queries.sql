with monthly_sales as(
select 
	month(transaction_date) as cm,
    round(sum(transaction_qty*unit_price)) as cm_sales
from coffee_shop_sales
group by cm
)
select 
cm,
cm_sales,
round(lag(cm_sales) over(order by cm)) as pm_sales,
concat(round(((cm_sales-lag(cm_sales) over(order by cm))/lag(cm_sales) over(order by cm))*100,2),'%') as mom_sales_growth
from monthly_sales;
//----------------------------------------------------------------
select 
round(sum(transaction_qty*unit_price)) as total_sales,
sum(transaction_qty) as total_qty_sold,
count(transaction_id) as total_orders
from coffee_shop_sales
where
month(transaction_date)=5 and day(transaction_date)=18;
//------------------------------------------------------------------

select 
case when
dayofweek(transaction_date) in(1,7) then 'Weekend'
else 'Weekday'
end as day_type,
concat(round(sum(transaction_qty*unit_price)/1000,1),'K') as total_sales
from coffee_shop_sales
where month(transaction_date) = 5
group by day_type
;
//-----------------------------------------------------------------------------------

SELECT 
 store_location,
    concat(round(sum(transaction_qty*unit_price)/1000,1),'K') as total_sales
FROM
    coffee_shop_sales
where month(transaction_date) = 5
group by store_location;
//-----------------------------------------------------------------------------------
SELECT 
 day(transaction_date) as day_of_month,
    concat(round(sum(transaction_qty*unit_price)/1000,1),'K') as total_sales
FROM
    coffee_shop_sales
where month(transaction_date) = 5
group by day_of_month;
//------------------------------------------------------------------------------------
SELECT 
 product_category,
concat(round(sum(transaction_qty*unit_price)/1000,2),'K') as total_sales
FROM coffee_shop_sales
WHERE month(transaction_date) = 5
GROUP BY product_category
ORDER BY sum(transaction_qty*unit_price) DESC;
//-------------------------------------------------------------------------------
SELECT 
 product_type,
concat(round(sum(transaction_qty*unit_price)/1000,2),'K') as total_sales
FROM coffee_shop_sales
WHERE month(transaction_date) = 5
GROUP BY product_type
ORDER BY sum(transaction_qty*unit_price) DESC
LIMIT 10;
//--------------------------------------------------------------------------
select * from coffee_shop_sales;

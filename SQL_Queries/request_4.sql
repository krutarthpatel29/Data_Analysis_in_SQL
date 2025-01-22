
with cte1 as(
SELECT 
    dp.segment,
    COUNT(DISTINCT (fs.product_code)) AS product_count_2020
FROM
    fact_sales_monthly fs
        JOIN
    dim_product AS dp ON fs.product_code = dp.product_code
WHERE
    fiscal_year = '2020'
GROUP BY segment
)
    

,cte2 as(
SELECT 
    dp.segment,
    COUNT(DISTINCT (fs.product_code)) AS product_count_2021
FROM
    fact_sales_monthly fs
        JOIN
    dim_product AS dp ON fs.product_code = dp.product_code
WHERE
    fiscal_year = '2021'
GROUP BY segment
)

select 
cte1.segment,
cte1.product_count_2020,
cte2.product_count_2021,
(cte2.product_count_2021- cte1.product_count_2020) as difference
from cte1
join cte2
on cte1.segment=cte2.segment
order by difference desc






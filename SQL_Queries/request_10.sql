with cte1 as(
SELECT 
    p.division,
    fs.product_code,
    p.product,
    SUM(fs.sold_quantity) AS total_sold_quantity
FROM
    dim_product p
        JOIN
    fact_sales_monthly fs ON p.product_code = fs.product_code
WHERE
    fs.fiscal_year = '2021'
GROUP BY fs.product_code , division , p.product),

cte2 as(
SELECT division,product_code,product,total_sold_quantity,
RANK() OVER(PARTITION BY division ORDER BY total_sold_quantity DESC) as rank_order 

FROM cte1)

SELECT 
    cte1.division,
    cte1.product_code,
    cte1.product,
    cte2.total_sold_quantity,
    cte2.rank_order
FROM
    cte1
        JOIN
    cte2 ON cte1.product_code = cte2.product_code
WHERE
    cte2.rank_order IN (1 , 2, 3)
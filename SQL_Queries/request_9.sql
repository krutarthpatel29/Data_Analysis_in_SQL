with cte1 as(
SELECT 
    c.channel,
    ROUND(SUM(g.gross_price * fs.sold_quantity / 1000000),2) AS Gross_sales_mln
FROM
    dim_customer c
        JOIN
    fact_sales_monthly fs ON c.customer_code = fs.customer_code
        JOIN
    fact_gross_price g ON g.product_code = fs.product_code
WHERE
    fs.fiscal_year = '2021'
GROUP BY c.channel)

SELECT 
    channel,
    Gross_sales_mln,
    CONCAT(ROUND((Gross_sales_mln * 100 / (SELECT SUM(Gross_sales_mln) FROM cte1)),
                    2),
            '%') AS percentage
FROM
    cte1


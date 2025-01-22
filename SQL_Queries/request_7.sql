SELECT 
    CONCAT(MONTHNAME(FS.date), ' ', YEAR(FS.date)) AS 'Month',
    fs.fiscal_year,
    ROUND(SUM((sold_quantity * gross_price)), 2) AS Gross_sales_amount
FROM
    fact_sales_monthly fs
        JOIN
    fact_gross_price g ON fs.product_code = g.product_code
        JOIN
    dim_customer c ON fs.customer_code = c.customer_code
WHERE
    customer = 'Atliq Exclusive'
GROUP BY Month , fs.fiscal_year
ORDER BY fs.fiscal_year;
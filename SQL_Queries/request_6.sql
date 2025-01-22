with cte1 as(
SELECT 
    customer_code,
    AVG(pre_invoice_discount_pct) AS average_discount_percentage
FROM
    fact_pre_invoice_deductions
WHERE
    fiscal_year = '2021'
GROUP BY customer_code),

cte2 as(
SELECT 
    customer_code, customer
FROM
    dim_customer
WHERE
    market = 'India')
    

SELECT 
    cte2.customer_code,
    cte2.customer,
    average_discount_percentage
FROM
    cte1
        JOIN
    cte2 ON cte1.customer_code = cte2.customer_code
ORDER BY average_discount_percentage DESC
LIMIT 5
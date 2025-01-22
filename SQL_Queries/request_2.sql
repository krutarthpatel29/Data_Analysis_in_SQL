with cte1 as(
SELECT 
    COUNT(DISTINCT (product_code)) AS unique_product_2020
FROM
    fact_sales_monthly
WHERE
    fiscal_year = '2020')
    

,cte2 as(
SELECT 
    COUNT(DISTINCT (product_code)) AS unique_product_2021
FROM
    fact_sales_monthly
WHERE
    fiscal_year = '2021')

SELECT 
    cte1.unique_product_2020,
    cte2.unique_product_2021,
    ROUND(((unique_product_2021 - unique_product_2020) / unique_product_2020) * 100,2) AS percentage_chg
FROM
    cte1
        CROSS JOIN
    cte2;




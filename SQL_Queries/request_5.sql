SELECT 
    fm.product_code, p.product, manufacturing_cost
FROM
    fact_manufacturing_cost AS fm
        JOIN
    dim_product AS p ON fm.product_code = p.product_code
WHERE
    manufacturing_cost = '240.5364'
        OR manufacturing_cost = '0.8920'
ORDER BY manufacturing_cost ASC
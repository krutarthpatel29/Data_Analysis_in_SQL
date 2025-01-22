SELECT DISTINCT
    (market) AS list_of_markets
FROM
    dim_customer
WHERE
    customer = 'Atliq Exclusive' AND region = 'APAC'

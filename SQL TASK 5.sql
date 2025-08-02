WITH ranked_payment_methods AS (
    SELECT 
        city,
        Payment,
        COUNT(*) AS payment_method_count,
        ROW_NUMBER() OVER (PARTITION BY city ORDER BY COUNT(*) DESC) AS row_num
    FROM 
        `walmartsales dataset - walmartsales`
    GROUP BY 
        city, Payment
)
SELECT 
    city,
    Payment,
    payment_method_count
FROM 
    ranked_payment_methods
WHERE 
    row_num = 1;

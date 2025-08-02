SELECT 
    `Customer ID`,City,Gender,Payment,
    ROUND(SUM(Total),2) AS total_revenue
FROM 
    `walmartsales dataset - walmartsales`
GROUP BY 
    `Customer ID`,City,Gender,Payment
ORDER BY 
    total_revenue DESC
LIMIT 5;

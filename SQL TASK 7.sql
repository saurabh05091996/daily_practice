SELECT 
    `Customer type`,
    `Product line`,
    round(sum(Total),2) AS total_revenue
FROM 
    `walmartsales dataset - walmartsales`
GROUP BY 
    `Customer type`, `Product line`
ORDER BY 
    `Customer type`, total_revenue DESC;


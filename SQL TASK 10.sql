SELECT 
    DAYNAME(STR_TO_DATE(Date, '%d-%m-%Y')) AS day_of_week,
   ROUND( SUM(Total),2) AS total_sales
FROM 
    `walmartsales dataset - walmartsales`
GROUP BY 
    day_of_week
ORDER BY 
    total_sales DESC;

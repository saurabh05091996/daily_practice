SELECT * FROM `walmartsales dataset - walmartsales`;

WITH monthly_sales AS 
(SELECT Branch,
        STR_TO_DATE(DATE_FORMAT(STR_TO_DATE(Date, '%d-%m-%Y'), '%Y-%m-01'), '%Y-%m-%d') AS month,
        SUM(Total) AS total_sales
    FROM `walmartsales dataset - walmartsales`
    GROUP BY Branch, STR_TO_DATE(DATE_FORMAT(STR_TO_DATE(Date, '%d-%m-%Y'), '%Y-%m-01'), '%Y-%m-%d')),
growth_calc AS 
(SELECT Branch,month,total_sales,
        LAG(total_sales) OVER (PARTITION BY Branch ORDER BY month) AS prev_month_sales
    FROM monthly_sales),
growth_rate AS 
(SELECT Branch,month,total_sales,prev_month_sales,
        CASE
            WHEN prev_month_sales > 0 THEN (total_sales - prev_month_sales) / prev_month_sales ELSE NULL
        END AS growth
    FROM growth_calc),
average_growth AS 
(SELECT Branch,
        ROUND(AVG(growth),2 )AS avg_growth
    FROM growth_rate
    WHERE growth IS NOT NULL
    GROUP BY Branch)
SELECT Branch, avg_growth
FROM average_growth
ORDER BY avg_growth DESC
LIMIT 1;

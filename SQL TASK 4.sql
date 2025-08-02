-- Step 1: Calculate mean and std deviation per product line
WITH product_stats AS (
    SELECT
        `Product line`,
       ROUND( AVG(Total),2) AS avg_total,
       ROUND( STDDEV(Total),2)AS std_total
    FROM `walmartsales dataset - walmartsales`
    GROUP BY `Product line`
)

-- Step 2: Join with transactions and flag anomalies
SELECT
    w.*,
    ps.avg_total,
    ps.std_total,
    CASE
        WHEN w.Total > ps.avg_total + 2 * ps.std_total THEN 'High Anomaly'
        WHEN w.Total < ps.avg_total - 2 * ps.std_total THEN 'Low Anomaly'
        ELSE 'Normal'
    END AS anomaly_status
FROM `walmartsales dataset - walmartsales` w
JOIN product_stats ps ON w.`Product line` = ps.`Product line`
WHERE w.Total > ps.avg_total + 2 * ps.std_total
   OR w.Total < ps.avg_total - 2 * ps.std_total;

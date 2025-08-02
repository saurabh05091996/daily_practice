WITH customer_spending AS (
    SELECT
        `Invoice ID` AS customer_id,
        SUM(Total) AS total_spent
    FROM `walmartsales dataset - walmartsales`
    GROUP BY `Invoice ID`
),
spending_with_tiers AS (
    SELECT
        customer_id,
        total_spent,
        NTILE(3) OVER (ORDER BY total_spent DESC) AS tier_group
    FROM customer_spending
)
SELECT
    customer_id,
    total_spent,
    CASE
        WHEN tier_group = 1 THEN 'High'
        WHEN tier_group = 2 THEN 'Medium'
        ELSE 'Low'
    END AS spending_tier
FROM spending_with_tiers;

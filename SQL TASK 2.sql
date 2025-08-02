-- Step 1: Calculate total profit per product line and branch
WITH product_profit AS (
    SELECT
        Branch,
        `Product line`,
        SUM(`gross income`) AS total_profit
    FROM `walmartsales dataset - walmartsales`
    GROUP BY Branch, `Product line`
)

-- Step 2: Select the top product line per branch using a correlated subquery
SELECT
    pp.Branch,
    pp.`Product line` AS top_product_line,
    ROUND(pp.total_profit, 2) AS total_profit
FROM product_profit pp
WHERE pp.total_profit = (
    SELECT MAX(p2.total_profit)
    FROM product_profit p2
    WHERE p2.Branch = pp.Branch
);


SELECT DISTINCT
    a.`Customer ID`
FROM 
    `walmartsales dataset - walmartsales` a
JOIN 
    `walmartsales dataset - walmartsales` b
    ON a.`Customer ID` = b.`Customer ID`
    AND STR_TO_DATE(a.Date, '%d-%m-%Y') < STR_TO_DATE(b.Date, '%d-%m-%Y')
    AND DATEDIFF(STR_TO_DATE(b.Date, '%d-%m-%Y'), STR_TO_DATE(a.Date, '%d-%m-%Y')) <= 30;

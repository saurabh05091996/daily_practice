SELECT 
    MONTHNAME(STR_TO_DATE(Date, '%d-%m-%Y')) AS month_name,
    Gender,
    round(SUM(Total),2) AS total_sales
FROM 
   `walmartsales dataset - walmartsales`
GROUP BY 
    month_name, Gender
ORDER BY 
    FIELD(month_name, 'January', 'February', 'March', 'April', 'May', 'June', 
          'July', 'August', 'September', 'October', 'November', 'December'), Gender;

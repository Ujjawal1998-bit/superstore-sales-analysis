Select * from sam_super;
SELECT
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sam_super;
SELECT
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM sam_super
GROUP BY Region
ORDER BY Total_Sales DESC
LIMIT 1;
SELECT
    Category,
    ROUND(SUM(Profit)/SUM(Sales)*100, 2) AS Profit_Margin_Percent
FROM sam_super
GROUP BY Category
ORDER BY Profit_Margin_Percent DESC
LIMIT 1;
SELECT
    EXTRACT(YEAR FROM OrderDate) AS Year,
    EXTRACT(MONTH FROM OrderDate) AS Month,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM sam_super
GROUP BY Year, Month
ORDER BY Total_Sales DESC
LIMIT 1;
SELECT
    CustomerName,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM sam_super
GROUP BY CustomerName
ORDER BY Total_Sales DESC
LIMIT 10;
SELECT
    ROUND(AVG(DATEDIFF(ShipDate, OrderDate)), 2) AS Average_Delivery_Time_Days
FROM sam_super ;
SELECT
    ROUND(COUNT(CASE WHEN Discount > 0 THEN 1 END) * 100.0 / COUNT(*), 2) AS Discount_Percentage
FROM sam_super;
SELECT
    Region,
    ROUND(SUM(Profit)/SUM(Sales)*100, 2) AS Profit_to_Sales_Percent
FROM sam_super
GROUP BY Region
ORDER BY Profit_to_Sales_Percent DESC;
SELECT
    SubCategory,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(AVG(Discount)*100, 2) AS Average_Discount_Percent
FROM sam_super
GROUP BY SubCategory
HAVING Average_Discount_Percent > 15
ORDER BY Total_Sales ASC
LIMIT 5;
SELECT
    SubCategory,
    COUNT(*) AS Order_Count,
    SUM(CASE WHEN Profit < 0 THEN 1 ELSE 0 END) AS Loss_Orders
FROM sam_super
GROUP BY SubCategory
HAVING Loss_Orders > 0
ORDER BY Loss_Orders DESC;
SELECT
    Segment,
    ROUND(SUM(Sales)/COUNT(DISTINCT OrderID), 2) AS Average_Sales_Per_Order
FROM sam_super
GROUP BY Segment;
SELECT
    State,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sam_super
GROUP BY State
HAVING Total_Profit < 0
ORDER BY Total_Profit ASC;
SELECT
    Category,
    SUM(Quantity) AS Total_Quantity
FROM sam_super
GROUP BY Category
ORDER BY Total_Quantity DESC;
SELECT
    COUNT(*) AS Repeat_Customers
FROM
    (SELECT
        CustomerName
     FROM sam_super
     GROUP BY CustomerName
     HAVING COUNT(DISTINCT OrderID) > 1
    ) AS repeats;
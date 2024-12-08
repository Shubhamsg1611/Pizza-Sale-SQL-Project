Select Top 100 * From Pizza

-- Q.1 Total Revenue of Pizza Sale.

Select Round(Sum(Total_Price),2) AS Total_Revenue From Pizza

-- Q.2 Average Order Value. 

Select Round(Sum(Total_Price) / Count(Distinct Order_id),2) AS Order_Value
From Pizza

-- Q.3 Total Pizza sold from Pizza Shop.

Select Sum(Quantity) AS Total_Pizza_Sold From Pizza

-- Q.4 Total Orders of Pizza Shop. 

Select Count(Distinct Order_id) AS Total_Orders 
From Pizza

-- Q.5 Average Pizzas by per Order.

SELECT CAST(CAST(SUM(Quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT Order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM Pizza

-- Q.6 Daily Trend for Total Orders of Pizza Shop. 

Select Datename(DW, order_date) AS Order_Day, Count(Distinct Order_id) AS Total_Orders
From Pizza
Group by Datename(DW, order_date)

-- Q.7  Monthly Trend for Total Orders & Total Revenue of Pizza Shop.

Select Datename(Month, Order_date) as Order_Month, Count(Distinct Order_id) AS Total_Orders, Round(Sum(Total_Price),2) AS Total_Revenue
From Pizza
Group by Datename(Month, Order_date)

-- Q.8 Percentage of Sales by Pizza Category.

Select Pizza_Category AS Category,Sum(Quantity) AS Quantity_Sold, Round(Sum(Total_Price),2) AS Total_Revenue, 
       CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from Pizza) AS DECIMAL(10,2)) AS PCT
From Pizza 
Group by Pizza_Category 
Order by PCT Desc

-- Q.9 Percentage of Sales by Pizza Size.
Select Pizza_Size, Sum(Quantity) AS Quantity_Sold, Round(Sum(Total_Price),2) AS Total_Revenue, 
       CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from Pizza) AS DECIMAL(10,2)) AS PCT
From Pizza 
Group by Pizza_Size
Order by PCT Desc

-- Q.10 Top 5 Pizzas by Revenue. 

Select Top 5 Pizza_name, Round(Sum(Total_Price),2) AS Total_Revenue
From Pizza 
Group by Pizza_name
Order by Total_Revenue Desc

-- Q.11 Bottom 5 Pizzas by Revenue.

Select Top 5 Pizza_name, Round(Sum(Total_Price),2) AS Total_Revenue
From Pizza 
Group by Pizza_name
Order by Total_Revenue Asc

-- Q.12 Top 5 Pizzas by Pizza Sold. 

Select Top 5 Pizza_name, Sum(Quantity) AS Total_Pizza_Sold
From Pizza 
Group by Pizza_name
Order by Total_Pizza_Sold Desc

-- Q.13 Bottom 5 Pizzas by Pizza Sold. 

Select Top 5 Pizza_name, Sum(Quantity) AS Total_Pizza_Sold
From Pizza 
Group by Pizza_name
Order by Total_Pizza_Sold Asc

-- Q.14 Top 5 Pizzas by Order placed.
Select Top 5 Pizza_name, Count(Distinct Order_id) AS Total_Pizza_Order
From Pizza 
Group by Pizza_name
Order by Total_Pizza_Order Desc


-- Q.15 Bottom 5 Pizzas by Order placed.

Select Top 5 Pizza_name, Count(distinct Order_id) AS Total_Pizza_Order
From Pizza 
Group by Pizza_name
Order by Total_Pizza_Order Asc

-- Q.16 Pizaa Orders by Time of Day.

SELECT CASE
        WHEN CAST(order_time AS TIME) BETWEEN '06:00:00' AND '11:59:59' THEN 'Morning'
        WHEN CAST(order_time AS TIME) BETWEEN '12:00:00' AND '17:59:59' THEN 'Afternoon'
        WHEN CAST(order_time AS TIME) BETWEEN '18:00:00' AND '23:59:59' THEN 'Evening'
        ELSE 'Night' END AS Time_Period, COUNT(order_id) AS Total_Orders FROM pizza
GROUP BY CASE
        WHEN CAST(order_time AS TIME) BETWEEN '06:00:00' AND '11:59:59' THEN 'Morning'
        WHEN CAST(order_time AS TIME) BETWEEN '12:00:00' AND '17:59:59' THEN 'Afternoon'
        WHEN CAST(order_time AS TIME) BETWEEN '18:00:00' AND '23:59:59' THEN 'Evening'
        ELSE 'Night'END
ORDER BY total_orders DESC;

-- Q.17 Top 5 Pizza in 'Classic' Pizza Category. 

Select Top 5 Pizza_name, Sum(Quantity) AS Total_Pizza_Sold, Count(distinct Order_id) AS Total_Pizza_Order, 
       Round(Sum(Total_Price),2) AS Total_Revenue From Pizza 
Where Pizza_Category = 'Classic'
Group by Pizza_name
Order by Total_Pizza_Sold Desc

-- Q.18 Top 5 Pizza in 'Veggie' Pizza Category. 

Select Top 5 Pizza_name, Sum(Quantity) AS Total_Pizza_Sold, Count(distinct Order_id) AS Total_Pizza_Order, 
       Round(Sum(Total_Price),2) AS Total_Revenue From Pizza 
Where Pizza_Category = 'Veggie'
Group by Pizza_name
Order by Total_Pizza_Sold Desc

-- Q.19 Top 5 Pizza in 'Supreme' Pizza Category.  

Select Top 5 Pizza_name, Sum(Quantity) AS Total_Pizza_Sold, Count(distinct Order_id) AS Total_Pizza_Order, 
       Round(Sum(Total_Price),2) AS Total_Revenue From Pizza 
Where Pizza_Category = 'Supreme'
Group by Pizza_name
Order by Total_Pizza_Sold Desc

-- Q.20 Top 5 Pizza in 'Chicken' Pizza Category.

Select Top 5 Pizza_name, Sum(Quantity) AS Total_Pizza_Sold, Count(distinct Order_id) AS Total_Pizza_Order, 
       Round(Sum(Total_Price),2) AS Total_Revenue From Pizza 
Where Pizza_Category = 'Chicken'
Group by Pizza_name
Order by Total_Pizza_Sold Desc

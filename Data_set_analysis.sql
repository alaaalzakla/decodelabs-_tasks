select * from dataset;
--total revenue--
select sum(TotalPrice) as Total_Revenue from dataset 
where OrderStatus != 'Cancelled';
--total sales
select SUM(quantity) as Total_Purchased_Products from dataset 
where OrderStatus != 'Cancelled';
--Average quantity--
select AVG(quantity) as average_price from dataset
where OrderStatus != 'Cancelled';
--[Average Number of Items Sold per Order by Month]--
select month,year,round(AVG(quantity),1) as [Average Number of Items Sold per Order by Month] from dataset
where OrderStatus != 'Cancelled' group by Month, Year;
----With coupon VS without----
 select is_coupons, SUM(totalprice) as with_vs_without_coupons from dataset 
 where OrderStatus != 'Cancelled' group by Is_Coupons;
 select is_coupons, SUM(Quantity) as with_vs_without_coupons from dataset
 where OrderStatus != 'Cancelled' group by Is_Coupons;
---top method of payment--
select PaymentMethod, COUNT(orderId) as [sales by payment method] from dataset
group by PaymentMethod order by COUNT(orderid) desc;
---top selling years---
select YEAR, SUM(totalprice) as topsellingyears from dataset 
where OrderStatus != 'Cancelled' group by Year order by SUM(totalprice) desc; 
--top selling months---
select  top 5  SUM(totalprice)  as topsellingmonth,Month from dataset group by MONTH;
select MONTH , count(is_coupons) as [coupon applied], SUM(totalprice) as[sales by coupons] from dataset
where Is_Coupons= 'Yes' group by Month order by SUM(totalprice) desc;
--TOP 5 PRODUCTS-- 
select top 3 dataset.Product , sum(quantity) as [sales per product] from dataset 
group by Product order by [sales per product] desc;
select dataset.Product, SUM(quantity) as sales_per_product from dataset
group by dataset.Product order by sales_per_product desc;
--top referral sources-- (i didn't omit the cancelled orders because it highlights the exposure of the website)
select referralsource ,COUNT(orderid) as [top referral sources] from dataset
group by ReferralSource order by [top referral sources]desc;
---top loyal customers-- 
select top 3 customerid ,
COUNT(orderid) as[most loyal customer] 
from dataset group by CustomerID order by [most loyal customer] desc;
--sales per week-- 
SELECT 
    Year,
    Month,
    DATEPART(WEEK, Date) AS Week_Number,
    ROUND(AVG(Quantity), 0) AS Avg_Quantity_Per_Week
FROM dataset
GROUP BY Year, Month, DATEPART(WEEK, Date)
ORDER BY Year, Month, Week_Number;
--CANCELLED ORDERS--
SELECT OrderStatus,
COUNT(ORDERID) AS CANCELLED_ORDERS
FROM dataset
WHERE OrderStatus= 'Cancelled'
GROUP BY OrderStatus;
---ITEMS KEPT UNPURCHASED--
SELECT SUM(QUANTITY) AS TOTAL_PURCHASES,
SUM(ITEMSINCART)-SUM(QUANTITY) 
AS [LEFT OUT ITEMS] 
FROM DATASET


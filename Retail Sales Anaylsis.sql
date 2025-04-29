CREATE DATABASE retail_sales;

SELECT *
 FROM retail_sales.retail_sales_dataset;
 
 
 CREATE TABLE retail_sales.retail_sales_dataset2
 LIKE retail_sales.retail_sales_dataset;
 
 
INSERT retail_sales.retail_sales_dataset2
SELECT *
 FROM retail_sales.retail_sales_dataset; 

SELECT * 
FROM retail_sales.retail_sales_dataset2;
 
 
SELECT *, 
ROW_NUMBER() OVER(
PARTITION BY `Transaction ID`, `Date`, `Customer ID`, `Gender`, `Age`, `Product Category`, `Quantity`, `Price per Unit`, `Total Amount`) AS `Index`
 FROM retail_sales.retail_sales_dataset;
 
 
 WITH duplicate_cte AS 
 (
 SELECT *, 
ROW_NUMBER() OVER(
PARTITION BY `Transaction ID`, `Date`, `Customer ID`, `Gender`, `Age`, `Product Category`, `Quantity`, `Price per Unit`, `Total Amount`) AS `Index`
 FROM retail_sales.retail_sales_dataset
 )
 SELECT *
 FROM duplicate_cte 
 WHERE `Index` > 1;
 
SELECT Product Category 
FROM retail_sales.retail_sales_dataset2
WHERE `Product Category` LIKE "Clothing%";


SELECT `Date`, STR_TO_DATE(`Date`, "%m/%d/%Y")
FROM retail_sales.retail_sales_dataset2;
 
UPDATE retail_sales.retail_sales_dataset2
SET `DATE` = STR_TO_DATE(`Date`, "%m/%d/%Y");

ALTER TABLE retail_sales.retail_sales_dataset2
MODIFY COLUMN `Date` DATE;


SELECT * 
FROM retail_sales.retail_sales_dataset2;


SELECT SUM(`Total Amount`) AS Total_Sales
FROM retail_sales.retail_sales_dataset2;


SELECT SUM(`Total Amount` - `Price per Unit`) AS Total_Profit
FROM retail_sales.retail_sales_dataset2;

SELECT COUNT(DISTINCT `Customer ID`) AS Total_Orders
FROM retail_sales.retail_sales_dataset2;

SELECT `Product Category`, SUM(`Total Amount`) AS Total_Sales
FROM retail_sales.retail_sales_dataset2
GROUP BY 1
ORDER BY 2 DESC;

SELECT DATE_FORMAT(`Date`, "%m") AS `Month`, SUM(`Total Amount`) AS Total_Sales
FROM retail_sales.retail_sales_dataset2
GROUP BY 1
ORDER BY 2 DESC;







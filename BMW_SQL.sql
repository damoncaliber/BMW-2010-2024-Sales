-- SQL 
-- BMW Sales analysis 

DROP TABLE IF EXISTS bmw_sales;

CREATE TABLE bmw_sales
(
 Model	TEXT,
 Years	INT,
 Region	TEXT,
 Colour	TEXT,
 Fuel_Type TEXT,
 Transmission TEXT,
 Engine_Size FLOAT,	
 Mileage INT,
 Price NUMERIC,
 Sales_Volume INT,
 Sales_Classification TEXT
);


SELECT * FROM bmw_sales;

-- Exploratory data analysis

-- Business driven questions(Sales perfromance & Trends)

 -- 1. sales volume by model
 
 SELECT 
     model,
	 SUM(sales_volume) AS total_sales_volume
 FROM bmw_sales
 GROUP BY model
 ORDER BY total_sales_volume;

 -- 2. sales trend over years
 
 SELECT 
     years,
	 SUM(sales_volume) AS total_sales_volume
 FROM bmw_sales
 GROUP BY years
 ORDER BY years ASC;

 -- 3. Total sales & average price
 
 SELECT 
    COUNT(*) AS Total_records,
	SUM(sales_volume) AS Total_sales_volume,
	 ROUND(AVG(price), 2) AS AVG_Price,
	 ROUND(MIN(price), 2) AS Min_price,
	 ROUND(MAX(price), 2) AS Max_price
 FROM bmw_sales;
     
 -- 4. Revenue by region

 SELECT 
     Region,
	 SUM(price * sales_volume) AS Total_revenue
 FROM bmw_sales
 GROUP BY Region
 ORDER BY Total_revenue DESC;


  -- 5. Average price by Fuel type & transmission

  SELECT 
     fuel_type,
	 transmission,
	 ROUND(AVG(price), 2) AS Avg_price
  FROM bmw_sales
  GROUP BY fuel_type, transmission
  ORDER BY Avg_price DESC;

-- 6. Popular colour by region

  SELECT 
     Region,
	 colour,
	 SUM(sales_volume) AS Total_sales_volume
  FROM bmw_sales
  GROUP BY Region, colour
  ORDER BY Region, Total_sales_volume DESC;

-- 7. Engine size demand & pricing

  SELECT 
     engine_size,
	 ROUND(AVG(price), 2) AS avg_price,
	 SUM(sales_volume) AS Total_sales_volume
  FROM bmw_sales
  GROUP BY engine_size
  ORDER BY Total_sales_volume DESC;

-- 8. sales classification distribution

SELECT 
    sales_classification,
	COUNT(*) AS record_count,
	SUM(sales_volume) AS Total_sales_volume
FROM bmw_sales
GROUP BY sales_classification

-- 9. Top models by revenue

 SELECT 
     model,
	 SUM(price * sales_volume) AS Total_revenue
 FROM bmw_sales
 GROUP BY model
 ORDER BY Total_revenue DESC
 LIMIT 10;

-- 10. Price by mileage

SELECT 
    mileage,
	model,
	price
FROM bmw_sales
WHERE mileage IS NOT NULL
        AND 
	  price IS NOT NULL
GROUP BY mileage, model, price
ORDER BY mileage ASC;





	 




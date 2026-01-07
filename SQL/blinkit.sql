--This query is used to see all the data present in the blinkit_data table.

SELECT * FROM blinkit_data

--This query counts the total number of rows in the table.
--It tells us how many records or items are available in the dataset.

SELECT COUNT(*) AS ROW_COUNT FROM blinkit_data

--In the ITEM_FAT_CONTENT column, the same values are written in different formats such as LF, low fat, and reg.
--This query replaces all values like LF and low fat with Low Fat.

UPDATE blinkit_data
SET ITEM_FAT_CONTENT ='Low Fat'
where ITEM_FAT_CONTENT in ('LF','low fat')

--This query changes the value reg to Regular.

UPDATE blinkit_data
SET ITEM_FAT_CONTENT ='Regular'
where ITEM_FAT_CONTENT = 'reg'

         --OR

UPDATE blinkit_data
SET ITEM_FAT_CONTENT=
CASE
WHEN ITEM_FAT_CONTENT IN ('LF','low fat') THEN 'Low Fat'
WHEN ITEM_FAT_CONTENT = 'reg' THEN 'Regular'
ELSE ITEM_FAT_CONTENT
END

--This query is used to verify the data cleaning.
--It shows all unique values present in the ITEM_FAT_CONTENT column 
--to confirm that only standardized values like Low Fat and Regular remain.

SELECT DISTINCT(ITEM_FAT_CONTENT) FROM blinkit_data


--1 Calculate the total sales ?
SELECT CAST(SUM(SALES)/1000000 AS DECIMAL(10,2)) 
AS TOTAL_SALES_MILLIONS  
FROM blinkit_data


--2 Calculate the average sales value ?
SELECT CAST(AVG(SALES) AS DECIMAL(10,0)) 
AS AVG_SALES 
FROM blinkit_data


--3 Find the total number of items present ?
SELECT COUNT(*) AS NO_OF_ITEM FROM blinkit_data


--4 Calculate the average customer rating across all items ?
SELECT CAST(AVG(RATING) AS DECIMAL(10,2))
AS AVG_RATING 
FROM blinkit_data


--5 Retrieve total sales grouped by item fat content ?
SELECT ITEM_FAT_CONTENT,
        CAST(SUM(SALES) AS DECIMAL (10,2)) AS TOTAL_SALES,
        CAST(AVG(SALES) AS DECIMAL(10,1)) AS AVG_SALES,
        COUNT(*) AS NO_OF_ITEM,
        CAST(AVG(RATING) AS DECIMAL(10,2)) AS AVG_RATING 
FROM blinkit_data
GROUP BY ITEM_FAT_CONTENT 


--6 List total sales for each item type and identify the highest-selling item types ?
SELECT TOP 5 Item_Type,
        CAST(SUM(SALES) AS DECIMAL (10,2)) AS TOTAL_SALES,
        CAST(AVG(SALES) AS DECIMAL(10,1)) AS AVG_SALES,
        COUNT(*) AS NO_OF_ITEM,
        CAST(AVG(RATING) AS DECIMAL(10,2)) AS AVG_RATING 
FROM blinkit_data
GROUP BY Item_Type
ORDER BY Total_Sales DESC


--7 Retrieve total sales of low-fat and regular items across different outlet location types ?
SELECT Outlet_Location_Type,
    ISNULL([Low Fat], 0) AS Low_Fat,
    ISNULL([Regular], 0) AS Regular
FROM
(
    SELECT Outlet_Location_Type, Item_Fat_Content,
        CAST (SUM(Sales) AS DECIMAL (10,2)) AS Total_Sales
    FROM blinkit_data
    GROUP BY Outlet_Location_Type, Item_Fat_Content
) AS SourceTable

PIVOT
(
    SUM(Total_Sales)
    FOR Item_Fat_Content IN ([Low Fat], [Regular])
) AS PivotTable
ORDER BY Outlet_Location_Type


--8 Find total sales for each outlet establishment year ?
SELECT Outlet_Establishment_Year,
        CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales,
        CAST(AVG(SALES) AS DECIMAL(10,1)) AS AVG_SALES,
        COUNT(*) AS NO_OF_ITEM,
        CAST(AVG(RATING) AS DECIMAL(10,2)) AS AVG_RATING
FROM blinkit_data
GROUP BY Outlet_Establishment_Year
ORDER BY Outlet_Establishment_Year


--9 Calculate total sales and percentage contribution of each outlet size ?
SELECT 
    Outlet_Size, 
    CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales,
    CAST((SUM(Sales) * 100.0 / SUM(SUM(Sales)) OVER()) AS DECIMAL(10,0)) AS Sales_Percentage,
    CAST(AVG(SALES) AS DECIMAL(10,1)) AS AVG_SALES,
    COUNT(*) AS NO_OF_ITEM,
    CAST(AVG(RATING) AS DECIMAL(10,2)) AS AVG_RATING
FROM blinkit_data
GROUP BY Outlet_Size
ORDER BY Total_Sales DESC;


--10 Show total sales for each outlet location type ?
SELECT Outlet_Location_Type, 
    CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales,
     CAST((SUM(Sales) * 100.0 / SUM(SUM(Sales)) OVER()) AS DECIMAL(10,0)) AS Sales_Percentage,
    CAST(AVG(SALES) AS DECIMAL(10,1)) AS AVG_SALES,
    COUNT(*) AS NO_OF_ITEM,
    CAST(AVG(RATING) AS DECIMAL(10,2)) AS AVG_RATING
FROM blinkit_data
GROUP BY Outlet_Location_Type
ORDER BY Total_Sales DESC


--11 Retrieve sales, average sales, number of items, average rating, and item visibility for each outlet type.
SELECT Outlet_Type, 
    CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales,
    CAST(AVG(Sales) AS DECIMAL(10,0)) AS Avg_Sales,
	COUNT(*) AS No_Of_Items,
	CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating,
	CAST(AVG(Item_Visibility) AS DECIMAL(10,2)) AS Item_Visibility,
    RANK() OVER (ORDER BY SUM(Sales) DESC) AS Sales_Rank
FROM blinkit_data
GROUP BY Outlet_Type
ORDER BY Total_Sales DESC


--12 Calculate total sales across different item visibility levels(low, medium, high) or Total Sales by Item Visibility
SELECT 
    CASE 
        WHEN Item_Visibility < 0.05 THEN 'Low Visibility'
        WHEN Item_Visibility BETWEEN 0.05 AND 0.15 THEN 'Medium Visibility'
        ELSE 'High Visibility'
    END AS Visibility_Level,
    CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales
FROM blinkit_data
GROUP BY 
    CASE 
        WHEN Item_Visibility < 0.05 THEN 'Low Visibility'
        WHEN Item_Visibility BETWEEN 0.05 AND 0.15 THEN 'Medium Visibility'
        ELSE 'High Visibility'
    END
ORDER BY Total_Sales DESC


--13 Find the outlet types that sell more than the average sales in their location. or Outlet Sales Above Location Average
SELECT 
    Outlet_Location_Type,
    Outlet_Type,
    CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales
FROM blinkit_data b
GROUP BY Outlet_Location_Type, Outlet_Type
HAVING SUM(Sales) >
       (
         SELECT AVG(Sales)
         FROM blinkit_data
         WHERE Outlet_Location_Type = b.Outlet_Location_Type
       )

--14 Identify the top-performing outlet type by sales within each outlet location. or Top Outlet Type Performance by Location
SELECT * FROM (
    SELECT 
        Outlet_Location_Type,
        Outlet_Type,
        CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales,
        RANK() OVER (
            PARTITION BY Outlet_Location_Type 
            ORDER BY SUM(Sales) DESC
        ) AS Rank
    FROM blinkit_data
    GROUP BY Outlet_Location_Type, Outlet_Type
) t
WHERE Rank = 1


--15 Calculate the total item sales and contribution percentage of each item type within every outlet type. or Item Type Contribution Analysis
SELECT 
    Outlet_Type,
    Item_Type,
    CAST(SUM(Sales) AS DECIMAL(10,2)) AS Item_Sales,
    CAST(SUM(Sales) * 100.0 /
        SUM(SUM(Sales)) OVER (PARTITION BY Outlet_Type)
    AS DECIMAL(10,2)) AS Contribution_Percentage
FROM blinkit_data
GROUP BY Outlet_Type, Item_Type




--16 Retrieve the total sales of low-fat and regular items across different outlet types or Low Fat vs Regular Sales Across Outlet Types
SELECT 
    Outlet_Type,
    Item_Fat_Content,
    CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales
FROM blinkit_data
GROUP BY Outlet_Type, Item_Fat_Content
ORDER BY Outlet_Type, Total_Sales DESC









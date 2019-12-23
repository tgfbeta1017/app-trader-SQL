
--------------------- Query for app store
SELECT name,price,content_rating,primary_genre AS genre,(CASE WHEN price=0.00 THEN 10000
	   		 ELSE price*10000 END) AS purchase_price,(CASE WHEN rating=0.0 THEN 12
													 WHEN rating=0.5 THEN 24
													 WHEN rating=1.0 THEN 36
													 WHEN rating=1.5 THEN 48
													 WHEN rating=2.0 THEN 60
													 WHEN rating=2.5 THEN 72
													 WHEN rating=3.0 THEN 84
													 WHEN rating=3.5 THEN 96
													 WHEN rating=4.0 THEN 108
													 WHEN rating=4.5 THEN 120
													 WHEN rating=5.0 THEN 132 END) AS longevity_months,
	 	(CASE WHEN rating=0.0 THEN 12*5000
													 WHEN rating=0.5 THEN 24*5000
													 WHEN rating=1.0 THEN 36*5000
													 WHEN rating=1.5 THEN 48*5000
													 WHEN rating=2.0 THEN 60*5000
													 WHEN rating=2.5 THEN 72*5000
													 WHEN rating=3.0 THEN 84*5000
													 WHEN rating=3.5 THEN 96*5000
													 WHEN rating=4.0 THEN 108*5000
													 WHEN rating=4.5 THEN 120*5000
													 WHEN rating=5.0 THEN 132*5000 END) AS total_earning,
		(CASE WHEN rating=0.0 THEN 12*1000
													 WHEN rating=0.5 THEN 24*500
													 WHEN rating=1.0 THEN 36*500
													 WHEN rating=1.5 THEN 48*500
													 WHEN rating=2.0 THEN 60*500
													 WHEN rating=2.5 THEN 72*500
													 WHEN rating=3.0 THEN 84*500
													 WHEN rating=3.5 THEN 96*500
													 WHEN rating=4.0 THEN 108*500
													 WHEN rating=4.5 THEN 120*500
													 WHEN rating=5.0 THEN 132*500 END) AS total_spending,
		 (CASE WHEN rating=0.0 AND price=0.00 THEN 12*5000-12*500-10000
		       WHEN rating=0.0 THEN 12*5000-12*500-price*10000
													 WHEN rating=0.5 AND price=0.00 THEN 24*5000-24*500-100000
		  											 WHEN rating=0.5 THEN 24*5000-24*500-price*10000
													 WHEN rating=1.0 THEN 36*5000-36*500-price*10000
		  											 WHEN rating=1.0 AND price=0.00 THEN 36*5000-36*500-10000
													 WHEN rating=1.5 THEN 48*5000-48*500-price*10000
		  											 WHEN rating=1.5 AND price=0.00 THEN 48*5000-48*500-10000
													 WHEN rating=2.0 THEN 60*5000-60*500 - price*10000
		  											 WHEN rating=2.0 AND price=0.00 THEN 60*5000-40*500-10000
													 WHEN rating=2.5 THEN 72*5000-72*500-price*10000
		  											 WHEN rating=2.5 AND price=0.00 THEN 72*5000-72*500-10000
		  											 WHEN rating=3.0 AND price=0.00 THEN 84*5000-84*500-10000
													 WHEN rating=3.0 THEN 84*5000-84*500-price*10000
		  											 WHEN rating = 3.5 AND price=0.00 THEN 96*5000-96*500-10000
													 WHEN rating=3.5 THEN 96*5000-96*500-price*10000
		  											 WHEN rating=4.0 AND price=0.00 THEN 108*5000-108*500-10000
													 WHEN rating=4.0 THEN 108*5000-108*500-price*10000
		  											 WHEN rating=4.5  AND price=0.00 THEN 120*5000-120*500-10000
													 WHEN rating=4.5 THEN 120*5000-120*500-price*10000
		  											 WHEN rating=5.0 AND price=0.00 THEN 132*5000-132*500-10000
													 WHEN rating=5.0 THEN 132*5000-132*500-price*10000 END) AS total_profit			
FROM  app_store_apps
WHERE name IN (SELECT DISTINCT goog.name
FROM play_store_apps AS goog
INNER JOIN app_store_apps AS appl
ON goog.name=appl.name)
ORDER BY total_profit DESC
------------------------------------------------------- end of calculation for app store

---------------------------------------------------------------------------start of play store 
SELECT  distinct name,price,content_rating,genres,
												 (CASE WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=0.0 AND price ='0' THEN 12*5000-12*500-10000
												  	   WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=0.0 THEN 12*5000-12*500-(price::money::numeric::float8*10000)
												  
													 WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=0.5 AND price ='0' THEN 24*5000-24*500-10000
												     WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=0.5 THEN 24*5000-24*500-(price::money::numeric::float8*10000)
												  
													 WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=1.0 AND price='0' THEN 36*5000-36*500-10000
												     WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=1.0 THEN 36*5000-36*500-(price::money::numeric::float8*10000)

													 WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=1.5 AND price='0' THEN 48*5000-48*500-10000
												     WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=1.5 THEN 48*5000-48*500-(price::money::numeric::float8*10000)

												 
													 WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=2.0 AND price='0' THEN 60*5000-60*500-10000
												     WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=2.0 THEN 60*5000-60*500-(price::money::numeric::float8*10000)
												  
													 WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=2.5 AND price='0' THEN 72*5000-72*500-10000
												     WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=2.5 THEN 72*5000-72*500-(price::money::numeric::float8*10000)
												  
													 WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=3.0 AND price='0' THEN 84*5000-84*500-10000
													 WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=3.0 THEN 84*5000-84*500-(price::money::numeric::float8*10000)
												  
													 WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=3.5 AND price='0' THEN 96*5000-96*500-10000
												  	 WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=3.5 THEN 96*5000-96*500-(price::money::numeric::float8*10000)

													 WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=4.0 AND price='0' THEN 108*5000-108*500-10000
												     WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=4.0 THEN 108*5000-108*500-(price::money::numeric::float8*10000)
												  
													 WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=4.5 AND price='0' THEN 120*5000-120*500-10000
												     WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=4.5 THEN 120*5000-120*500-(price::money::numeric::float8*1000)
												  
													 WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=5.0 AND price='0' THEN 132*5000-132*500-10000
												     WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=5.0 THEN 132*5000-132*500 -(price::money::numeric::float8*1000)
												  
												  END) AS total_profit

FROM play_store_apps AS psa

WHERE psa.name IN (SELECT DISTINCT goog.name
FROM play_store_apps AS goog
INNER JOIN app_store_apps AS appl
ON goog.name=appl.name)
GROUP BY name,price,content_rating,genres
ORDER BY total_profit DESC
-------------------------------------------------------------------------------
select * from app_store_apps
--------------------------------------------------------------- looking at count of genre grouped by total profit appstore
SELECT primary_genre,count(primary_genre) AS count_genre,
		 											(CASE WHEN rating=0.0 AND price=0.00 THEN 12*5000-12*500-10000
		       WHEN rating=0.0 THEN 12*5000-12*500-price*10000
													 WHEN rating=0.5 AND price=0.00 THEN 24*5000-24*500-100000
		  											 WHEN rating=0.5 THEN 24*5000-24*500-price*10000
													 WHEN rating=1.0 THEN 36*5000-36*500-price*10000
		  											 WHEN rating=1.0 AND price=0.00 THEN 36*5000-36*500-10000
													 WHEN rating=1.5 THEN 48*5000-48*500-price*10000
		  											 WHEN rating=1.5 AND price=0.00 THEN 48*5000-48*500-10000
													 WHEN rating=2.0 THEN 60*5000-60*500 - price*10000
		  											 WHEN rating=2.0 AND price=0.00 THEN 60*5000-40*500-10000
													 WHEN rating=2.5 THEN 72*5000-72*500-price*10000
		  											 WHEN rating=2.5 AND price=0.00 THEN 72*5000-72*500-10000
		  											 WHEN rating=3.0 AND price=0.00 THEN 84*5000-84*500-10000
													 WHEN rating=3.0 THEN 84*5000-84*500-price*10000
		  											 WHEN rating = 3.5 AND price=0.00 THEN 96*5000-96*500-10000
													 WHEN rating=3.5 THEN 96*5000-96*500-price*10000
		  											 WHEN rating=4.0 AND price=0.00 THEN 108*5000-108*500-10000
													 WHEN rating=4.0 THEN 108*5000-108*500-price*10000
		  											 WHEN rating=4.5  AND price=0.00 THEN 120*5000-120*500-10000
													 WHEN rating=4.5 THEN 120*5000-120*500-price*10000
		  											 WHEN rating=5.0 AND price=0.00 THEN 132*5000-132*500-10000
													 WHEN rating=5.0 THEN 132*5000-132*500-price*10000 END) AS total_profit			
FROM  app_store_apps
WHERE name IN (SELECT DISTINCT goog.name
FROM play_store_apps AS goog
INNER JOIN app_store_apps AS appl
ON goog.name=appl.name)
GROUP BY primary_genre,total_profit
ORDER BY total_profit DESC, primary_genre DESC

-------------------------------------------------------------------------------------profit grouped by content rating app store

SELECT content_rating,count(content_rating),
		 											(CASE WHEN rating=0.0 AND price=0.00 THEN 12*5000-12*500-10000
		       WHEN rating=0.0 THEN 12*5000-12*500-price*10000
													 WHEN rating=0.5 AND price=0.00 THEN 24*5000-24*500-100000
		  											 WHEN rating=0.5 THEN 24*5000-24*500-price*10000
													 WHEN rating=1.0 THEN 36*5000-36*500-price*10000
		  											 WHEN rating=1.0 AND price=0.00 THEN 36*5000-36*500-10000
													 WHEN rating=1.5 THEN 48*5000-48*500-price*10000
		  											 WHEN rating=1.5 AND price=0.00 THEN 48*5000-48*500-10000
													 WHEN rating=2.0 THEN 60*5000-60*500 - price*10000
		  											 WHEN rating=2.0 AND price=0.00 THEN 60*5000-40*500-10000
													 WHEN rating=2.5 THEN 72*5000-72*500-price*10000
		  											 WHEN rating=2.5 AND price=0.00 THEN 72*5000-72*500-10000
		  											 WHEN rating=3.0 AND price=0.00 THEN 84*5000-84*500-10000
													 WHEN rating=3.0 THEN 84*5000-84*500-price*10000
		  											 WHEN rating = 3.5 AND price=0.00 THEN 96*5000-96*500-10000
													 WHEN rating=3.5 THEN 96*5000-96*500-price*10000
		  											 WHEN rating=4.0 AND price=0.00 THEN 108*5000-108*500-10000
													 WHEN rating=4.0 THEN 108*5000-108*500-price*10000
		  											 WHEN rating=4.5  AND price=0.00 THEN 120*5000-120*500-10000
													 WHEN rating=4.5 THEN 120*5000-120*500-price*10000
		  											 WHEN rating=5.0 AND price=0.00 THEN 132*5000-132*500-10000
													 WHEN rating=5.0 THEN 132*5000-132*500-price*10000 END) AS total_profit			
FROM  app_store_apps
WHERE name IN (SELECT DISTINCT goog.name
FROM play_store_apps AS goog
INNER JOIN app_store_apps AS appl
ON goog.name=appl.name)
GROUP BY content_rating,total_profit
ORDER BY total_profit DESC,content_rating 
----------------------------------------------------------------------------------- group by price appstore
SELECT price,count(price) AS count_price,
		 											(CASE WHEN rating=0.0 AND price=0.00 THEN 12*5000-12*500-10000
		       WHEN rating=0.0 THEN 12*5000-12*500-price*10000
													 WHEN rating=0.5 AND price=0.00 THEN 24*5000-24*500-100000
		  											 WHEN rating=0.5 THEN 24*5000-24*500-price*10000
													 WHEN rating=1.0 THEN 36*5000-36*500-price*10000
		  											 WHEN rating=1.0 AND price=0.00 THEN 36*5000-36*500-10000
													 WHEN rating=1.5 THEN 48*5000-48*500-price*10000
		  											 WHEN rating=1.5 AND price=0.00 THEN 48*5000-48*500-10000
													 WHEN rating=2.0 THEN 60*5000-60*500 - price*10000
		  											 WHEN rating=2.0 AND price=0.00 THEN 60*5000-40*500-10000
													 WHEN rating=2.5 THEN 72*5000-72*500-price*10000
		  											 WHEN rating=2.5 AND price=0.00 THEN 72*5000-72*500-10000
		  											 WHEN rating=3.0 AND price=0.00 THEN 84*5000-84*500-10000
													 WHEN rating=3.0 THEN 84*5000-84*500-price*10000
		  											 WHEN rating = 3.5 AND price=0.00 THEN 96*5000-96*500-10000
													 WHEN rating=3.5 THEN 96*5000-96*500-price*10000
		  											 WHEN rating=4.0 AND price=0.00 THEN 108*5000-108*500-10000
													 WHEN rating=4.0 THEN 108*5000-108*500-price*10000
		  											 WHEN rating=4.5  AND price=0.00 THEN 120*5000-120*500-10000
													 WHEN rating=4.5 THEN 120*5000-120*500-price*10000
		  											 WHEN rating=5.0 AND price=0.00 THEN 132*5000-132*500-10000
													 WHEN rating=5.0 THEN 132*5000-132*500-price*10000 END) AS total_profit			
FROM  app_store_apps
WHERE name IN (SELECT DISTINCT goog.name
FROM play_store_apps AS goog
INNER JOIN app_store_apps AS appl
ON goog.name=appl.name)
GROUP BY price,total_profit
ORDER BY total_profit DESC, price 


-------------------------------------------------------------------- need to create table inorder to group by total_profit
create table play_store_profit AS (SELECT  name,	(CASE WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=0.0 AND price ='0' THEN 12*5000-12*500-10000
												  	   WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=0.0 THEN 12*5000-12*500-(price::money::numeric::float8*10000)
												  
													 WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=0.5 AND price ='0' THEN 24*5000-24*500-10000
												     WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=0.5 THEN 24*5000-24*500-(price::money::numeric::float8*10000)
												  
													 WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=1.0 AND price='0' THEN 36*5000-36*500-10000
												     WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=1.0 THEN 36*5000-36*500-(price::money::numeric::float8*10000)

													 WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=1.5 AND price='0' THEN 48*5000-48*500-10000
												     WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=1.5 THEN 48*5000-48*500-(price::money::numeric::float8*10000)

												 
													 WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=2.0 AND price='0' THEN 60*5000-60*500-10000
												     WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=2.0 THEN 60*5000-60*500-(price::money::numeric::float8*10000)
												  
													 WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=2.5 AND price='0' THEN 72*5000-72*500-10000
												     WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=2.5 THEN 72*5000-72*500-(price::money::numeric::float8*10000)
												  
													 WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=3.0 AND price='0' THEN 84*5000-84*500-10000
													 WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=3.0 THEN 84*5000-84*500-(price::money::numeric::float8*10000)
												  
													 WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=3.5 AND price='0' THEN 96*5000-96*500-10000
												  	 WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=3.5 THEN 96*5000-96*500-(price::money::numeric::float8*10000)

													 WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=4.0 AND price='0' THEN 108*5000-108*500-10000
												     WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=4.0 THEN 108*5000-108*500-(price::money::numeric::float8*10000)
												  
													 WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=4.5 AND price='0' THEN 120*5000-120*500-10000
												     WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=4.5 THEN 120*5000-120*500-(price::money::numeric::float8*1000)
												  
													 WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=5.0 AND price='0' THEN 132*5000-132*500-10000
												     WHEN ROUND(AVG(CAST(rating AS DECIMAL)) * 2, 0)/2=5.0 THEN 132*5000-132*500 -(price::money::numeric::float8*1000)
												  
												  END) AS total_profit

FROM (SELECT distinct psa.name,psa.content_rating, psa.rating, psa.price
	  FROM play_store_apps AS psa
INNER JOIN app_store_apps AS asa
ON psa.name=asa.name) AS jt
GROUP BY name,jt.price)
--------------------------------------------------------------------------------group by price on profit playstore
SELECT jt.price,count(jt.price),total_profit
FROM (SELECT distinct psa.name,psa.price,total_profit FROM 
	  play_store_apps AS psa INNER JOIN play_store_profit AS psf
ON psa.name=psf.name 
INNER JOIN app_store_apps AS asa
ON psa.name=asa.name) jt

GROUP BY jt.price,jt.total_profit
ORDER BY total_profit DESC

--------------------------------------------------------------------------------- group by genres playstore
SELECT jt.genres,count(jt.genres),total_profit
FROM (SELECT distinct psa.name,psa.genres,total_profit FROM 
	  play_store_apps AS psa INNER JOIN play_store_profit AS psf
ON psa.name=psf.name 
INNER JOIN app_store_apps AS asa
ON psa.name=asa.name) jt

GROUP BY jt.genres,jt.total_profit
ORDER BY total_profit DESC

-------------------------------------------------------------------group by content rating playstore
SELECT jt.content_rating,count(jt.content_rating),total_profit
FROM (SELECT distinct psa.name,psa.content_rating,total_profit FROM 
	  play_store_apps AS psa INNER JOIN play_store_profit AS psf
ON psa.name=psf.name 
INNER JOIN app_store_apps AS asa
ON psa.name=asa.name) jt

GROUP BY jt.content_rating,jt.total_profit
ORDER BY total_profit DESC



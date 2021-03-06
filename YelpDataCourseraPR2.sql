Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary.

In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular research question you want to answer. You will be required to prepare the dataset for the analysis you choose to do. As with the first part, you will be graded, in part, on how easy your code is to read, so use proper formatting and comments to illustrate and communicate your intent as required.

For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.



Part 1: Yelp Dataset Profiling and Understanding

1. Profile the data by finding the total number of records for each of the tables below:
	
i. Attribute table = 10000
ii. Business table = 10000
iii. Category table = 10000
iv. Checkin table = 10000
v. elite_years table = 10000
vi. friend table = 10000
vii. hours table = 10000
viii. photo table = 10000
ix. review table = 10000
x. tip table = 10000
xi. user table =10000
	


2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

i. Business = 10000
ii. Hours = 1562
iii. Category = 2643
iv. Attribute = 1115
v. Review = 8090 from business_id
vi. Checkin = 493
vii. Photo = 6493
viii. Tip = 3979 form business_id
ix. User = 10000
x. Friend = 11
xi. Elite_years = 10000

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	



3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer: "no."
	
	
	SQL code used to arrive at answer:
	
	SELECT *
	FROM user
	WHERE (name IS NULL OR
	       id IS NULL OR
	       review_count IS NULL OR
	       yelping_since IS NULL OR
	       useful IS NULL OR
	       funny IS NULL OR
	       cool IS NULL OR
	       fans IS NULL OR
	       average_stars IS NULL OR
	       compliment_hot IS NULL OR
	       compliment_more IS NULL OR
	       compliment_profile IS NULL OR
	       compliment_cute IS NULL OR
	       compliment_list IS NULL OR
	       compliment_note  IS NULL OR
	       compliment_plain IS NULL OR
	       compliment_cool IS NULL OR
	       compliment_funny IS NULL OR
	       compliment_writer IS NULL OR
	       compliment_photos IS NULL)
	

	
4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

	i. Table: Review, Column: Stars
	
		min: 1		max: 5		avg: 3.7082
		
	
	ii. Table: Business, Column: Stars
	
		min: 1.0	max: 5.0	avg: 3.6549
		
	
	iii. Table: Tip, Column: Likes
	
		min: 0		max: 2		avg: 0.0144
		
	
	iv. Table: Checkin, Column: Count
	
		min: 1		max: 53		avg: 1.9414
		
	
	v. Table: User, Column: Review_count
	
		min: 0		max: 2000		avg: 24.2995
		


5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer:
	
	SELECT business.city, COUNT(*) AS number
	FROM review JOIN business on business.id = review.id
	GROUP BY business.city
	ORDER BY number DESC
	

	Copy and Paste the Result Below:
	
	+-------------+--------+
	| city        | number |
	+-------------+--------+
	| Las Vegas   |      3 |
	| Phoenix     |      2 |
	| Belmont     |      1 |
	| Brook Park  |      1 |
	| Champaign   |      1 |
	| Gastonia    |      1 |
	| Macedonia   |      1 |
	| Madison     |      1 |
	| Peoria      |      1 |
	| Scarborough |      1 |
	| Tempe       |      1 |
	+-------------+--------+

	
6. Find the distribution of star ratings to the business in the following cities:

i. Avon

SQL code used to arrive at answer:

SELECT city, SUM(stars*review_count)/SUM(review_count) AS 'star rating', SUM(review_count) AS count
FROM business
WHERE city = 'Avon'
ORDER BY stars DESC



Copy and Paste the Resulting Table Below (2 columns – star rating and count):

+------+---------------+-------+
| city |   star rating | count |
+------+---------------+-------+
| Avon | 3.62578616352 |   159 |
+------+---------------+-------+

-- I decided to put here a column with the city's name so it's clear to see
-- This rating is based on the number of votes in each place of avon and 
-- The average rating of the place, instead of just the simple avg. from
-- The stars, so its more precise ;D


ii. Beachwood

SQL code used to arrive at answer:

SELECT city, SUM(stars*review_count)/SUM(review_count) AS 'star rating', SUM(review_count) AS count
FROM business
WHERE city = 'Beachwood'
ORDER BY stars DESC


Copy and Paste the Resulting Table Below (2 columns – star rating and count):
		
+-----------+---------------+-------+
| city      |   star rating | count |
+-----------+---------------+-------+
| Beachwood | 3.97810218978 |   137 |
+-----------+---------------+-------+

-- Remembering the database is case sensitive, so "BeachWood"
-- give no answers for the query, and "Beachwood" got this! .-.

7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer:
	
	SELECT user.id, user.name, review_count
	FROM user
	ORDER BY review_count DESC
	LIMIT 10

		
	Copy and Paste the Result Below:
		
	+------------------------+-----------+--------------+
	| id                     | name      | review_count |
	+------------------------+-----------+--------------+
	| -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |         2000 |
	| -3s52C4zL_DHRK0ULG6qtg | Sara      |         1629 |
	| -8lbUNlXVSoXqaRRiHiSNg | Yuri      |         1339 |
	| -K2Tcgh2EKX6e6HqqIrBIQ | .Hon      |         1246 |
	| -FZBTkAZEXoP7CYvRV2ZwQ | William   |         1215 |
	| --2vR0DIsmQ6WfcSzKWigw | Harald    |         1153 |
	| -gokwePdbXjfS0iF7NsUGA | eric      |         1116 |
	| -DFCC64NXgqrxlO8aLU5rg | Roanna    |         1039 |
	| -8EnCioUmDygAbsYZmTeRQ | Mimi      |          968 |
	| -0IiMAZI2SsQ7VmyzJjokQ | Christine |          930 |
	+------------------------+-----------+--------------+

	-- In order to check information I gave LIMIT 10, not 
	-- just LIMIT 3

8. Does posing more reviews correlate with more fans?

	Please explain your findings and interpretation of the results:
	
	SELECT  user.name, review_count, fans
	FROM user
	-- WHERE review_count < 494
	ORDER BY review_count desc

	-- Looking for the table, there's a relation between the data, its
	-- not 100% right (there's allways that one user with 100 comments
	-- and 300 fans, and vice-versa), but its pretty clear that there's
	-- some proportionality between both data..
	-- to check more precisely, I'd have to use some statistics with
	-- collected data

	
9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer:

	--More reviews with the word 'love'
	
	SQL code used to arrive at answer:

	SELECT Count(text),  'hate' AS 'word'
	FROM review
	WHERE (text LIKE '%HATE%')
	UNION
	SELECT Count(text), 'love'
	FROM review
	WHERE (text LIKE '%LOVE%')
	
	
10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:
	
	SELECT  user.name, fans
	FROM user
	ORDER BY fans desc
    LIMIT 10

	
	Copy and Paste the Result Below:

	+-----------+------+
	| name      | fans |
	+-----------+------+
	| Amy       |  503 |
	| Mimi      |  497 |
	| Harald    |  311 |
	| Gerald    |  253 |
	| Christine |  173 |
	| Lisa      |  159 |
	| Cat       |  133 |
	| William   |  126 |
	| Fran      |  124 |
	| Lissa     |  120 |
	+-----------+------+
	
		

Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.
	
i. Do the two groups you chose to analyze have a different distribution of hours?

-- First I take a look at the cities with most business (some are subscribed in a lot of
-- categories)

SELECT business.city, count(DISTINCT business.name) AS 'nº of business'
FROM business INNER JOIN category ON business.id = category.business_id
GROUP BY business.city
ORDER BY count(DISTINCT business.name) DESC
LIMIT 10

-- So Toronto is the city with most business: 
	+-----------+----------------+
	| city      | nº of business |
	+-----------+----------------+
	| Toronto   |       24       |
	| Phoenix   |       21       |
	| Las Vegas |       17       |
	| Chandler  |       10       |
	| Charlotte |       10       |
	| Cleveland |       7        |
	| Tempe     |       7        |
	| Mesa      |       6        |
	| Edinburgh |       5        |
	| Henderson |       5        |
	+-----------+----------------+

-- Toronto has wich type of business category the most?

	SELECT category.category, count(category.category)
	FROM business INNER JOIN category ON business.id = category.business_id
	WHERE city = 'Toronto'
	GROUP BY category.category
	ORDER BY count(category.category) DESC
	LIMIT 5

	+-------------+--------------------------+
	| category    | count(category.category) |
	+-------------+--------------------------+
	| Restaurants |                       10 |
	| Bars        |                        4 |
	| Food        |                        4 |
	| Nightlife   |                        4 |
	| Shopping    |                        4 |
	+-------------+--------------------------+

-- So Toronto has 10 Restaurants... we can easily see them just before analyse data:

	SELECT name, city, stars, review_count, is_open, category
	FROM business JOIN category ON business.id = category.business_id
	WHERE city = 'Toronto' and category = 'Restaurants'
	ORDER BY stars DESC, review_count DESC

	+--------------------+---------+-------+--------------+---------+-------------+
	| name               | city    | stars | review_count | is_open | category    |
	+--------------------+---------+-------+--------------+---------+-------------+
	| Cabin Fever        | Toronto |   4.5 |           26 |       1 | Restaurants |
	| Sushi Osaka        | Toronto |   4.5 |            8 |       1 | Restaurants |
	| Edulis             | Toronto |   4.0 |           89 |       1 | Restaurants |
	| Naniwa-Taro        | Toronto |   4.0 |           75 |       1 | Restaurants |
	| Mama Mia           | Toronto |   4.0 |            8 |       0 | Restaurants |
	| The Kosher Gourmet | Toronto |   3.5 |            3 |       1 | Restaurants |
	| Big Smoke Burger   | Toronto |   3.0 |           47 |       1 | Restaurants |
	| Pizzaiolo          | Toronto |   3.0 |           34 |       1 | Restaurants |
	| 99 Cent Sushi      | Toronto |   2.0 |            5 |       0 | Restaurants |
	| Royal Dumpling     | Toronto |   1.5 |            4 |       1 | Restaurants |
	+--------------------+---------+-------+--------------+---------+-------------+

-- Looking at the table, we can see no such difference in hours distribution.

ii. Do the two groups you chose to analyze have a different number of reviews?

--Clearly the restaurants with 3+ stars have more reviews

         
iii. Are you able to infer anything from the location data provided between these two groups? Explain.

SQL code used for analysis:

	SELECT name, city, stars, review_count, is_open, category, neighborhood
	FROM business JOIN category ON business.id = category.business_id
	WHERE city = 'Toronto' and category = 'Restaurants'
	ORDER BY stars DESC, review_count DESC
			
-- Not that much can be concluded with only 10 restaurants, but the two ones
-- from Downtown Core have 3 or less stars, the two from Willowdale have
-- 4.0 and 1.5 stars, two restaurants have no neighbourhood associated with.

2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
		
i. Difference 1:
	-- The closed ones have less review_count in average than the
	-- opened ones.          
         
ii. Difference 2:
    --  The avg stars differs a bit from the two groups, too.    
         
         
SQL code used for analysis:

SELECT *
FROM business JOIN category ON business.id = category.business_id
WHERE city = 'Toronto' and category = 'Restaurants'
ORDER BY is_open
	
	
3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
i. Indicate the type of analysis you chose to do:

    -- I want to check wich category of service in a city has the
    -- lowest star ratings, so I know wich part of business the city
    -- have to pay most attention to     
    

ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:
 
 	-- First of all, I have to use category and business table to see the
 	-- worst voted categories and their cities                      
                  
iii. Output of your finished dataset:
         
 +---------------------+-------------------------------+-------------+---------------+---------+
| city                | category                      | nº business |         stars | reviews |
+---------------------+-------------------------------+-------------+---------------+---------+
| Richmond Hill       | Day Spas                      |      1      |           1.5 |       7 |
| Toronto             | Banks & Credit Unions         |      1      |           1.5 |       3 |
| Edinburgh           | Dance Clubs                   |      1      |           2.0 |      11 |
| Toronto             | Medical Centers               |      1      |           2.0 |       5 |
| Scottsdale          | Condominiums                  |      1      |           2.0 |       4 |
| Stuttgart-Vaihingen | Metro Stations                |      1      |           2.0 |       4 |
| Stuttgart-Vaihingen | Public Transportation         |      1      |           2.0 |       4 |
| Stuttgart-Vaihingen | Train Stations                |      1      |           2.0 |       4 |
| Stuttgart-Vaihingen | Transportation                |      1      |           2.0 |       4 |
| Pineville           | Car Rental                    |      1      |           2.0 |       3 |
| Mesa                | Mobile Phone Accessories      |      1      |           2.0 |       3 |
| Oakwood Village     | Hotels                        |      2      |           2.5 |      28 |
| Toronto             | Venues & Event Spaces         |      2      |           2.5 |      19 |
| Mississauga         | Mobile Phones                 |      3      |           2.5 |      17 |
| Las Vegas           | Drugstores                    |      1      |           2.5 |       6 |
| Las Vegas           | Photography Stores & Services |      1      |           2.5 |       6 |
| Toronto             | Financial Services            |      3      | 2.66666666667 |      87 |
| Toronto             | Public Services & Government  |      2      |          2.75 |      12 |
| Phoenix             | Grocery                       |      3      | 2.83333333333 |      27 |
| Las Vegas           | Chicken Wings                 |      2      |           3.0 |     150 |
| Chandler            | Irish                         |      1      |           3.0 |     141 |
| Pittsburgh          | Tex-Mex                       |      1      |           3.0 |     103 |
| Phoenix             | Sports Bars                   |      1      |           3.0 |      60 |
| Stuttgart           | German                        |      2      |           3.0 |      53 |
| Stuttgart           | Beer Garden                   |      1      |           3.0 |      50 |
+---------------------+-------------------------------+-------------+---------------+---------+        

-- As you can see in these table, the Stuttgart-Vaihingen Transportation (Public or not),
-- Train an Metro Stations have 2 stars rating...
-- Collecting more city data about transportation would help in this analysis, and
-- using statistic align methods with the data we could have precisely results about..

-- Toronto Financial servers have a 2.6 rate, and a lot of reviews, maybe
-- doing a sentiment analysis we could confirm people are not happy with
-- Toronto's Financial servers

-- It's important to remember that the data in this work is small,
-- so we can't generalise the data's result to the entire city with good
-- rating of confiability...
-- But we can use these results as an indicator to the need of investigate the
-- cases with more data!!

iv. Provide the SQL code you used to create your final dataset:
	SELECT city,category, COUNT(category) AS 'nº business',
    AVG(stars) as 'stars',
    SUM(review_count) as 'reviews'
	FROM business JOIN category ON business.id = category.business_id
    GROUP BY category
    ORDER BY stars ASC, reviews DESC
--How many rows are in the data_analyst_jobs table?
SELECT COUNT(*)
FROM data_analyst_jobs;

--Write a query to look at just the first 10 rows. 
--What company is associated with the job posting on the 10th row? (ExxonMobil)

SELECT *
FROM data_analyst_jobs
LIMIT 10;

--How many postings are in Tennessee? (21)
--How many are there in either Tennessee or Kentucky? (27)

SELECT COUNT(*) AS jobs_in_tn
FROM data_analyst_jobs
WHERE location='TN';

SELECT COUNT(*) AS jobs_in_tnky
FROM data_analyst_jobs
WHERE location='TN' OR location='KY';

--How many postings in Tennessee have a star rating above 4? (3)

SELECT COUNT(*) AS above_4star
FROM data_analyst_jobs
WHERE location='TN' AND star_rating>4;

--How many postings in the dataset have a review count between 500 and 1000? (151)

SELECT COUNT(*) AS review_btwn
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;

--Show the average star rating for companies in each state. 
--The output should show the state as state and the average rating for the state as avg_rating. 
--Which state shows the highest average rating? (Nebraska)

SELECT AVG(star_rating) AS avg_rating, location
FROM data_analyst_jobs
WHERE star_rating IS NOT NULL
GROUP BY location
ORDER BY avg_rating DESC;

--Select unique job titles from the data_analyst_jobs table. 
--How many are there? (881)

SELECT COUNT(DISTINCT title) AS unique_jobs
FROM data_analyst_jobs;

--How many unique job titles are there for California companies? (230)

SELECT COUNT(DISTINCT title) AS unique_jobs_ca
FROM data_analyst_jobs
WHERE location='CA';

--Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. 
--How many companies are there with more that 5000 reviews across all locations? (40)

SELECT DISTINCT company, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE review_count>5000 AND company IS NOT NULL
GROUP BY company
ORDER BY avg_rating DESC;

--Add the code to order the query in #9 from highest to lowest average star rating. 
--Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? (American Express)
--What is that rating? (4.199)

--Find all the job titles that contain the word ‘Analyst’. 
--How many different job titles are there? (1669)

SELECT title
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';

--How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? (4)
--What word do these positions have in common? (Tableau)

SELECT title
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%' AND title NOT ILIKE '%Analytics%';

--BONUS
--You want to understand which jobs requiring SQL are hard to fill. 
--Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks.

--Disregard any postings where the domain is NULL.
--Order your results so that the domain with the greatest number of hard to fill jobs is at the top.
--Which three industries are in the top 4 on this list? (Internet and Software, Banks and Financial Services, Consulting and Business Services)
--How many jobs have been listed for more than 3 weeks for each of the top 4? (62, 61, 57, 52)

SELECT domain, COUNT(title) AS hard2fill_jobs
FROM data_analyst_jobs
WHERE days_since_posting>21 AND skill ILIKE '%SQL%' AND domain IS NOT NULL
GROUP BY domain
ORDER BY COUNT(title) DESC;



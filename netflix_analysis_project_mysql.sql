CREATE DATABASE netflix_project;
USE netflix_project;
 SHOW TABLES;
 
 

-- Data Cleaning
--

-- Check total records
SELECT COUNT(*) FROM netflix_titles;

-- Check for missing directors
SELECT COUNT(*)
FROM netflix_titles
WHERE director IS NULL;

-- Check for missing countries
SELECT COUNT(*)
FROM netflix_titles
WHERE country IS NULL;

-- Check for missing ratings
SELECT COUNT(*)
FROM netflix_titles
WHERE rating IS NULL;

-- Data Cleaning Observation:
-- The dataset was checked for missing values in key columns such as
-- director, country, and rating.
-- No missing or empty values were identified in these fields,
-- indicating that the dataset was suitable for analysis.

 
 -- Netflix Data Analysis Project

-- Query 1: Movies vs TV Shows

-- Query 2: Top 10 Countries by Content

-- Query 3: Most Common Ratings

-- Query 4: Content Added Over the Years

-- Query 5: Top Directors

-- Query 6: Longest Movies

-- Query 7: Top Genres

-- Query 8: Recent Content Trends

 
SELECT * 
FROM netflix_titles;

-- Query 1: Movies vs TV Shows
SELECT type,
       COUNT(*) AS total_content
FROM netflix_titles
GROUP BY type;
-- Insight:
-- Movies constitute the majority of content available on Netflix.
 
 -- Query 2: Top 10 Countries by Content
SELECT country,
       COUNT(*) AS total_titles
FROM netflix_titles
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_titles DESC
LIMIT 10;
-- Insight:
-- The United States contributes the highest number of titles on Netflix.

-- Query 3: Most Common Ratings
SELECT rating,
       COUNT(*) AS total_titles
FROM netflix_titles
WHERE rating IS NOT NULL
GROUP BY rating
ORDER BY total_titles DESC;
-- Insight:
-- TV-MA is the most common rating, indicating a strong presence of mature audience content.

-- Query 5: Top Directors
SELECT director,
       COUNT(*) AS total_titles
FROM netflix_titles
WHERE director IS NOT NULL
GROUP BY director
ORDER BY total_titles DESC
LIMIT 10;
-- Insight:
-- The directors with the highest number of titles on Netflix demonstrate
-- a strong and recurring contribution to the platform's content library.

-- Query 6: Longest Movies
SELECT title,
       duration
FROM netflix_titles
WHERE type = 'Movie'
  AND duration LIKE '%min%'
ORDER BY CAST(REPLACE(duration, ' min', '') AS UNSIGNED) DESC
LIMIT 10;
-- Insight:
-- The dataset contains several long-duration movies,
-- highlighting Netflix's diverse range of feature-length content.

-- Query 7: Top Genres
SELECT listed_in,
       COUNT(*) AS total_titles
FROM netflix_titles
GROUP BY listed_in
ORDER BY total_titles DESC
LIMIT 10;
-- Insight:
-- Certain genres dominate the Netflix catalog,
-- reflecting audience preferences and content strategy.

-- Query 8: Recent Content Trends
SELECT release_year,
       COUNT(*) AS total_titles
FROM netflix_titles
WHERE release_year >= 2015
GROUP BY release_year
ORDER BY release_year;
-- Insight:
-- Netflix experienced substantial content growth after 2015,
-- indicating increased investment in content production and acquisition.

-- Query 9: Movies Released After 2020
SELECT title,
       release_year
FROM netflix_titles
WHERE type = 'Movie'
  AND release_year > 2020
ORDER BY release_year DESC;
-- Insight:
-- Netflix continues to add a significant number of recent movies,
-- keeping its content library up to date.

-- Query 10: Netflix Content Produced in India
SELECT COUNT(*) AS total_indian_titles
FROM netflix_titles
WHERE country LIKE '%India%';
-- Insight:
-- India contributes a significant number of titles to Netflix's global catalog.

-- Query 11: Indian Movies on Netflix
SELECT title,
       release_year
FROM netflix_titles
WHERE country LIKE '%India%'
  AND type = 'Movie'
ORDER BY release_year DESC;
-- Insight:
-- Netflix hosts a large collection of Indian movies spanning multiple years.


-- Query 12: Indian Content by Release Year
SELECT release_year,
       COUNT(*) AS total_titles
FROM netflix_titles
WHERE country LIKE '%India%'
GROUP BY release_year
ORDER BY release_year;
-- Insight:
-- The availability of Indian content on Netflix has grown steadily over time.

-- Query 13: Search for the Baahubali Movie in Netflix Dataset
SELECT title,
       release_year,
       country
FROM netflix_titles
WHERE title LIKE '%Baahubali%';
-- Insight:
-- No Baahubali titles were found in the current Netflix dataset,
-- indicating that the movie may not be included in this dataset version
-- or is listed under a different title.

-- Query 14: Top 10 TV Shows on Netflix by Release Year
SELECT title,
       release_year
FROM netflix_titles
WHERE type = 'TV Show'
ORDER BY release_year DESC
LIMIT 10;
-- Insight:
-- Netflix continues to expand its TV Show catalog with recently released content.


-- Query 15: Top Indian Directors on Netflix
SELECT director,
       COUNT(*) AS total_titles
FROM netflix_titles
WHERE country LIKE '%India%'
  AND director IS NOT NULL
GROUP BY director
ORDER BY total_titles DESC
LIMIT 10;
-- Insight:
-- A small group of directors contribute a significant share
-- of Indian content available on Netflix.

 -- Query 16: Indian Movies and Their Cast Members
SELECT title,
       cast
FROM netflix_titles
WHERE country LIKE '%India%'
  AND cast IS NOT NULL
LIMIT 20;
-- Insight:
-- Indian Netflix titles feature a diverse range of actors,
-- highlighting the richness of India's film industry.

SELECT   * FROM netflix_titles limit

-- Movie vs Tv Show 
SELECT TOP 2 type, COUNT(DISTINCT show_id) as count_show_id
FROM netflix_titles 
GROUP BY type
ORDER BY COUNT(DISTINCT show_id) desc


--Top 5 countries produce movie/shows
SELECT DISTINCT TOP 5 country,COUNT(type) as count_movie_type  FROM netflix_titles
WHERE country is not null
GROUP BY country
ORDER BY 2 DESC 


--Top 10 years 

SELECT TOP 10 release_year, COUNT(DISTINCT show_id)
FROM netflix_titles
GROUP BY release_year
ORDER BY 2 DESC

--Which director made most movie and shows

SELECT DISTINCT director,type, COUNT(DISTINCT show_id)
from netflix_titles 
GROUP BY director,type
HAVING COUNT(DISTINCT show_id) <20
ORDER BY 3 DESC

--Which cast work more

SELECT DISTINCT TOP 5 cast, COUNT(DISTINCT show_id) as cast_count FROM netflix_titles
WHERE cast is not null
GROUP BY cast
ORDER BY 2 DESC

--How are ratings distributed

SELECT DISTINCT TOP 10 rating, COUNT(DISTINCT show_id) FROM netflix_titles 
GROUP BY rating 
ORDER BY 2 DESC

--How durations are distributed 

SELECT duration, COUNT(Distinct show_id) FROM netflix_titles
GROUP BY duration
ORDER BY 2 DESC

--Which listed_in is most popular per type 

SELECT DISTINCT TOP 5 type, listed_in, COUNT(show_id)
FROM netflix_titles
GROUP BY type,listed_in
ORDER BY COUNT(show_id) DESC

--Release year analysis
Select
min(release_year) as min_release_year,
max(release_year) as max_release_year,
count(distinct release_year) as count_of_release_year,
round(avg(release_year),2) as avg_of_all_release_years,
sum(release_year) as avg_of_all_release_years
from netflix_titles


--joins

select TOP 5
n1.show_id as Show_id1,
n2.type as Show_id2,
n2.title as Showtable2
from netflix_titles n1
join netflix_titles n2 on n1.show_id = n2.show_id

--case statement

select
sum(case when country='United States' then 1 else 0 end) as Shows_in_United_States,
sum(case when country='United Kingdom' then 1 else 0 end) as Shows_in_United_Kingdom,
sum(case when country='South Africa' then 1 else 0 end) as Shows_in_South_Africa
from netflix_titles

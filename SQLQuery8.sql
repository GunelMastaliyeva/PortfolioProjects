--The number of movies
SELECT * FROM Movies;

SELECT COUNT('Movie Title') as movies FROM Movies;
 
 --There are 8 movies.

--What is the average runtime of the movies?

SELECT AVG(Runtime) as avg_runtime FROM Movies;

--The average runtime is 147.

--What is the total budget?

SELECT SUM(Budget) as Total_Budget FROM Movies;

--Total budget is 1355000000.

--Which Movie has highest number of runtime?

SELECT 
                    Movie_Title, 
                    MAX(Runtime) as max_runtime 
FROM Movies
GROUP BY           Movie_Title
ORDER BY max_runtime DESC;

/*According to the query top 3 Movie Titles are: 
Harry Potter and the Chamber of Secrets
Harry Potter and the Goblet of Fire
*/--Harry Potter and the Half-Blood Prince

--Which Movie has highest budget?

SELECT 
Movie_Title, 
MAX(Budget)  AS max_budget
FROM Movies
GROUP BY Movie_Title
ORDER BY max_budget DESC;

--According to the query top three Movie Title per highest budget are:
--Harry Potter and the Half-Blood Prince
--Harry Potter and the Deathly Hallows Part 2
--Harry Potter and the Deathly Hallows Part 1


SELECT 
Movie_Title, 
MAX(Box_Office)  AS max_boxoffice
FROM Movies
GROUP BY Movie_Title
ORDER BY max_boxoffice DESC;

--Top 3 Movie Titles with highest box office are:
--Harry Potter and the Deathly Hallows Part 2
--Harry Potter and the Philosopher's Stone
--Harry Potter and the Deathly Hallows Part 1


--Gender classification

SELECT
COUNT(CASE WHEN Gender= 'Male' THEN 1 ELSE Null END) as male_count,
COUNT(CASE WHEN Gender= 'Female' THEN 1 ELSE NULL END) as female_count
FROM Characters;

--House classification

SELECT 
COUNT(CASE WHEN House= 'Gryffindor' THEN 1 ELSE NULL END) as Gryffindor_cnt,
COUNT(CASE WHEN House= 'Slytherin' THEN 1 ELSE NULL END) as Slytherin_cnt,
COUNT(CASE WHEN House= 'Ravenclaw' THEN 1 ELSE NULL END) as Ravenclaw_cnt,
COUNT(CASE WHEN House= 'Hufflepuff' THEN 1 ELSE NULL END) as Hufflepuff_cnt
FROM Characters;

--Wand classification by character

SELECT DISTINCT Character_Name, Wand_Core
FROM Characters
WHERE Wand_Core is not null
ORDER BY Wand_Core DESC;

--Top characters by line of dialogue

SELECT c.Character_Name,c.House,COUNT(d.Dialogue) AS count_dialogue
FROM  Dialogue d 
JOIN Characters c
ON
c.Character_ID=d.Character_ID
GROUP BY c.Character_Name,c.House
ORDER BY  count_dialogue DESC;

--Dialogue Line by House Classification
SELECT DISTINCT c.House,COUNT(d.Dialogue) AS count_dialogue
FROM  Dialogue d 
JOIN Characters c
ON
c.Character_ID=d.Character_ID
WHERE c.House IS NOT NULL
GROUP BY c.House
ORDER BY  count_dialogue DESC;


--Place classification per place category

SELECT Place_Category,COUNT(Place_Name) AS place_count
FROM Places
GROUP BY  Place_Category
ORDER BY place_count DESC;

--Incantation type by location
SELECT s.Incantation,p.Place_Category FROM Spells s 
JOIN Places p 
ON 
s.Spell_ID=p.Place_ID 

--Incantation types
SELECT 
COUNT(CASE WHEN Spell_Name LIKE '%Charm%' THEN 1 ELSE NULL END) AS charm_count,
COUNT(CASE WHEN Spell_Name LIKE '%Curse%' THEN 1 ELSE NULL END) AS curse_count,
COUNT(CASE WHEN Spell_Name LIKE '%Jinx%' THEN 1 ELSE NULL END) AS jinx_count,
COUNT(CASE WHEN Spell_Name LIKE '%Spell%' THEN 1 ELSE NULL END) AS spell_count
FROM Spells;

SELECT COUNT(DISTINCT Spell_Name)
FROM Spells;



--Most Popular Places in all movies


SELECT TOP 10 p.Place_Name,COUNT(d.Place_ID) as place_cnt
FROM Places p
JOIN Dialogue d 
ON 
p.Place_ID=d.Place_ID
GROUP BY p.Place_Name
ORDER BY place_cnt DESC;

















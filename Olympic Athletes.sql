--
SELECT * 
FROM athlete_events$


SELECT COUNT(ID)
FROM athlete_events$
--271116 athletes participated in olympics.

--I want to find number of Medals in Olympics. 

SELECT Medal,COUNT(Medal) AS count_medal
FROM athlete_events$
GROUP BY Medal
ORDER BY count_medal DESC

--I want to find minimum and maximum age.

SELECT 
     MIN(Age) as min_age,
     Max(Age) as max_age
FROM athlete_events$

--According to the query, minimum age is 10. I would like to find name of the contestant.

SELECT    
          Name,
	      MIN(Age)
FROM athlete_events$ 
WHERE     Age= 10
GROUP BY  Name

--Dimitros Loundras is the youngest person who participated in one of the biggest sport event.

SELECT 
          AVG(Age),
FROM athlete_events$

--Average year of the contestants is 25.

SELECT     
      Name,
	  Age,
CASE WHEN Age BETWEEN 10 AND 17 THEN ' Too Young'
      WHEN Age BETWEEN 18 AND 29 THEN 'Young'
      WHEN Age BETWEEN 30 AND 40 THEN 'Adult'
ELSE 'Old' END AS age_classification
FROM athlete_events$

--Above I used Case Statement for age classification.

SELECT   
          COUNT(Sex)  as count_female
FROM athlete_events$
WHERE     Sex= 'F'

SELECT 
        COUNT(Sex)  as count_male
FROM athlete_events$
WHERE   Sex= 'M'

--According to above query majority of contestants are male. There are 74522 female, 196594 male contestants.

SELECT 
   MAX(Height) as max_height
FROM athlete_events$

SELECT 
      DISTINCT Name,Height
FROM athlete_events$
WHERE Height=226

--The contestant with highest height is Yao Ming. 


--Which of the nations have sent most number of athletes to the Summer Olympics?

SELECT 
         Team,
         COUNT(Team) as count_team
FROM athlete_events$
GROUP BY Team
ORDER BY count_team DESC

--According to the query result Top 3 Countries are United States,France and Great Britain.

--What is the overall trend of the olympyics?

SELECT 
          Year, 
		  COUNT(ID) as count_id
FROM athlete_events$
GROUP BY  Year
ORDER BY  count_id DESC


--Which nations took home the most medals?
SELECT 
         Team,
	     COUNT(Medal) AS count_medal
FROM athlete_events$ 
GROUP BY Team
ORDER BY count_medal DESC

--United State took the most of the medals.

--Top 10 Gold winning Nations.

SELECT 
         TOP 10 Team,
	     COUNT(Medal)  as count_medal
FROM athlete_events$
WHERE    Medal = 'Gold' 
GROUP BY Team
ORDER BY count_medal DESC 

--Top 10 Silver Medal Earning Nation

SELECT 
         TOP 10 Team,COUNT(Medal)  as count_medal
FROM athlete_events$
WHERE    Medal = 'Silver' 
GROUP BY Team
ORDER BY count_medal DESC 

--Top 10 Bronze Medal Earning Nation
SELECT 
         TOP 10 Team,COUNT(Medal)  as count_medal
FROM     athlete_events$
WHERE    Medal = 'Bronze' 
GROUP BY Team
ORDER BY count_medal DESC 

--We can see from above that, United States is leading in three category.

--Top 3 male performers in USA.

SELECT  
      DISTINCT Name,
      Sex,Team,Medal,
      COUNT(Medal) as count_medal
FROM athlete_events$
WHERE Medal= 'Gold'
      AND Team = 'United States'
GROUP BY Name,Sex,Team,Medal
ORDER BY count_medal DESC

--According to above query, Michael Fred Phelps, II,Raymond Clarence "Ray" Ewry,Mark Andrew Spitz are top performers.

-- Which season has highest number of Gold medals?

SELECT 
           Season,Medal,
		   COUNT(Medal) AS count_medal
FROM       athlete_events$
WHERE      Medal= 'Gold'
GROUP BY   Season,Medal
ORDER BY   count_medal DESC

--According to above query,in Summer number of gold medals are higher in comparison with Winter.

--City Frequency 

SELECT DISTINCT City,COUNT(ID) as count
FROM athlete_events$
GROUP BY City
ORDER BY count DESC

--Top 3 Cities are; London,Athina,Sydney

--Which Sports has higest frequency?

SELECT DISTINCT Sport,COUNT(ID) AS count
FROM athlete_events$
GROUP BY Sport 
ORDER BY count DESC

--Athletics,Gymnastics,Swimming

SELECT DISTINCT Event,COUNT(*) AS count
FROM athlete_events$
GROUP BY Event 
ORDER BY count DESC

--Top 3 Events:Football Men's Football,Ice Hockey Men's Ice Hockey,Hockey Men's Hockey.


SELECT Medal,COUNT(Medal) AS count_medal
FROM athlete_events$
GROUP BY Medal
ORDER BY count_medal DESC

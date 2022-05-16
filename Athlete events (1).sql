-- Databricks notebook source
SELECT * FROM athlete_events

-- COMMAND ----------

SELECT Medal,COUNT(Medal) AS count_medal
FROM athlete_events
WHERE Medal <> 'NA'
GROUP BY Medal
ORDER BY count_medal DESC

-- COMMAND ----------

SELECT 
     MIN(Age) as min_age
FROM athlete_events

-- COMMAND ----------

SELECT    
          Name,
	      MIN(Age)
FROM athlete_events
WHERE     Age= 10
GROUP BY  Name

-- COMMAND ----------

SELECT 
          ROUND(AVG(Age),2)
FROM athlete_events

-- COMMAND ----------

SELECT     
      Name,
	  Age,
CASE WHEN Age BETWEEN 10 AND 17 THEN ' Too Young'
      WHEN Age BETWEEN 18 AND 29 THEN 'Young'
      WHEN Age BETWEEN 30 AND 40 THEN 'Adult'
ELSE 'Old' END AS age_classification
FROM athlete_events

-- COMMAND ----------


SELECT   
          COUNT(Sex)  as count_female
FROM athlete_events
WHERE     Sex= 'F'

-- COMMAND ----------

SELECT 
       COUNT(Sex) as count_male
     
FROM athlete_events
WHERE sex = 'M' 


-- COMMAND ----------


SELECT 
      DISTINCT Name,Height
FROM athlete_events
WHERE Height=226

-- COMMAND ----------

SELECT 
         Team,
         COUNT(Team) as count_team,
         COUNT(Medal)
FROM athlete_events
WHERE Medal = 'Gold' and Medal <> 'NA'
GROUP BY Team
ORDER BY count_team DESC
LIMIT 10

-- COMMAND ----------


SELECT 
          Year, 
		  COUNT(ID) as count_id
FROM athlete_events
GROUP BY  Year
ORDER BY  count_id DESC
LIMIT 10

-- COMMAND ----------

SELECT 
         Team,
	     COUNT(Medal) AS count_medal
FROM athlete_events
GROUP BY Team
ORDER BY count_medal DESC
LIMIT 10

-- COMMAND ----------

SELECT Team,COUNT(Medal)  as count_medal
FROM athlete_events
WHERE    Medal = 'Gold' 
GROUP BY Team
ORDER BY count_medal DESC 
LIMIT 10

-- COMMAND ----------


SELECT 
Team,COUNT(Medal)  as count_medal
FROM athlete_events
WHERE    Medal = 'Silver' 
GROUP BY Team
ORDER BY count_medal DESC 
LIMIT 10

-- COMMAND ----------

SELECT 
Team,COUNT(Medal)  as count_medal
FROM     athlete_events
WHERE    Medal = 'Bronze' 
GROUP BY Team
ORDER BY count_medal DESC 
LIMIT 10

-- COMMAND ----------

SELECT  
      DISTINCT Name,
      Sex,Team,Medal,
      COUNT(Medal) as count_medal
FROM athlete_events
WHERE Medal= 'Gold'
      AND Team = 'United States'
GROUP BY Name,Sex,Team,Medal
ORDER BY count_medal DESC

-- COMMAND ----------

SELECT 
           Season,Medal,
		   COUNT(Medal) AS count_medal
FROM       athlete_events
WHERE      Medal= 'Gold'
GROUP BY   Season,Medal
ORDER BY   count_medal DESC


-- COMMAND ----------

SELECT DISTINCT City,COUNT(ID) as count
FROM athlete_events
GROUP BY City
ORDER BY count DESC
LIMIT 10

-- COMMAND ----------

SELECT DISTINCT Sport,COUNT(ID) AS count
FROM athlete_events
GROUP BY Sport 
ORDER BY count DESC

-- COMMAND ----------

SELECT DISTINCT Event,COUNT(*) AS count
FROM athlete_events
GROUP BY Event 
ORDER BY count DESC
LIMIT 10

-- COMMAND ----------

SELECT Year,
count(case when Sex='M' then 1 end) as male_cnt,
 count(case when Sex='F' then 1 end) as female_cnt
FROM athlete_events
GROUP BY Year

-- COMMAND ----------

SELECT Games,
AVG(CASE WHEN Sex = 'F' THEN null ELSE age END) as AVG_AGE_FEMALE,
AVG(CASE WHEN Sex = 'M' THEN null ELSE age END) as AVG_AGE_MALE
FROM athlete_events
GROUP BY Games;

-- COMMAND ----------

SELECT Age,COUNT(Medal)
FROM athlete_events
WHERE Medal = 'Gold'
GROUP BY Age

-- COMMAND ----------

SELECT Sport,COUNT(Medal)
FROM athlete_events
WHERE Medal = 'Gold'
GROUP BY Sport

-- COMMAND ----------

SELECT Sex, Year, COUNT(Medal)
FROM athlete_events
WHERE Sex= 'F'
GROUP BY Sex, Year

-- COMMAND ----------

SELECT Year,COUNT(*) AS count_athlets,AVG(Age) as avg_age
FROM athlete_events 
WHERE Sex= 'F'
GROUP BY Year

-- COMMAND ----------

SELECT Sport,Sex,COUNT(Medal)
FROM athlete_events
WHERE Sex= 'F' and Medal= 'Gold'
GROUP BY Sport,Sex

-- COMMAND ----------

SELECT Sport,Sex,COUNT(Medal)
FROM athlete_events
WHERE Sex= 'M' and Medal= 'Gold'
GROUP BY Sport,Sex

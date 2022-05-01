--INTRODUCTION
--The World Happiness Report is documented to evaluate the countries by their happiness level.

--ASK PHASE
--Which Country or Region has highest happiness score between 2018-2019? Top 3 Countries.
--Which Country has highest GDP Per Capita between 2018-2019?
--Top 3 unhappy countries.

 --ANALYSE PHASE
 
 SELECT TOP 10 * FROM [2018]
 SELECT TOP 10 * FROM [2019]


DROP TABLE IF EXISTS happiness_data_2018

CREATE TABLE   happiness_data_2018
(Overall_rank tinyint not null,
Country_or_region nvarchar(50) not null,
Score FLOAT not null,
GDP_per_capita FLOAT not null,
Social_support FLOAT not null,
Healthy_life_expectancy FLOAT not null,
Freedom_to_make_life_choices FLOAT not null,
Generosity FLOAT not null,
Perceptions_of_corruption FLOAT)

INSERT into happiness_data_2018
SELECT * from [2018] 

DROP TABLE IF EXISTS happiness_data_2019

CREATE TABLE   happiness_data_2019
(Overall_rank tinyint not null,
Country_or_region nvarchar(50) not null,
Score FLOAT not null,
GDP_per_capita FLOAT not null,
Social_support FLOAT not null,
Healthy_life_expectancy FLOAT not null,
Freedom_to_make_life_choices FLOAT not null,
Generosity FLOAT not null,
Perceptions_of_corruption FLOAT)

INSERT into happiness_data_2019
SELECT * from [2019] 

SELECT * FROM happiness_data_2018
SELECT * FROM happiness_data_2019

DROP TABLE IF EXISTS total_data

CREATE TABLE   total_data
(Overall_rank tinyint not null,
Country_or_region nvarchar(50) not null,
Score FLOAT not null,
GDP_per_capita FLOAT not null,
Social_support FLOAT not null,
Healthy_life_expectancy FLOAT not null,
Freedom_to_make_life_choices FLOAT not null,
Generosity FLOAT not null,
Perceptions_of_corruption FLOAT)

INSERT INTO total_data 
SELECT * FROM happiness_data_2018 as a join happiness_data_2019 as b on a.Overall_rank=b.Overall_rank

 WITH  CTE_table as(
 SELECT * FROM [2018]
 UNION ALL
  SELECT * FROM [2019] )

  SELECT TOP 5 Country_or_region,MAX(Score) as max_score,MAX(GDP_per_capita) as max_gdp
  FROM CTE_table
  GROUP BY Country_or_region
  ORDER BY max_score DESC, max_gdp DESC

  --Top 5 countries that have max score and gdp are Finland,Denmark,Norway,Iceland,Netherlands in 2018-2019.


  WITH CTE_table as(
  SELECT * FROM [2018]
  UNION ALL
  SELECT * FROM [2019])

  SELECT TOP 5 Country_or_region,Generosity,Perceptions_of_corruption,MIN(Score) as min_score,MIN(GDP_per_capita)as min_gdp
  FROM CTE_table
  GROUP BY Country_or_region,Generosity,Perceptions_of_corruption
  ORDER BY min_score , min_gdp 

  --According to above query, 5 top countries that has min happiness score and gdp are: South Sudan,Burundi,Central African Republib,Afganistan,Tanzania.
--According to above two queries, majority of countries that have highest happiness score and gdp are in Europe.





SELECT * FROM [Portfolio Project].dbo.CovidDeath
ORDER BY 3,4


SELECT * FROM [Portfolio Project].dbo.CovidVaccinations
ORDER BY 3,4

SELECT location,date,total_cases,new_cases,total_deaths,population
FROM [Portfolio Project].dbo.CovidDeath
ORDER BY 1,2

--Total Cases vs Total Deaths
SELECT location,date,total_cases,total_deaths,
ROUND((total_deaths/total_cases)*100,2) as DeathPercentage
FROM [Portfolio Project].dbo.CovidDeath
WHERE location like '%states%'
ORDER BY 1,2


--Total Cases vs Population 

SELECT location,date,total_cases,population,
ROUND((total_cases/population)*100,3) as PercentagePopulationInfected
FROM [Portfolio Project].dbo.CovidDeath
WHERE location like '%states%'
ORDER BY 1,2

--Countries with highest Infection Rate compared to Population


SELECT location,MAX(total_cases) as HighestInfectionCount,population,
MAX((total_cases/population))*100 as PercentPopulationInfected
FROM [Portfolio Project].dbo.CovidDeath
--WHERE location like '%states%'
GROUP BY location,population
ORDER BY PercentPopulationInfected DESC

--Countries with Highest Death Count Per population
SELECT location,MAX(cast(total_deaths as int)) as TotalDeathsCount 
FROM [Portfolio Project].dbo.CovidDeath
--WHERE location like '%states%'
WHERE continent is not null
GROUP BY location
ORDER BY TotalDeathsCount DESC

--Continents with Highest Death Count  Per Population
SELECT continent,MAX(cast(total_deaths as int)) as TotalDeathsCount 
FROM [Portfolio Project].dbo.CovidDeath
--WHERE location like '%states%'
WHERE continent is not  null
GROUP BY continent
ORDER BY TotalDeathsCount DESC

--Global Numbers

SELECT  SUM(new_cases) as total_cases,SUM(cast(new_deaths as int)) as total_deaths,
SUM(cast(new_deaths as int))/SUM(new_cases)*100 as DeathPercentage
FROM [Portfolio Project].dbo.CovidDeath
--WHERE location like '%states%'
WHERE continent is not null
--GROUP BY date
ORDER BY 1,2

--Total Population vs vaccinations

SELECT dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations,
SUM(CONVERT ( bigint,vac.new_vaccinations)) OVER (Partition by dea.location ORDER BY dea.location,dea.date) 
as RollingPeopleVaccinated,
--(RollingPeopleVaccinated/Population)*100
FROM [Portfolio Project].dbo.CovidDeath dea
JOIN [Portfolio Project].dbo.CovidVaccinations vac
ON dea.location=vac.location and 
dea.date=vac.date
WHERE dea.continent is not null
 ORDER BY 1,2,3


 --CTE 
 WITH PopVac (continent,location,date,population,new_vaccinations,RollingPeopleVaccinated)
 as (SELECT dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations,
SUM(CONVERT ( bigint,vac.new_vaccinations)) OVER (Partition by dea.location ORDER BY dea.location,dea.date) 
as RollingPeopleVaccinated
--(RollingPeopleVaccinated/Population)*100
FROM [Portfolio Project].dbo.CovidDeath dea
JOIN [Portfolio Project].dbo.CovidVaccinations vac
ON dea.location=vac.location and 
dea.date=vac.date
WHERE dea.continent is not null)
 --ORDER BY 1,2,3
 SELECT *,(RollingPeopleVaccinated/Population)*100 FROM PopVac

 --Temp Table 
 CREATE Table #PercentPopulationVaccinated 
 (
 continent  nvarchar(255),
 location nvarchar (255),
 date datetime,
 population numeric,
 new_vaccinations numeric,
 RollingPeopleVaccinated  numeric
 ) 
 INSERT INTO #PercentPopulationVaccinated
 SELECT dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations,
SUM(CONVERT ( bigint,vac.new_vaccinations)) OVER (Partition by dea.location ORDER BY dea.location,dea.date) 
as RollingPeopleVaccinated
--(RollingPeopleVaccinated/Population)*100
FROM [Portfolio Project].dbo.CovidDeath dea
JOIN [Portfolio Project].dbo.CovidVaccinations vac
ON dea.location=vac.location and 
dea.date=vac.date
WHERE dea.continent is not null
 --ORDER BY 1,2,3

 SELECT *,(RollingPeopleVaccinated/Population)*100 FROM #PercentPopulationVaccinated


 --View 

 CREATE VIEW PercentPopulationVaccinated as 
 SELECT dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations,
SUM(CONVERT ( bigint,vac.new_vaccinations)) OVER (Partition by dea.location ORDER BY dea.location,dea.date) 
as RollingPeopleVaccinated
--(RollingPeopleVaccinated/Population)*100
FROM [Portfolio Project].dbo.CovidDeath dea
JOIN [Portfolio Project].dbo.CovidVaccinations vac
ON dea.location=vac.location and 
dea.date=vac.date
WHERE dea.continent is not null
 --ORDER BY 1,2,3

 SELECT * FROM PercentPopulationVaccinated

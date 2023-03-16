-- PRACTICA EX.3

SELECT film, director, year, actor FROM jamesbond
WHERE year < 2000 AND director IN ('Lewis Gilbert', 'Martin Campbell') and actor !='Roger Moore';

-- PRACTICA EX.4

SELECT country AS País, continent AS Continente, adult_literacy_rate AS 'Alfabetizacion', population_in_urban_areas AS 'Areas Urbanas'
FROM world_health_org
WHERE
	continent = 'Africa' AND adult_literacy_rate BETWEEN 25 AND 75
   	 OR continent = 'Europe' and population_in_urban_areas < 50
ORDER BY 1

-- PRACTICA EX.5

SELECT country AS País, continent AS Continente, gross_income_per_capita AS PIB
FROM world_health_org
WHERE
	continent = 'Africa' 
ORDER BY 3 DESC
LIMIT 5

-- PRACTICA EX.6

SELECT movie_title as pelicula, country AS pais, director_me As director, imdb_score AS puntuacion, title_year AS año from imdb_movies
WHERE title_year > 1979 AND country != 'USA'
ORDER BY puntuacion DESC
LIMIT 10

-- PRACTICA EX. 7.2

SELECT duration FROM LoanData
WHERE duration BETWEEN 12 and 24

-- PRACTICA EX. 7.3

SELECT personal_status FROM LoanData
WHERE personal_status = 'male single'

-- PRACTICA EX. 7.4

SELECT credit_history FROM LoanData
WHERE credit_history IN ('existing paid', 'all paid')

-- PRACTICA EX. 7.5

SELECT existing_credits FROM LoanData
WHERE existing_credits > 3

-- PRACTICA EX. 7.6

SELECT purpose FROM LoanData
WHERE purpose = 'business'

-- PRACTICA EX. 7.7

SELECT purpose FROM LoanData
WHERE purpose = 'repairs'

-- PRACTICA EX. 7.8

SELECT housing FROM LoanData
WHERE housing = 'own'

-- PRACTICA EX. 7.9

SELECT age FROM LoanData
WHERE age > 60

-- PRACTICA EX. 7.10

SELECT age FROM LoanData
WHERE age BETWEEN 35 and 50

-- PRACTICA EX. 7.11

SELECT class FROM LoanData
WHERE class = 'good'

-- PRACTICA EX. 7.12

SELECT class FROM LoanData
WHERE class = 'bad'
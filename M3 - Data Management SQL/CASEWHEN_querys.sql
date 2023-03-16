-- Query 0

SELECT country, continent, adult_literacy_rate, population_in_urban_areas from world_health_org
where ( continent = 'Africa' and adult_literacy_rate BETWEEN 25 and 75  )
OR ( continent = 'Europe' and population_in_urban_areas < 50 )

-- Query 1

SELECT name, publisher, year, eu_sales, na_sales, other_sales from videogames_games
where year >= 1995 and publisher = 'Nintendo' and name != 'Donkey Konga 2'
and EU_sales BETWEEN 0 and 0.32 and NA_sales BETWEEN 0 and 0.31
AND other_sales BETWEEN 0 and 0.3
ORDER BY year
limit 1

-- Query 2

SELECT name, eye_color, height, homeworld,
CASe
	WHEn height >= 200 THEN 'grande'
    ELSE 'pequeño'
END as tamaño
from star_wars_characters_2
where homeworld in ('Chandrila', 'Stewjon', 'Tatooine') and eye_color != 'red'
order by height ASC

-- Query 3

SELECT rank, company, sector, industry, profits,
CASE
	when profits > 1000 THEN 'rentable'
    ELSE 'no rentable'
end as rentabilidad
FROM fortune
WHERE company != 'Citigroup' AND sector = 'Financials' and industry = 'Diversified Financials'
and rank <= 100
order by rank
LIMIT 100

-- Query 4

SELECT mes, paro_hombre_edad_25__45, paro_mujer_edad_25__45, total_paro_registrado, municipio,
CASE
	when total_paro_registrado > 1000 THEN 'mucho'
    when total_paro_registrado BETWEEN 500 and 1000 THEN 'medio'
    ELSE 'poco'
end as comparacion_de_paro
FROM gobierno_paro
where mes = 'Enero de 2018' and paro_hombre_edad_25__45 BETWEEN 20 and 1100
and paro_mujer_edad_25__45 BETWEEN 20 and 1100
order by total_paro_registrado DESC

-- Query 5

SELECT name, homeworld, height FROM star_wars_characters_2
where homeworld LIKE 'T%' and homeworld not like '%d' 
and height > 200 and species != 'Droid'

-- Query 6

select name, platform_code, year, na_sales, eu_sales, jp_sales,
CASE
	when na_sales > eu_sales and na_sales > jp_sales THEN 'NA'
    when eu_sales > na_sales AND eu_sales > jp_sales then 'EU'
    ELSE 'JP'
end as best_selling_region
FROM videogames_games
where platform_code = 'DS'
ORDER BY year

-- Query 7

select movie_title, duration, country,
CASE
	when duration BETWEEN 120 and 200 THEN 'SON MUY LARGAS'
	ELSE 'son cortas'
end as personal_opinion
from imdb_movies
WHERE country = 'USA'
order by duration DESC

-- Query 8

select mes, municipio, paro_mujer_edad___45, paro_sin_empleo_anterior from gobierno_paro 
WHERE paro_sin_empleo_anterior = 0 and mes = 'Marzo de 2018'
order by municipio DESC

-- Query 9

select movie_title, country, title_year, color, movie_facebook_likes,
CASE
	when movie_facebook_likes > 10000 THEN 'Muy Buena'
    when movie_facebook_likes BETWEEN 5000 and 10000 THEN 'Buena'
    ELSE 'Regular'
end as clasificacion_segun_fb
from imdb_movies
where title_year BETWEEN 2000 and 2010 and country = 'USA' and color = 'Color'
limit 50
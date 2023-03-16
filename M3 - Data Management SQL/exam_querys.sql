-- Query 0

select console_name, units_sold_million,
CASE
	when units_sold_million > 60 then 'Alto'
    when units_sold_million BETWEEN 30 and 60 then 'Medio'
    else 'Bajo'
end as level_of_sale
FROM videogames_consoles
where console_name NOT like '3%'
order by console_name

-- Query 1

select artist, album, release_year, duration,
CASE
	when duration > 70 THEN 'Insoportable'
    when duration BETWEEN 50 and 70 then 'soportable'
    when duration = 50 THEN 'adecuado'
    else 'ideal'
END AS paciencia_publico
from rolling_top_albums_1
where album like '%W%' and release_year BETWEEN 1975 and 2001
order by paciencia_publico

-- Query 2

select country, gross_income_per_capita, adolescent_fertility_rate, population_in_thousands,
CASE
	WHEN gross_income_per_capita > 10000 AND adolescent_fertility_rate < 20 THEN  'Desarrollados'
    when gross_income_per_capita < 5000 and adolescent_fertility_rate > 50 then 'En via de desarrollo'
    else 'Error en la matriz' end as grado_desarrollo
from world_health_org
where gross_income_per_capita NOTNULL and country not like '%a' and population_in_thousands > 3000
and grado_desarrollo != 'Error en la matriz'

-- Query 3

select paro_agricultura, paro_industria, paro_construcci__n, paro_servicios,total_paro_registrado,
CASE
	when total_paro_registrado > 1000 then 'alto'
    when total_paro_registrado BETWEEN 500 and 1000 then 'medio'
    when total_paro_registrado < 500 then 'bajo'
    else 'Sin datos' end as comparativa_paro
from gobierno_paro
where mes = 'Enero de 2018' 
order by comparativa_paro

-- Query 4

select name, year, publisher,
CASE
	WHEN publisher like '%Sony%' THEN 'SONY'
    else 'otros'
end as 'publicada_por'
FROM videogames_games
where platform_code = 'PS' and name not like '%Jampack%'
order by year DESC

-- Query 5

select COUNT (DISTINCT name) from star_wars_characters_2
where hair_color like 'b%' and height > 140 and homeworld = 'Tatooine' and gender = 'female';
-- ejecutar por separado
select name, hair_color, height, gender, homeworld,
CASE 
	when gender = 'female' and homeworld = 'Tatooine' THEN 'Mujer de Tatooine'
    else 'Otros' end as mujeres_de_tatooine
from star_wars_characters_2
where name like 'B%' and height > 140;

-- Query 6

select movie_title, gender, imdb_score, num_voted_users,
CASE
	WHEN num_voted_users > 7 THEN 'top'
    WHEN num_voted_users BETWEEN 5 AND 7 THEN 'se puede ver'
    ELSE 'no pierdas el tiempo'
END AS sincera_opinion
from imdb_movies
WHERE gender NOT LIKE '%western%'
order by imdb_score desc
LIMIT 10

-- Query 7

select name, hair_color, eye_color, height, homeworld,
CASE
	when species = 'Droid' then 'neutral' -- Lee esta primero y la tiene en cuenta para las demás
	when eye_color = 'blue' then 'bueno'
    when eye_color = 'red' then 'malo'
    else 'sin datos' end as 'Lao de la fuerza'
from star_wars_characters_2
where hair_color != 'blond' and height <= 200 and homeworld != 'Kashyyyk'

-- Query 8

select rank, company, employees, profits,
CASE
	WHEn employees > 500 THEN 'Empresa grande'
    when employees BETWEEN 50 and 500 THEN 'Empresa mediana'
    else 'Empresa pequeña' END as categoria_empresa,  
CASE
	when profits > 0 then 'Con beneficios'
    ELSE 'Con pérdidas' END as Rentabilidad
from fortune
where employees NOTNULL and profits NOTNULL and categoria_empresa = 'Empresa mediana'
ORDER BY rank

-- Query 9

select name, species, mass,
CASE
	WHEN mass > 1000 THEN 'Comer más lechuga'
    when mass BETWEEN 90 and 1000 then 'Esta fuertote'
    else 'Necesita comer más'
end as recomendacion_abuela
from star_wars_characters_2
where species in ('Human', 'Hutt', 'Wookie', 'Ewok') and mass NOTNULL
Order by mass desc
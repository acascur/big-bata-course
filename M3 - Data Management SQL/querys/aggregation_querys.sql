-- Query 0

select 
	case 
    	when artist like '%God%' then 'GOD'
        WHEN artist like '%Death%' then 'DEATH'
        WHEN artist like '%Black%' then 'BLACK'
        end as artist_keyword,
	count(DISTINCT artist) as num_artist --para no contar al mismo artista dos veces
from rolling_top_albums_1
group by artist_keyword
having artist_keyword notnull
ORDER by artist_keyword desc

-- Query 1

select continent, ROUND (AVG(gross_income_per_capita), 2) AS average_PIB
	, SUM(population_in_thousands) as total_population
    , count(country) from world_health_org
group by continent

-- Query 2

select homeworld, COUNT(name) AS num_personajes FROM star_wars_characters_2
WHERE homeworld NOTNULL AND homeworld NOT LIKE 'NA' and not like ''
GROUP BY homeworld
ORDER BY num_personajes desc

-- Query 3

select actor, round (sum(bond_actor_salary), 1) as salario from jamesbond
WHERE bond_actor_salary notnull 
group by actor
having salario > 0
order by salario desc

-- Query 4

select director, round(sum(box_office), 0) as facturacion from jamesbond
group by director
having facturacion > 1500
order by facturacion desc

-- Query 5

select sub_metal_genre, COUNT(album) as num_album from rolling_top_albums_1
group by sub_metal_genre
having num_album >= 10
order by num_album DESC

-- Query 6

SELECT
    strftime('%m', date) as mes, 
    strftime('%Y', date) as año,
    round(avg(open)) as cotizacion_media,
    round(avg(volume_usd)) as volumen_operacion
from bitcoin_daily_rates_formatdate
WHERE año >= '2016'
group by año, mes --ordenar por año y luego por mes
order by año

-- Query 7

select 
	date as fecha
    , strftime('%W', date) as semana 
    , MAX(high) as cotizacion
from amazon_stocks_formatdate

-- Query 8

select country, count(movie_title) AS num_peliculas from imdb_movies
where color != 'Color' and country != '' --pa quitar el pais en blanco
group by country
HAVING COUNT(movie_title) >= 2
order by COUNT(movie_title) DESC
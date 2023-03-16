-- Query 0

select 
	CASE
		when duration > 100 THEN 'ppelis de mas de 100 min'
    	when duration BETWEEN 60 and 100 THEN 'pelis de entre 60 y 100 min'
    	when duration < 60 tHEN 'pelis de menos de 60'
        else 'duración desconocida' end as duracion,
     count(movie_title) as num_peliculas
from imdb_movies
group by duracion
order by num_peliculas desc

-- Query 1

select country, count(movie_title) AS num_peliculas from imdb_movies
where color != 'Color' and country != '' --pa quitar el pais en blanco
group by country
HAVING COUNT(movie_title) >= 2
order by COUNT(movie_title) DESC

-- Query 2

select movie_title, gender, duration from imdb_movies
where gender like '%Action%' and duration < 60

-- Query 3

select 
	date as día, min(high) as cotización_alza
    , round((open + high + low + close)/4) as cotizacion_media 
from bitcoin_daily_rates_formatdate
where strftime('%Y', date) = '2018'

-- Query 4

select  
    case 
        when gender like '%Action%' then 'accion' 
        when gender like '%Crime%' then 'crimen' 
        when gender like '%Comedy%' then 'comedia' 
        when gender like '%Drama%' then 'drama' 
        when gender like '%Romance%' then 'amor' 
        else 'otros' end as genero,
    count(movie_title) as num_pelis,
    CASE when max(num_voted_users) then movie_title end as peli_más_votada,
    num_voted_users
from imdb_movies
group by genero
HAVING genero != 'otros'
order by num_pelis desc

-- Query 5

BAR-select 
	homeworld as label, eye_color,
	count (name) AS num_personajes
from star_wars_characters_2
where eye_color != 'unknown' and homeworld != 'NA'
group by eye_color, homeworld
having num_personajes >1
order by num_personajes desc

-- Query 6

select director, actor,
	case 
    	when director ='John Glen' and actor = 'Timothy Dalton' then 'pelis chulis'
        else 'pelis horribles'end as opinion,
    sum(budget) as presupuesto_total
from jamesbond
group by opinion
Having opinion = 'pelis chulis'
-- de forma más resumida
select director, actor, sum(budget) as presupuesto_total from jamesbond
where director ='John Glen' and actor = 'Timothy Dalton'
-- pero si nos piden identificar las películas

-- Query 7

select film, director, actor, budget as presupuesto_total from jamesbond
where director ='John Glen' and actor = 'Timothy Dalton'

-- Query 8

select personal_status,
	count(case when class = 'good' then 'concedido' end) as num_concedidos,
    count(case when class = 'bad' then 'concedido' end) as num_rechazados
from LoanData
group by personal_status

-- Query 9

select personal_status,
	SUM(case when class = 'good' then credit_amount end) as Otorgados,
    SUM(case when class = 'bad' then credit_amount end) as Rechazados
from LoanData
group by personal_status
-- nos pide el like en fb entonces el campo es actor_1_facebook_likes
select 
	title_year, movie_title, 
	actor_1_facebook_likes, 
    imdb_score, gender 
from imdb_movies
where title_year < 2012 and actor_1_facebook_likes > 10000 
and imdb_score >= 8 and gender LIKE '%Action%'

-- Query 10

select 
	movie_title as pelicula, gender as genero
	, budget as presupuesto, gross as recaudacion
    , (gross - budget) as beneficios FROM imdb_movies
where budget NOTNULL and gross NOTNULL and beneficios > 0 -- yo voy a tener en cuenta que tenga beneficios
order by budget desc --ordenar por beneficios sería ORDER BY beneficios
limit 20
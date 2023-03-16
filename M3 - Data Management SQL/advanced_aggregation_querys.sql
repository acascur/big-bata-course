-- Query 0

SELECT
	sum(CASE when sector='Technology' then revenue end) as revenue_technology,
    sum(CASE when sector='Energy' then revenue end) as revenue_energy,
    sum(CASE when sector='Media' then revenue end) as revenue_media
from fortune

-- Query 1

SELECT 
	CASE 
		when gender like '%Action%' then 'accion'
		when gender not like '%Action%' then 'resto' 
        ELSE 'Ni idea' end As genero 
	, COUNT(movie_title) AS total_movies 
    , ROUND(avg(imdb_score), 2) AS valoracion_media
from imdb_movies
group by genero

-- Query 2

select 
	channelgrouping,
    	sum(case when devicecategory = 'mobile' then sessions end) as mobile_sessions,
        sum(case when devicecategory = 'desktop' then sessions end) as desktop_sessions,
        sum(case when devicecategory = 'tablet' then sessions end) as tablet_sessions,
    	sum(sessions) as total_sessions
from google_analytics_formatdate
where strftime('%Y %m', date) = '2019 10' 
group by channelgrouping
HAVING desktop_sessions NOTnull
order by total_sessions desc
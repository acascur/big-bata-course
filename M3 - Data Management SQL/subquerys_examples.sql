-- Query 0

with my_subquery as ( 
  	select sector, sum(revenue) as total_revenue 
	from fortune
  	group by sector )
SELECT avg(total_revenue) as avg_sector_revenue from my_subquery 

-- Query 1

with sum_peli as ( 
  	select COUNT(film) as num_peli , director from jamesbond
	GROUP BY director )  
select avg(num_peli) as avg_2_num_peli from sum_peli
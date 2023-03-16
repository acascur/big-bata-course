select 
	c.console_name, 
	c.first_retail_availability, 
    round(sum((g.NA_sales + g.EU_sales + g.JP_sales + g.other_sales))) as global_games_sales
	from videogames_consoles as c
		inner join videogames_games as g on c.platform_code = g.platform_code
    where c.discontinued not like '' and g.year >= 2000
group by c.platform_code
order by global_games_sales desc
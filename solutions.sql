-- Enter solutions here --
select count(1) from routes 
where origin_id in (select id from airports where city = 'New York') 
and dest_id in (select id from airports where city='Paris');


select * 
from airlines 
where id in (
  select distinct(airline_id) 
  from routes 
  where origin_id in (select id from airports where city = 'New York') 
  and dest_id in (select id from airports where city='Paris')
)


select a.city, count(1) 
from (select routes.dest_id ,airports.city 
      from (select * 
            from routes 
            where origin_id in (select id from airports where city = 'New York')) routes
left join airports on routes.dest_id = airports.id
) a
group by 1
order by 2 desc

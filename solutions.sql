-- Enter solutions here --

-- 1. You should now have seeded three tables with flight data.
-- Find out how many flights go from NYC to Paris
SELECT * 
 FROM routes 
 JOIN airports AS origin
 ON routes.origin_id = origin.id 
 JOIN airports AS final
 ON routes.dest_id = final.id
 WHERE origin.city = 'New York'
 AND final.city = 'Paris';


--  Do this so that just the number appears as the result of only one SQL statement
 SELECT count(*) 
 FROM routes 
 JOIN airports AS origin
 ON routes.origin_id = origin.id 
 JOIN airports AS final
 ON routes.dest_id = final.id
 WHERE origin.city = 'New York'
 AND final.city = 'Paris';

-- Which airlines travel from NYC to Paris?
 SELECT DISTINCT ON (airline_id) * 
 FROM routes 
 JOIN airports AS origin
 ON routes.origin_id = origin.id 
 JOIN airports AS final
 ON routes.dest_id = final.id
 JOIN airlines
 ON routes.airline_id = airlines.id
 WHERE origin.city = 'New York'
 AND final.city = 'Paris';

-- Find all the flights that leave NYC.  Give me a list of how many go to each destination city.
 SELECT final.city, COUNT(final.city)
 FROM routes 
 JOIN airports AS origin
 ON routes.origin_id = origin.id 
 JOIN airports AS final
 ON routes.dest_id = final.id
 JOIN airlines
 ON routes.airline_id = airlines.id
 WHERE origin.city = 'New York'
 GROUP BY final.city;
-- Enter solutions here --

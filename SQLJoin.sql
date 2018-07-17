/*
Saayed Alam
Data Science Bridge Workshop
Week 2 Assignment
*/ 

#1 Write a SELECT statement that shows for all of the flights during the period February 14th to February 17th for each of the four planes above: ‘N125UW’,’N848MQ’,’N328AA’,’N247JB’. Your select statement should return the following information: tailnum, flight date information, departure delay, arrival delay, 3 digit, destination code.
SELECT 
tailnum, 
year, 
month, 
day, 
dep_delay, 
arr_delay, 
dest
FROM flights 
WHERE year = 2013 AND month = 2 AND day BETWEEN 14 AND 17 AND tailnum IN ('N125UW','N848MQ','N328AA','N247JB')
ORDER BY tailnum;

#2  Add a join clause, to also show destination airport name. How many rows were returned?
SELECT 
tailnum, 
year, 
month, 
day, 
dep_delay, 
arr_delay, 
dest, 
airports.name
FROM flights 
JOIN airports
ON flights.dest = airports.faa
WHERE flights.year = 2013 AND month = 2 AND day BETWEEN 14 AND 17 AND flights.tailnum IN ('N125UW','N848MQ','N328AA','N247JB')
ORDER BY flights.tailnum;
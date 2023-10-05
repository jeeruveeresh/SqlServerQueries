CREATE TABLE flights (
    YEAR text,
    MONTH text,
    DAY text,
    DAY_OF_WEEK text,
    AIRLINE text,
    FLIGHT_NUMBER text,
    TAIL_NUMBER text,
    ORIGIN_AIRPORT text,
    DESTINATION_AIRPORT text,
    SCHEDULED_DEPARTURE text,
    DEPARTURE_TIME text,
    DEPARTURE_DELAY text,
    TAXI_OUT text,
    WHEELS_OFF text,
    SCHEDULED_TIME text,
    ELAPSED_TIME text,
    AIR_TIME text,
    DISTANCE text,
    WHEELS_ON text,
    TAXI_IN text,
    SCHEDULED_ARRIVAL text,
    ARRIVAL_TIME text,
    ARRIVAL_DELAY text,
    DIVERTED text,
    CANCELLED text,
    CANCELLATION_REASON text,
    AIR_SYSTEM_DELAY text,
    SECURITY_DELAY text,
    AIRLINE_DELAY text,
    LATE_AIRCRAFT_DELAY text,
    WEATHER_DELAY text
);
SELECT count(*) FROM flights;
show databases;
use  test;

#What is the IATA_CODE for the airline that had the greatest number of flights in 2015?
SELECT AIRLINE
FROM flights
GROUP BY AIRLINE
ORDER BY COUNT(*) DESC
LIMIT 1;

#What is the name of the airline that had the greatest number of flights in 2015?
SELECT AIRLINE
FROM flights
WHERE AIRLINE = (
    SELECT AIRLINE
    FROM flights
    GROUP BY AIRLINE
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

#On which day of the week were there the greatest number of flights?
SELECT DAY_OF_WEEK
FROM flights
GROUP BY DAY_OF_WEEK
ORDER BY COUNT(*) DESC
LIMIT 1;

#On which day of the week were there the least number of flights?
SELECT DAY_OF_WEEK
FROM flights
GROUP BY DAY_OF_WEEK
ORDER BY COUNT(*) ASC
LIMIT 1;

#On which day of the year 2015 did Delta Airlines have the greatest number of flights?
SELECT DAY
FROM flights
WHERE AIRLINE = 'DL'
GROUP BY DAY
ORDER BY COUNT(*) DESC
LIMIT 1;

#What is the name of the airline that had the least number of flights during 2015?
SELECT AIRLINE
FROM flights
GROUP BY AIRLINE
ORDER BY COUNT(*) ASC
LIMIT 1;

#Which airline had the greatest average "departure delay" times?
SELECT AIRLINE
FROM flights
GROUP BY AIRLINE
ORDER BY AVG(DEPARTURE_DELAY) DESC
LIMIT 1;

#Which ten airports were the most frequent destination airport?
SELECT DESTINATION_AIRPORT, COUNT(*) AS num_flights
FROM flights
GROUP BY DESTINATION_AIRPORT
ORDER BY num_flights DESC
LIMIT 10;

#Which airline had the greatest percentage of "departure delay" flights?
SELECT AIRLINE
FROM flights
GROUP BY AIRLINE
ORDER BY SUM(CASE WHEN DEPARTURE_DELAY > 0 THEN 1 ELSE 0 END) / COUNT(*) DESC
LIMIT 1;

#What is the total number of miles traveled by each airline?
SELECT AIRLINE, SUM(DISTANCE) AS total_distance
FROM flights
GROUP BY AIRLINE;

#What is the name of the airline that traveled the longest cumulative distance?
SELECT AIRLINE
FROM flights
GROUP BY AIRLINE
ORDER BY SUM(DISTANCE) DESC
LIMIT 1;

#What is the name of the airline that had the greatest percentage of cancellations?
SELECT AIRLINE
FROM flights
GROUP BY AIRLINE
ORDER BY SUM(CANCELLED) / COUNT(*) DESC
LIMIT 1;

#Which destination airport had the greatest number of flights with arrival delays?
SELECT DESTINATION_AIRPORT
FROM flights;
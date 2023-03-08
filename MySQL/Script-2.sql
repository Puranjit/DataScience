--OBTAINING DATA
SELECT * 
FROM dataset_1;

--LIMIT
SELECT destination, passanger
FROM dataset_1
LIMIT 10;

--DISTINCT
SELECT DISTINCT passanger
FROM dataset_1;

SELECT DISTINCT destination 
FROM dataset_1;

--WHERE
SELECT *
FROM dataset_1
WHERE passanger = 'Alone';

SELECT destination, passanger
FROM dataset_1
WHERE passanger = 'Alone';

--WHERE WITH AND/OR
SELECT *
FROM dataset_1
WHERE passanger = 'Alone' AND destination = 'Home';

SELECT destination, weather, coupon, time, passanger
FROM dataset_1
WHERE passanger = 'Alone' OR time = '2PM';

SELECT destination, weather, coupon, time, passanger 
FROM dataset_1
WHERE passanger = 'Alone' AND time = '2PM';

SELECT DISTINCT weather
FROM dataset_1;

--ORDER BY 
SELECT *
FROM dataset_1
WHERE destination = 'Home'
ORDER BY weather;

SELECT *
FROM dataset_1
WHERE destination = 'Home'
ORDER BY weather DESC;

SELECT DISTINCT time
FROM dataset_1
ORDER BY time DESC;

SELECT time
FROM dataset_1
WHERE coupon = 'Coffee House'
ORDER BY time;

--ALIASING
SELECT destination, passanger,
time as 'The Time'
FROM dataset_1
WHERE passanger = 'Alone' OR time = '2PM'
ORDER BY time DESC;

--AGGREGATION - WAY OF GROUPING DATA BY CERTAIN COLUMN 
SELECT destination
FROM dataset_1 d 
GROUP BY destination;

SELECT destination, AVG(temperature) 
FROM dataset_1 d 
GROUP BY destination;

SELECT destination, AVG(temperature), COUNT(temperature), SUM(temperature) 
FROM dataset_1 d 
GROUP BY destination;

SELECT destination, time,
AVG(temperature), COUNT(temperature), SUM(temperature) 
FROM dataset_1 d 
GROUP BY destination, time;

SELECT destination, time,
AVG(temperature), COUNT(temperature), SUM(temperature) 
FROM dataset_1 d
WHERE time <> '10PM'
GROUP BY destination, time;

SELECT destination, time,
AVG(temperature), COUNT(temperature), SUM(temperature) 
FROM dataset_1 d
WHERE time <> '10PM'
GROUP BY destination, time
ORDER BY destination, time;

SELECT destination, time,
AVG(temperature), COUNT(temperature), SUM(temperature) 
FROM dataset_1 d
WHERE time <> '10PM'
GROUP BY destination, time
ORDER BY destination DESC, time DESC;

--AVERAGE
SELECT weather, 
AVG(temperature) AS 'avg_temp'
FROM dataset_1
GROUP BY weather;

--COUNT
SELECT weather, 
COUNT(temperature) AS 'count_temp'
FROM dataset_1
GROUP BY weather;

--COUNT (DISTINCT)
SELECT weather, 
COUNT(DISTINCT temperature) AS 'count_distinct_temp'
FROM dataset_1
GROUP BY weather;

--SUM
SELECT weather, 
SUM(temperature) AS 'sum_temp'
FROM dataset_1
GROUP BY weather;

--MIN
SELECT weather, 
MIN(temperature) AS 'min_temp'
FROM dataset_1
GROUP BY weather;

--MAX
SELECT weather, 
max(temperature) AS 'mAX_temp'
FROM dataset_1
GROUP BY weather;

SELECT * FROM dataset_1 d;

--UNION
SELECT *
FROM table_to_union ttu;

SELECT * 
FROM dataset_1 d 
UNION ALL
SELECT *
FROM table_to_union ttu;

SELECT DISTINCT destination
FROM dataset_1 d;

SELECT DISTINCT destination
FROM(
	SELECT *
	FROM dataset_1 d 
	UNION
	SELECT * 
	FROM table_to_union ttu
);

--JOIN - INNER, LEFT, RIGHT, FULL JOIN
SELECT *
FROM table_to_join ttj;

SELECT *
FROM table_to_join ttj
JOIN dataset_1 d;

SELECT destination, d.time, ttj.part_of_day
FROM dataset_1 d 
JOIN table_to_join ttj 
ON d.time = ttj.time;

--ADVANCE FILTERING
SELECT * 
FROM dataset_1 d 
WHERE weather LIKE 'Sno%';

SELECT COUNT(weather)
FROM dataset_1 d
WHERE weather = 'Snowy';

SELECT * FROM dataset_1 d;

SELECT *
FROM dataset_1 d 
WHERE time LIKE '%Pm';

--BETWEEN
SELECT DISTINCT temperature
FROM dataset_1 d;
WHERE temperature BETWEEN 29 AND 75;

SELECT DISTINCT temperature
FROM dataset_1 d
WHERE temperature BETWEEN 29 AND 75;

--IN
SELECT occupation 
FROM dataset_1 d 
WHERE occupation IN ('Sales & Related', 'Management');
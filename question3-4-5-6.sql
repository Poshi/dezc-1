SELECT
	'Question 3:' AS header,
	CASE
        WHEN trip_distance <= 1 THEN 'dist_1'
        WHEN trip_distance > 1 AND trip_distance <= 3 THEN 'dist_2'
        WHEN trip_distance > 3 AND trip_distance <= 7 THEN 'dist_3'
        WHEN trip_distance > 7 AND trip_distance <= 10 THEN 'dist_4'
        ELSE 'dist_5'
    END AS trip_length,
	COUNT(*) as n_trips
FROM
	green_taxi_data
GROUP BY
	trip_length
ORDER BY
	trip_length;

-- Output:
-- "Question 3:"	"dist_1"	104838
-- "Question 3:"	"dist_2"	199013
-- "Question 3:"	"dist_3"	109645
-- "Question 3:"	"dist_4"	27688
-- "Question 3:"	"dist_5"	35202

SELECT
	CONCAT('Question 4: ', CAST(lpep_pickup_datetime AS DATE))
FROM
	green_taxi_data
ORDER BY
	trip_distance DESC
LIMIT
	1;

-- Output:
-- "Question 4: 2019-10-31"

SELECT
	'Question 5' AS header,
	z."Zone"
FROM
	green_taxi_data AS t JOIN zones AS z ON t."PULocationID"=z."LocationID"
WHERE
	CAST(t.lpep_pickup_datetime AS DATE) = '2019-10-18'
GROUP BY
	z."Zone"
HAVING
	SUM(total_amount) > 13000
LIMIT
	3;

--Output:
-- "Question 5"	"East Harlem North"
-- "Question 5"	"East Harlem South"
-- "Question 5"	"Morningside Heights"

SELECT
	CONCAT('Question 6: ', d."Zone")
FROM
		 green_taxi_data AS t
	JOIN zones AS p ON t."PULocationID"=p."LocationID"
	JOIN zones AS d ON t."DOLocationID"=d."LocationID"
WHERE
	p."Zone" = 'East Harlem North'
GROUP BY
	d."Zone"
ORDER BY
	MAX(t.tip_amount) DESC
LIMIT
	1;

-- Output:
-- "Question 6: JFK Airport"

SELECT
	CONCAT('Question 3: ', COUNT(*))
FROM
	green_taxi_data
WHERE
	    lpep_pickup_datetime >= '2019-09-18'
	AND lpep_dropoff_datetime < '2019-09-19';

SELECT
	CONCAT('Question 4: ', lpep_pickup_datetime::date)
FROM
	green_taxi_data
ORDER BY
    trip_distance DESC
LIMIT 1;

SELECT
	CONCAT('Question 5: ', z."Borough")
FROM
	green_taxi_data AS t JOIN zones AS z ON t."PULocationID" = z."LocationID"
WHERE
	    t.lpep_pickup_datetime >= '2019-09-18'
	AND t.lpep_dropoff_datetime < '2019-09-19'
GROUP BY
	z."Borough"
HAVING
	SUM(t.total_amount) > 50000;

SELECT
	CONCAT('Question 6: ', doz."Zone")
FROM
	green_taxi_data AS t JOIN zones AS puz ON t."PULocationID" = puz."LocationID" JOIN zones AS doz ON t."DOLocationID" = doz."LocationID"
WHERE
	    puz."Zone" = 'Astoria'
ORDER BY
	t."tip_amount" DESC
LIMIT 1;

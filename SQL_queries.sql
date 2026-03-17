-- Add ride length column
ALTER TABLE trips
ADD ride_length INT;

UPDATE trips
SET ride_length = DATEDIFF(MINUTE, started_at, ended_at);

-- Add day of week column
ALTER TABLE trips
ADD day_of_week VARCHAR(20);

UPDATE trips
SET day_of_week = DATENAME(WEEKDAY, started_at);

-- Add ride hour column
ALTER TABLE trips
ADD ride_hour INT;

UPDATE trips
SET ride_hour = DATEPART(HOUR, started_at);

-- Rides by day of week
SELECT day_of_week, member_casual, COUNT(*) AS ride_count
FROM trips
GROUP BY day_of_week, member_casual
ORDER BY ride_count DESC;

-- Average ride length
SELECT member_casual, AVG(ride_length) AS avg_ride_length
FROM trips
GROUP BY member_casual;
Create database Ola;
Use Ola;

#1. Retrieve all successful bookings:
CREATE VIEW Successful_Bookings AS
SELECT *
FROM bookings
WHERE `Booking Status` = 'Success';

#2. Find the average ride distance for each vehicle type:
CREATE VIEW ride_distance_for_each_vehicle AS
SELECT `Vehicle Type`, 
       AVG(`Ride Distance`) AS avg_distance
FROM bookings
GROUP BY `Vehicle Type`;

#3. Get the total number of cancelled rides by customers:
#CREATE VIEW cancelled_rides_by_customers AS
SELECT COUNT(*) AS total_cancelled_by_customers
FROM bookings
WHERE `Booking Status` = 'Cancelled by Customer';

#4. List the top 5 customers who booked the highest number of rides:
CREATE VIEW Top_5_Customers AS
SELECT `Customer ID`, COUNT(`Booking ID`) AS total_rides
FROM bookings
GROUP BY `Customer ID`
ORDER BY total_rides DESC
LIMIT 5;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
#CREATE VIEW Rides_cancelled_by_Drivers_P_C_Issues AS
SELECT COUNT(*) AS total_cancelled_by_drivers_pci
FROM bookings
WHERE `Cancelled Rides by Driver` = 'Personal & Car related issues';

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
SELECT MAX(`Driver Ratings`) AS max_rating,
       MIN(`Driver Ratings`) AS min_rating
FROM bookings
WHERE `Vehicle Type` = 'Prime Sedan';

#7 Find the average customer rating per vehicle type:
#CREATE VIEW AVG_Cust_Rating AS
SELECT `Vehicle Type`, 
       AVG(`Customer Rating`) AS avg_customer_rating
FROM bookings
GROUP BY `Vehicle Type`;

#. Calculate the total booking value of rides completed successfully:
CREATE VIEW total_successful_ride_value AS
SELECT SUM(`Booking Value`) AS total_successful_ride_value
FROM bookings
WHERE `Booking Status` = 'Success';

#10. List all incomplete rides along with the reason:
CREATE VIEW Incomplete_Rides_Reason AS
SELECT `Booking ID`, `Incomplete Rides Reason`
FROM bookings
WHERE `Incomplete Rides` = TRUE;





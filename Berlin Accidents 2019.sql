use accidents;

SELECT * 
FROM records r
WHERE month =1 AND (weekday=6)
ORDER BY hour ASC;

# district with most accidents: Steglitz-Zehlendorf
SELECT district, district_name, count(district_name)
FROM records
GROUP BY district 
ORDER BY count(district_name) DESC;

# disctrict with most severe accidents: Reinikendorf
SELECT district_name, count(injury)
FROM records
WHERE injury = 'Fatal'
GROUP BY district_name
ORDER BY count(injury) DESC;

# street with most accidents: Alexanderplatzviertel
SELECT street, count(street)
FROM records
GROUP BY street
ORDER BY count(street) DESC;

# most dangerous street for pedestrians: Alexanderplatzviertel
SELECT district_name, street, count(street)
FROM records
WHERE pedestrian=1
GROUP BY street
ORDER BY count(street) DESC;

# most dangerous street for cyclists: Alexanderplatzviertel
SELECT district_name, street, count(street)
FROM records
WHERE bicycle=1
GROUP BY street
ORDER BY count(street) DESC;

# most dangerous street for bikers: Alexanderplatzviertel
SELECT district_name, street, count(street)
FROM records
WHERE motorbike=1
GROUP BY street
ORDER BY count(street) DESC;

# most common combination in accidents: 
SELECT sum(bicycle & car), sum(bicycle & pedestrian), sum(bicycle & motorbike), sum(bicycle & truck), sum(bicycle & other_vehicle)
FROM records
WHERE bicycle =1;
SELECT sum(bicycle & car), sum(car & pedestrian), sum(car & motorbike), sum(car & truck), sum(car & other_vehicle)
FROM records
WHERE car =1;


# most dangerous hour: 15-17 
SELECT hour, count(hour)
FROM records
GROUP BY hour
ORDER BY count(hour) DESC;

# most 
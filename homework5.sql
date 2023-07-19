CREATE DATABASE homework_5;
USE homework_5;
CREATE TABLE cars (  
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
); 
INSERT cars VALUES  
	(1, "Audi", 52642),
    (2, "Mercedes", 57127),
    (3, "Skoda", 9000),
    (4, "Volvo", 29000),
    (5, "Bentley", 350000),
    (6, "Citroen ", 21000 ),
    (7, "Hummer", 41400),
    (8, "Volkswagen ", 21600);
SELECT * FROM cars;

-- 1. создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов

CREATE VIEW cheap_cars AS 
SELECT * FROM cars 
WHERE cost < 25000;
SELECT * FROM cheap_cars;

-- 2. Изменить  в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор OR REPLACE)

CREATE OR REPLACE VIEW cheap_cars AS 
SELECT * FROM cars 
WHERE cost < 30000;
SELECT * FROM cheap_cars;

-- 3. Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”

CREATE VIEW audi_skoda_cars AS 
SELECT * FROM cars 
WHERE name IN ('Audi', 'Skoda');
SELECT * FROM audi_skoda_cars;

-- 4. Добавьте новый столбец под названием «время до следующей станции». 

DROP TABLE IF EXISTS train;
CREATE TABLE train (
  train_id integer NOT NULL,
  station varchar(20) NOT NULL,
  station_time time NOT NULL
);

INSERT train 
    (train_id, station, station_time)
  VALUES 
    (110, 'San Francisco', '10:00:00'),
    (110, 'Redwood City', '10:54:00'),
    (110, 'Palo Alto', '11:02:00'),
    (110, 'San Jose', '12:35:00'),
    (120, 'San Francisco', '11:00:00'),
    (120, 'Palo Alto', '12:49:00'),
    (120, 'San Jose', '13:30:00');
    
SELECT * FROM train;

SELECT *,
 SUBTIME(LEAD(station_time) OVER(PARTITION BY train_id ORDER BY station_time), station_time) 
 AS time_to_next_station 
FROM train;



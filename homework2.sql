CREATE DATABASE IF NOT EXISTS homework_2;
USE homework_2;
-- 1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
DROP TABLE IF EXISTS sales;
CREATE TABLE IF NOT EXISTS sales
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    count_product INT NOT NULL
);
INSERT INTO sales (order_date, count_product)
VALUES 
	('2022-01-01', 156), 
    ('2022-01-02', 180), 
    ('2022-01-03', 21), 
    ('2022-01-04', 124),
    ('2022-01-05', 341);
    
SELECT * FROM sales;

-- 2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300

SELECT id,
CASE
	WHEN count_product < 100 
		THEN 'маленький заказ'
	WHEN count_product BETWEEN 100 AND 300 
		THEN 'средний заказ'
	WHEN count_product > 300 
		THEN 'большой заказ'
END AS 'тип заказа'
FROM sales;

-- 3. Создайте таблицу “orders”, заполните ее значениями. 
-- Покажите “полный” статус заказа, используя оператор CASE. 

DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id VARCHAR(45) NOT NULL,
	amount DECIMAL(10, 2) NOT NULL,
    order_status VARCHAR(45) NOT NULL
);
INSERT INTO orders (employee_id, amount, order_status)
VALUES 
	('e03', 15.00, 'OPEN'), 
    ('e01', 25.50, 'OPEN'), 
    ('e05', 100.70, 'CLOSED'), 
    ('e02', 22.18, 'OPEN'),
    ('e04', 9.50, 'CANCELLED');

SELECT id,
CASE
	WHEN order_status = "OPEN"
		THEN 'Order is in open state'
	WHEN order_status = "CLOSED" 
		THEN 'Order is closed'
	WHEN order_status = "CANCELLED"
		THEN 'Order is cancelled'
END AS 'full_order_status'
FROM orders;



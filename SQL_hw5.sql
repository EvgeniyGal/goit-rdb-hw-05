use mydb;

SELECT *, (SELECT  customer_id FROM orders o WHERE o.id = od.order_id) AS customer_id
 FROM order_details od;
 
 SELECT * FROM order_details od
 WHERE (SELECT shipper_id FROM orders o WHERE o.id = od.order_id) = 3;
 
 SELECT order_id, AVG(quantity) AS average_quantity FROM 
 (SELECT * FROM order_details WHERE quantity > 10) AS temp_table
 GROUP BY order_id;
 
 WITH temp AS (
 SELECT * FROM order_details
 WHERE quantity > 10
)
SELECT order_id, AVG(quantity) AS average_quantity 
FROM temp
GROUP BY order_id;

DROP FUNCTION IF EXISTS divide_floats;

DELIMITER //
CREATE FUNCTION divide_floats(num1 FLOAT, num2 FLOAT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
    RETURN num1 / num2;
END //
DELIMITER ;

SELECT order_id, divide_floats(quantity, 2) AS half_quantity FROM order_details;



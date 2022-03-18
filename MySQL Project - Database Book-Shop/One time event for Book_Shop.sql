-- One time event --

-- Turn ON Event Scheduler 

SET GLOBAL event_scheduler = ON;
USE book_shop;

CREATE TABLE monitoring_orders
(ID INT NOT NULL AUTO_INCREMENT, 
Last_Update TIMESTAMP,
PRIMARY KEY (ID));

DELIMITER //
CREATE EVENT one_time_event
ON SCHEDULE AT NOW() + INTERVAL 1 minute
DO BEGIN
	INSERT INTO monitoring_orders(Last_Update)
	VALUES (NOW());
END//

DELIMITER ;

SELECT *
FROM monitoring_orders;

-- Clean up (optional)

DROP TABLE monitoring_orders;

DROP EVENT one_time_event;
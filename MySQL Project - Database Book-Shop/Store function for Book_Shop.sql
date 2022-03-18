
use book_shop;
select * from book_specifics;
select min(stock_quantity), max(stock_quantity), avg(stock_quantity) from book_specifics;

DELIMITER //
CREATE FUNCTION consider_restocking
(
    stock_quantity INT
)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN 
    DECLARE book_status VARCHAR(20);
    IF stock_quantity <= 12 THEN
        SET book_status = 'YES';
    ELSEIF (stock_quantity > 12 AND 
	        stock_quantity < 69) THEN
        SET book_status = 'SOON';
    ELSEIF stock_quantity >= 69 THEN
        SET book_status = 'NO';
    END IF;
    RETURN (book_status);
END//balance
DELIMITER ;
    
select * from book_shop.book_specifics;

SELECT
    Book_specifics_id,
    title,
    stock_quantity,
    consider_restocking(stock_quantity)
FROM
    book_specifics;
    
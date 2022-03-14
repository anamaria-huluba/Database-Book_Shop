-- Prepare an example query with group by and having to demonstrate how to extract data from your DB for analysis. 

use book_shop;

SELECT released_year, AVG(stock_quantity) 
FROM book_specifics
GROUP BY released_year 
order by released_year;

SELECT released_year, 
COUNT(*) FROM book_specifics GROUP BY released_year;

SELECT released_year AS year,
    COUNT(*) AS '# of books',
    AVG(pages) AS 'avg pages'
FROM book_specifics
    GROUP BY released_year
    HAVING AVG(pages) > 359;
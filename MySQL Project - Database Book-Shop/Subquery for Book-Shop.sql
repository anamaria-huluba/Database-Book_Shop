-- An example query with a subquery- Find the title of the shortest book 

use book_shop;

select * from book_specifics;

SELECT title, pages FROM book_specifics 
WHERE pages = (SELECT Min(pages) 
                FROM book_specifics);              
                
-- OR using ORDER BY --

SELECT 
title, 
pages FROM book_SPECIFICS 
ORDER BY pages ASC LIMIT 1;                


                
                
/*CHAPTER ONE*/


SELECT * FROM people;  /* show data in tables when you query a people table*/

SELECT name FROM people; /*displays names of in a table called people*/

SELECT 'DataCamp <3 SQL'  /*selected as db name and displayed*/
AS result;

SELECT name, birthdate FROM people; /*select multiple columns from same table*/

SELECT * FROM people; /*select all coumns from table people*/

SELECT * FROM people LIMIT 10; /* select all columns with just 10 columns */

SELECT titles FROM films; /*slect titles of all films*/

SELECT title, release_year FROM year; /*select 2 columns from films*/

SELECT DISTINCT language FROM films; /*print unique values and leaves duplicates*/

SELECT COUNT(*) from people; /*count the number of rows in a comlumn*/

SELECT COUNT(birthdats) from people; /*count specific column in a table*/

SELECT COUNT(DISTINCT birthdate) from people; /*query unique birthdates from people's table*/

SELECT COUNT(DISTINCT language) from films; /*query unique language from films table*/




/*CHAPTER TWO*/
SELECT title FROM films WHERE title='Metropolis'; /*select specific filters*/

SELECT * FROM films WHERE release_year = 2016 /*returns all films released in 2016*/

SELECT COUNT(*) from films WHERE release_year < 2000 /*returns total number of films produced before 2000*/

SELECT *  from films WHERE language = 'French'  /*returns all films in French*/

SELECT title FROM films WHERE release_year > 1994 AND release_year < 2004;  /*Select between periods using and*/

SELECT title, release_year FROM films WHERE release_year >= 1990 AND release_year <2000; /*Get moves between 90s*/


SELECT title, release_year                              /*multi selet using AND & OR */
FROM films
WHERE (release_year >= 1990 AND release_year < 2000)
AND (language = 'French' OR language = 'Spanish');


SELECT title, release_year FROM films WHERE release_year BETWEEN 1990 AND 2000;  /*Using BETWEEN  to print values in a range*/


SELECT title, release_year                             /*select using AND OR BETWEEN in a table*/
FROM films
WHERE release_year BETWEEN 1990 AND 2000
AND budget > 100000000
AND (language = 'French' OR language='Spanish');


SELECT title, certification FROM films WHERE certification IN ('NC-17','R');            /*USING IN to elimiate multiple AND and OR*/


/*NULL --> IS NULL is used in sql to check for values that have missing data */

SELECT (*) FROM films WHERE titles IS NULL;         /*Returns total of null values in sql*/

SELECT names FROM people WHERE birthdate IS NOT NULL    /*---> Returns name sof people leaving blank ones*/

SELECT COUNT(*) FROM films WHERE language IS NULL;      /*-----> get total number of missing values in films*/



/*LIKE & NOT LIKE*/










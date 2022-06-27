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



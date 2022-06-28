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
/* use to get a specific match on a query using wirld card -- > '%'  or '_'*/
/*'%' returns a qury which contains the char or '_' for specific match */

SELECT name FROM companies WHERE name LIKE 'Timz_Owen'`;

SELECT name FROM people WHERE name LIKE 'B%' /*Returns a query of names that starts with B*/

SELECT name FROM people WHERE name LIKE '_r%';  /*returns name with r as the second char*/

SELECT name FROM people WHERE name NOT LIKE 'A%'     /*returns names that dont start with A */



/* SQL AGGREGATE FUNCTIONS */
SELECT SUM(duration) FROM films;        /* get the total duration from films */

SELECT AVG(duration) FROM films;     /* Gets the avarage of the duration in the movie */

SELECT MIN(duration) FROM films;     /*returns the min value of a duration*/

SELECT MAX(duration) FROM films;    /*returns the max duration of a given table*/


/*Combine aggregate functions with WHERE*/

SELECT SUM(gross) FROM films WHERE release_year >= 2000;    /*returns total gross for films after 2k inlc 2000*/

SELECT AVG(gross) FROM films WHERE title LIKE 'A%'      /*returns the avarage of films starting with letter A*/

SELECT MIN(gross) FROM films WHERE release_year = 1994;     /*gross amount by worst perfoming film in 1994*/

SELECT MAX(gross) FROM films WHERE (release_year >=2000 AND release_year <=2020); /* returns max gross between the range */


/* A note on Arithmetic */

SELECT (4*3);           /*multiplication*/
SELECT (4/3);           /*dividion of intergers returns full interger*/
SELECT (4.0 / 3.0);     /*divion of decimal returns decimal*/

/*Alisaing ---> Assing a temporary value to a query to hold the results temporarily. Uses 'AS' keyword*/

SELECT MAX(duration) AS max_duration, MAX(gross) AS max_gross FROM films; 

SELECT title, (gross - budget) AS net_profit FROM films;    /*get the profit from films*/

SELECT title, (duration/60.0) AS duration_hours FROM films; /* duration in hours for all the films */

SELECT AVG(duration)/60.0 AS avg_duration_hours FROM films;  /*get avarage hours of the films */

SELECT COUNT(deathdate) * 100.0 / COUNT(*) AS percantage_dead FROM films;   /*get avg of dead*/

SELECT MAX(release_year)-MIN(release_year) AS difference FROM films;    /*returns difference of first and last release year*/

SELECT ((MAX(release_year) - MIN(release_year) / 10.0 )) AS decades FROM films; /*years in decades since produciton*/


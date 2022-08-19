/*CHAPTER ONE*/


SELECT * FROM people;  /* show data in tables when you query a people table*/

SELECT name FROM people; /*displays names of in a table called people*/

SELECT 'DataCamp <3 SQL' AS result; /*selected as db name and displayed*/


SELECT name, birthdate FROM people; /*select multiple columns from same table*/

SELECT * FROM people; /*select all coumns from table people*/

SELECT * FROM people LIMIT 10; /* select all columns with just 10 columns */

SELECT titles FROM films; /*slect titles of all films*/

SELECT title, release_year FROM year; /*select 2 columns from films*/

SELECT DISTINCT language FROM films; /*print unique values and leaves duplicates*/

SELECT COUNT(*) from people; /*count the number of rows in a comlumn*/

SELECT COUNT(birthdates) from people; /*count specific column in a table*/

SELECT COUNT(DISTINCT birthdate) from people; /*query unique birthdates from people's table*/

SELECT COUNT(DISTINCT language) from films; /*query unique language from films table*/



/*CHAPTER TWO*/
SELECT title FROM films WHERE title='Metropolis'; /*select specific filters*/

SELECT * FROM films WHERE release_year = 2016 /*returns all films released in 2016*/

SELECT COUNT(*) from films WHERE release_year < 2000 /*returns total number of films produced before 2000*/

SELECT *  from films WHERE language = 'French'  /*returns all films in French*/

SELECT title FROM films WHERE release_year > 1994 AND release_year < 2004;  /*Select between periods using and*/

SELECT title, release_year FROM films WHERE release_year >= 1990 AND release_year <2000; /*Get moves between 90s*/


SELECT title, release_year FROM films WHERE (release_year >= 1990 AND release_year < 2000) AND (language = 'French' OR language = 'Spanish');   /*multi selet using AND & OR */

SELECT title, release_year FROM films WHERE release_year BETWEEN 1990 AND 2000;  /*Using BETWEEN  to print values in a range*/


SELECT title, release_year FROM films WHERE release_year BETWEEN 1990 AND 2000 AND budget > 100000000 AND (language = 'French' OR language='Spanish');

SELECT title, certification FROM films WHERE certification IN ('NC-17','R');            /*USING IN to elimiate multiple AND and OR*/


/*NULL --> IS NULL is used in sql to check for values that have missing data */

SELECT (*) FROM films WHERE titles IS NULL;         /*Returns total of null values in sql*/

SELECT names FROM people WHERE birthdate IS NOT NULL    /*---> Returns name sof people leaving blank ones*/

SELECT COUNT(*) FROM films WHERE language IS NULL;      /*-----> get total number of missing values in films*/



/*LIKE & NOT LIKE*/
/* use to get a specific match on a query using wirld card -- > '%'  or '_'*/
/*'%' returns a qury which contains the char or '_' for specific match */

SELECT name FROM companies WHERE name LIKE 'Timz_Owen';

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


/*Order by Asceding or Descending order ----> uses ORDER BY and the value ----->ASC or DESC*/

SELECT name FROM people ORDER BY name;  /*list alphabetically*/

SELECT title FROM films WHERE release_year IN(2000, 2012) ORDER BY release_year;    /*returns order of release in 2 or 2012*/

SELECT * FROM films WHERE release_year <> 2015 ORDER BY duration;       /*Get all films not inclusive of 2015 order by duration*/

SELECT title, gross FROM films WHERE title LIKE 'M%' ORDER BY title;    /*Get all films starting with M ordered by title*/


/*Sorting single columns DESC*/

SELECT imdb_score, film_id FROM reviews ORDER BY imdb_score DESC;   /*order in descending order*/

SELECT title FROM films ORDER BY title DESC;    /*order in descedning order*/

SELECT title, duration ORDER BY duration DESC;  /*order in longest to smallest*/



/* Sorting Multiple columns ------>sorts by first column then next, and next and next column */

SELECT birthdate, name FROM people ORDER BY name, birthdate;    /*ordering starts with column of namw*/

SELECT release_year, title, duration FROM films ORDER BY release_year, title;   /* Year first then title */


/* GROUP BY---->Allows you to group results in columns and count them . Always goes after FROM , ORDER BY goes afrer GROUP BY*/


SELECT sex, COUNT(*) FROM employees GROUP BY sex ORDER BY COUNT DESC;   /* list in the order of the largest sum */

SELECT release_year, COUNT(*) FROM films GROUP BY release_year ORDER BY release_year;   /* Group all count per year released*/

SELECT release_year, AVG(duration) FROM films GROUP BY released;    /*avarage grouped per year*/

SELECT release_year, MAX(budget) FROM films GROUP BY release_year;  /*grouping from max budget*/

SELECT imdb_score, COUNT(*) FROM reviews GROUP BY imdb_score;   /* used idbm_score to count all occurances */

SELECT release_year, MIN(gross) FROM films GROUP BY release_year;   /* min of gross */

SELECT language,SUM(gross) FROm films GROUP BY language;
 
SELECT country, SUM(budget) FROM films GROUP BY country;

SElECT release_year,country,MAX(budget) FROM films GROUP BY release_year, country ORDER BY release,country;

SELECT release_year,country,MIN(budget) FROM films GROUP BY release_year,country ORDER BY release_year, country;


/*HAVING----->used to get a query that combines results from an aggregate function*/

SELECT release_year FROM films GROUP BY release_year HAVING COUNT(title)>200; /*returns countries that made more than 200 films*/

SELECT release_year, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross FROM films WHERE release_year > 1990 GROUP BY release_year HAVING AVG(budget) > 60000000 ORDER BY avg_gross DESC;

/*Get the country, average budget, and average gross take of countries that have made more than 10 films. Order the result by country name, and limit the number of results displayed to 5. 
You should alias the averages as avg_budget and avg_gross respectively.
They hold names temproray when displaying values from table
*/
SELECT country, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross FROM films GROUP BY country HAVING COUNT(title)>10 ORDER BY country LIMIT 5;

SELECT ProductName AS products, price AS Cash FROM Products_table  



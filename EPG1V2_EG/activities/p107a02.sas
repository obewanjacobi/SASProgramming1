***********************************************************;
*  Activity 7.02                                          *;
*    1) Complete the SQL query to display Event and Cost  *;
*       from PG1.STORM_DAMAGE. Format the values of Cost. *;
*    2) Add a new column named Season that extracts the   *;
*       year from Date.                                   *;
*    3) Add a WHERE clause to return rows where Cost is   *;
*       greater than 25 billion.                          *;
*    4) Add an ORDER BY clause to arrange rows by         *;
*       descending Cost. Which storm had the highest      *;
*       cost?                                             *;
***********************************************************;
*  Syntax                                                 *;
*    PROC SQL;                                            *;
*        SELECT col-name, col-name FORMAT=fmt             *;
*        FROM input-table                                 *;
*        WHERE expression                                 *;
*        ORDER BY col-name <DESC>;                        *;
*    QUIT;                                                *;
*                                                         *;
*    New column in SELECT list:                           *;
*    expression AS col-name                               *;
***********************************************************;

/*part 1*/
title "Most Costly Storms";
proc sql;
*Add a SELECT statment;
select Event, Cost format=dollar20. from pg1.storm_damage;
quit;

/*part 2*/
title "Most Costly Storms";
proc sql;
*Add a SELECT statment;
select Event, Cost format=dollar20., year(Date) as Season 
	from pg1.storm_damage;
quit;

/*part 3*/
title "Most Costly Storms";
proc sql;
*Add a SELECT statment;
select Event, Cost format=dollar20., year(Date) as Season 
	from pg1.storm_damage
	where Cost > 25000000000;
quit;

/*part 4*/
title "Most Costly Storms";
proc sql;
*Add a SELECT statment;
select Event, Cost format=dollar20., year(Date) as Season 
	from pg1.storm_damage
	where Cost > 25000000000
	order by Cost desc;
quit;

* Katrina had the highest cost;

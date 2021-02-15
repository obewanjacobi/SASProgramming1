***********************************************************;
*  LESSON 4, PRACTICE 1                                   *;
*    a) Open the PG1.EU_OCC table and examine the column  *;
*       names and values.                                 *;
*    b) Modify the code to create a temporary table named *;
*       EU_OCC2016 and read PG1.EU_OCC.                   *;
*    c) Complete the WHERE statement to select only the   *;
*       stays that were reported in 2016. Notice that     *;
*       YearMon is a character column and the first four  *;
*       positions represent the year.                     *;
*    d) Complete the FORMAT statement in the DATA step to *;
*       apply the COMMA17. format to the Hotel,           *;
*       ShortStay, and Camp columns.                      *;
*    e) Complete the DROP statement to exclude Geo from   *;
*       the output table.                                 *;
***********************************************************;

/*View raw data for reference*/
proc print data=pg1.eu_occ;
run;

/*part b*/
data eu_occ2016;
	set pg1.eu_occ;
run;

/*part c*/
data eu_occ2016;
	set pg1.eu_occ;
	where YearMon like "2016%";
run;

/*part d*/
data eu_occ2016;
	set pg1.eu_occ;
	where YearMon like "2016%";
	format Hotel ShortStay Camp comma17.;
run;

/*part e*/
data eu_occ2016;
	set pg1.eu_occ;
	where YearMon like "2016%";
	format Hotel ShortStay Camp comma17.;
	drop Geo;
run;



***********************************************************;
*  LESSON 4, PRACTICE 1 Level 2                           
*    a) Write a DATA step to read the pg1.np_species table 
*	    and create a new table named fox. Include only the
*		rows where Category is Mammal and Common_Names 
*		includes Fox in any case.
*		Exclude the Category, Record_Status, Occurrence, 
*		and Nativeness columns. Run the program.
*    b) Notice that Fox Squirrels are included in the 
*		output table. Add a condition in the WHERE 
*		statement to exclude rows that include Squirrel. 
*		Submit the program and verify the results. 
*    c) Sort the fox table by Common_Names.
*    d) What is the value of Common_Names in row one?
***********************************************************;

/*View raw data for reference*/
proc print data=pg1.np_species;
run;

/*part a*/
data fox;
	set pg1.np_species;
	where Category='Mammal' and upcase(Common_Names) like '%FOX%'; 
	drop Category Record_Status Occurrence Nativeness;
run;

/*part b*/
data fox;
	set pg1.np_species;
	where Category='Mammal' and upcase(Common_Names) like '%FOX%'
		  and upcase(Common_Names) not like '%SQUIRREL%'; 
	drop Category Record_Status Occurrence Nativeness;
run;

/*part c*/
proc sort data=fox;
	 by Common_Names;
run;

/*part d*/
* The Arctic Fox;


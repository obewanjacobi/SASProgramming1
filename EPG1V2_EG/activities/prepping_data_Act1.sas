*****************************************************;
*In your SAS software, open a new program window and 
*perform the following tasks:						 
*
*	a) Write a DATA step that reads the 
*	   pg1.storm_summary table and creates an output 
*	   table named Storm_cat5. Note: If you are 
*	   using SAS Studio, try creating storm_cat5 as 
*	   a permanent table in the EPG1V2/output folder.
*
*	b) Include only Category 5 storms (MaxWindMPH 
*	   greater than or equal to 156) with StartDate 
*	   on or after 01JAN2000.		
*
*	c) Add a statement to include the following 
*	   columns in the output data: Season, Basin, 
*	   Name, Type, and MaxWindMPH.
*
*	d) How many Category 5 storms have there been 
*	   since January 1, 2000?
*****************************************************;

/*View raw data for reference*/
proc print data=pg1.storm_summary;
run;

/*part a*/
data storm_cat5;
	set pg1.storm_summary;
run;

/*part b*/
data storm_cat5;
	set pg1.storm_summary;
	where MaxWindMPH >= 156 and StartDate >= "01JAN2000"d;
run;

/*part c*/
data storm_cat5;
	set pg1.storm_summary;
	where MaxWindMPH >= 156 and StartDate >= "01JAN2000"d;
	keep Season Basin Name Type MaxWindMPH;
run;

/*part d*/
* There have een 18 Category 5 storms since our startdate of Jan 1 2000.
*;
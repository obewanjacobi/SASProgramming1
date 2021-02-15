***********************************************************;
*  Activity 4.05                                          *;
*    1) Open the PG1.STORM_RANGE table and examine the    *;
*       columns. Notice that each storm has four wind     *;
*       speed measurements.                               *;
*    2) Create a new column named WindAvg that is the     *;
*       mean of Wind1, Wind2, Wind3, and Wind4.           *;
*    3) Create a new column WindRange that is the range   *;
*       of Wind1, Wind2, Wind3, and Wind4.                *;
***********************************************************;

/*View raw data for reference*/
proc print data=pg1.STORM_RANGE;
run;

/*Part 2*/
data storm_wingavg;
	set pg1.storm_range;
	*Add assignment statements;
	WindAvg = mean(Wind1, Wind2, Wind3, Wind4);
run;

/*Part 3*/
data storm_wingavg;
	set pg1.storm_range;
	*Add assignment statements;
	WindAvg = mean(Wind1, Wind2, Wind3, Wind4);
	WindRange = range(Wind1, Wind2, Wind3, Wind4);
run;

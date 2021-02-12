***********************************************************;
*  LESSON 3, PRACTICE 1 SOLUTION                          *;
***********************************************************;

/*Part A and B*/
/*list first 20 rows*/
proc print data=pg1.np_summary(obs=20);
	var Reg Type ParkName DayVisits TentCampers RVCampers;
run;

/*Part C*/
/*calculate summary statistics*/
proc means data=pg1.np_summary;
	var DayVisits TentCampers RVCampers;
run;

/*Part D*/
/*examine extreme values*/
proc univariate data=pg1.np_summary;
	var DayVisits TentCampers RVCampers;
run;

/*Part E*/
/*list unique values and frequency counts*/
proc freq data=pg1.np_summary;
	tables Reg Type;
run;

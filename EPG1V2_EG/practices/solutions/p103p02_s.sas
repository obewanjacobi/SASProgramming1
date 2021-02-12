***********************************************************;
*  LESSON 3, PRACTICE 2 SOLUTION                          *;
***********************************************************;

*Part A;
proc freq data=pg1.np_summary;
	tables Reg Type;
run;

*Part B;
proc univariate data=pg1.np_summary;
	var Acres;
run;

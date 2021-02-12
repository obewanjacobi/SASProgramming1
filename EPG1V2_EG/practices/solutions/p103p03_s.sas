***********************************************************;
*  LESSON 3, PRACTICE 3 SOLUTION                          *;
***********************************************************;

*Part A and B;
ods trace on;
proc univariate data=pg1.eu_occ;
	var camp;
run;
ods trace off;

*Part D and E;
ods select extremeobs;
proc univariate data=pg1.eu_occ nextrobs=10;
	var camp;
run;

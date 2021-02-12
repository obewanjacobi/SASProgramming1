***********************************************************;
*  LESSON 3, PRACTICE 5 SOLUTION                          *;
***********************************************************;

*Part A;
proc print data=pg1.eu_occ;
	where Hotel is missing and ShortStay is missing and Camp is missing;
run;

*Part B;
proc print data=pg1.eu_occ;
	where Hotel > 40000000;
run;

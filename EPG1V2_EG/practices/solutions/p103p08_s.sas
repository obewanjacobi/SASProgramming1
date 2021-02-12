***********************************************************;
*  LESSON 3, PRACTICE 8 SOLUTION                          *;
***********************************************************;

proc sort data=pg1.np_summary out=np_sort;
	by Reg descending DayVisits;
	where Type="NP";
run;


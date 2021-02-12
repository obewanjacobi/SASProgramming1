***********************************************************;
*  LESSON 3, PRACTICE 4 SOLUTION                          *;
***********************************************************;

proc print data=pg1.np_summary;
	var Type ParkName;
	where ParkName like '%Preserve%';
run;

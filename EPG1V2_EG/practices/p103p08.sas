***********************************************************;
*  LESSON 3, PRACTICE 8                                   *;
*    a) Modify the PROC SORT step to read PG1.NP_SUMMARY  *;
*       and create a temporary sorted table named         *;
*       NP_SORT.                                          *;
*    b) Add a BY statement to order the data by Reg and   *;
*       descending DayVisits.                             *;
*    c) Add a WHERE statement to select Type equal to NP. *;
*       Submit the program.                               *;
***********************************************************;

proc sort data=pg1.np_summary out=np_sort;
	 by Reg descending DayVisits;
	 where Type = "NP";
run;

* The logs show 51 rows were read from the dataset.
*;


***********************************************************;
*  LESSON 3, PRACTICE 8 Level 2                           *;
*    a) Write a PROC SORT step that creates two tables 
* 	    (park_clean and park_dups), and removes the 
*		duplicate rows.									  *;
*	 b)	Submit the program and view the output data.	  *;
*	 c) How many rows are included in the park_dups table?*;   
***********************************************************;

proc print data=pg1.np_largeparks;
run;

proc sort data=pg1.np_largeparks out=park_clean nodupkey dupout=park_dups;
	 by _all_;
run;

* There are 30 rows in the park_dups table.
*;
***********************************************************;
*  LESSON 2, PRACTICE 2 SOLUTION                          *;
***********************************************************;

*Modify the path if necessary;
proc import datafile="s:/workshop/data/np_traffic.csv" 
			dbms=csv
			out=traffic 
			replace;
	guessingrows=max;
run;

proc contents data=traffic;
run;

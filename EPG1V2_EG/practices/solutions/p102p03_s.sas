***********************************************************;
*  LESSON 2, PRACTICE 3 SOLUTION                          *;
***********************************************************;

*Modify the path if necessary;
proc import datafile="s:/workshop/data/np_traffic.dat" 
			dbms=dlm
			out=traffic2 
			replace;
	guessingrows=3000;
	delimiter="|";
run;

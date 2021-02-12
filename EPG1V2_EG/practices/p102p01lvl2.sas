***********************************************************;
*  LESSON 2, PRACTICE 1 Level 2                           *;
*    a) Write a PROC IMPORT step to read the 			  *;
*       np_traffic.csv file and create the traffic SAS 	  *;
*		table. Add a PROC CONTENTS step to view the 	  *;
*		descriptor portion of the newly created table. 	  *;
*		Submit the program.								  *;
*    b) Examine the data interactively. Scroll down to row*;
* 		37. Notice that the values for ParkName and 	  *;
*		TrafficCounter seem to be truncated.              *;
*	 c) Modify the program to resolve this issue. Submit  *;
*		the program and verify that ParkName and 		  *;
*		TrafficCounter are no longer truncated. 		  *;
***********************************************************;

proc import datafile="&path/np_traffic.csv" replace
			out=work.traffic dbms=csv;
	 guessingrows=max;
run;

proc contents data=traffic;
run;
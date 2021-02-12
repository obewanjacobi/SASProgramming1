***********************************************************;
*  LESSON 3, PRACTICE 9 SOLUTION                          *;
***********************************************************;

proc sort data=pg1.np_largeparks 
		  out=park_clean 
		  dupout=park_dups
		  nodupkey;
	by _all_;
run;

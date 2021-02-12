***********************************************************;
*  LESSON 4, PRACTICE 6 SOLUTION                          *;
***********************************************************;

data np_summary2;
	set pg1.np_summary;
	ParkType=scan(ParkName,-1);
	keep Reg Type ParkName ParkType;
run;

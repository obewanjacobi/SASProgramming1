***********************************************************;
*  LESSON 4, PRACTICE 4 SOLUTION                          *;
***********************************************************;

data np_summary_update;
	set pg1.np_summary;
	keep Reg ParkName DayVisits OtherLodging Acres SqMiles Camping;	
	SqMiles=Acres*.0015625;	
	Camping=sum(OtherCamping,TentCampers,RVCampers,BackcountryCampers);
	format SqMiles comma6. Camping comma10.;
run;

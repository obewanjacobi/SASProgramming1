***********************************************************;
*  LESSON 4, PRACTICE 8 SOLUTION                          *;
***********************************************************;

data parks monuments;
	set pg1.np_summary;
	where type in ('NP', 'NM');
	Campers=sum(OtherCamping, TentCampers, RVCampers, BackcountryCampers);
	format Campers comma17.;
	length ParkType $ 8;
	if type='NP' then do;
		ParkType='Park';
		output parks;
	end;
	else do;
		ParkType='Monument';
		output monuments;
	end;
	keep Reg ParkName DayVisits OtherLodging Campers ParkType;
run;


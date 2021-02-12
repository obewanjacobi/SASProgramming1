***********************************************************;
*  LESSON 5, PRACTICE 2 SOLUTION                          *;
***********************************************************;

/*part a, b*/
title1 'Park Types by Region';
proc freq data=pg1.np_codelookup order=freq;
	tables Type*Region / nocol;
	where Type not like '%Other%';
run;

/*part c*/
title1 'Selected Park Types by Region';
ods graphics on;
proc freq data=pg1.np_codelookup order=freq;
	tables Type*Region /  nocol crosslist 
			plots=freqplot(groupby=row scale=grouppercent orient=horizontal);
	where Type in ('National Historic Site', 'National Monument', 'National Park');
run;
title;

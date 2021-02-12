***********************************************************;
*  LESSON 4, PRACTICE 1 SOLUTION                          *;
***********************************************************;

data eu_occ2016;
	set pg1.eu_occ;
	where YearMon like "2016%";
	format Hotel ShortStay Camp comma17.;
	drop geo;
run;

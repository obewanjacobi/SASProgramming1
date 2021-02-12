***********************************************************;
*  LESSON 4, PRACTICE 5 SOLUTION                          *;
***********************************************************;

data eu_occ_total;
	set pg1.eu_occ;
	Year=substr(YearMon,1,4);
	Month=substr(YearMon,6,2);
	ReportDate=MDY(Month,1,Year);
	Total=sum(Hotel,ShortStay,Camp);
	format Hotel ShortStay Camp Total comma17. reportDate monyy7.;
	keep Country Hotel ShortStay Camp ReportDate Total;
run;

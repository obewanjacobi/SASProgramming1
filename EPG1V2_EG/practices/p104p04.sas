***********************************************************;
*  LESSON 4, PRACTICE 4                                   *;
*    a) Create a new column named SqMiles by multiplying  *;
*       Acres by .0015625.                                *;
*    b) Create a new column named Camping as the sum of   *;
*       OtherCamping, TentCampers, RVCampers, and         *;
*       BackcountryCampers.                               *;
*    c) Format SqMiles and Camping to include commas and  *;
*       zero decimal places.                              *;
*    d) Modify the KEEP statement to include the new      *;
*       columns. Run the program.                         *;
***********************************************************;

data np_summary_update;
	set pg1.np_summary;
	*Add assignment statements;
	SqMiles = Acres *.0015625;
	Camping = sum(OtherCamping, TentCampers, RVCampers, BackcountryCampers);
	format SqMiles Camping comma8.;
	keep Reg ParkName DayVisits OtherLodging Acres SqMiles Camping;	
run;


***********************************************************;
*  LESSON 4, PRACTICE 4 Level 2
*    a) Write a DATA step to create a temporary table 
*		named eu_occ_total that is based on the pg1.eu_occ 
*		table.
*    b) Create the following new columns:
*			Year: the four-digit year extracted from 
*			YearMon
*			Month: the two-digit month extracted from 
*			YearMon
*			ReportDate: the first day of the reporting 
*			month
*			Note: Use the MDY function and the new 
*			Year and Month columns
*			Total: the total nights spent at any 
*			establishment
*    c) Format Hotel, ShortStay, Camp, and Total with 
*		commas. Format ReportDate to display the values in 
*		the form JAN2018.
*    d) Keep Country, Hotel, ShortStay, Camp, ReportDate, 
*		and Total in the new table.
***********************************************************;

/*part a*/
data eu_occ_total;
	set pg1.eu_occ;
run;

/*part b*/
data eu_occ_total;
	set pg1.eu_occ;
	Year = substr(YearMon,1,4);
	Month = substr(YearMon,6,2);
	ReportDate = MDY(Month,1,Year);
	Total = sum(Hotel, ShortStay, Camp);
run;

/*part c*/
data eu_occ_total;
	set eu_occ_total;
	format Hotel ShortStay Camp Total comma20.;
	format ReportDate monyy7.;
run;

/*part d*/
data eu_occ_total;
	set eu_occ_total;
	keep Country Hotel ShortStay Camp ReportDate Total;
run;


***********************************************************;
*  LESSON 3, PRACTICE 10 SOLUTION                         *;
***********************************************************;

proc sort data=pg1.eu_occ(keep=geo country) out=countryList nodupkey;
	 by geo Country;
run;

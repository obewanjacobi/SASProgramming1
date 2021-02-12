***********************************************************;
*  LESSON 2, PRACTICE 1 SOLUTION                          *;
***********************************************************;

*Modify the path if necessary;
proc import datafile="s:/workshop/data/eu_sport_trade.xlsx" 
			dbms=xlsx
			out=eu_sport_trade 
			replace;
run;

proc contents data=eu_sport_trade;
run;


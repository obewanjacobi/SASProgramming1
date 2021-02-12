***********************************************************;
*  LESSON 2, PRACTICE 1                                   *;
*    a) Complete the PROC IMPORT step to read             *;
*       EU_SPORT_TRADE.XLSX. Create a SAS table named     *;
*       EU_SPORT_TRADE and replace the table              *;
*       if it exists.                                     *;
*    b) Modify the PROC CONTENTS code to display the      *;
*       descriptor portion of the EU_SPORT_TRADE table.   *;
*       Submit the program, and then view the output data *;
*       and the results.                                  *;
***********************************************************;

proc import datafile="&path/eu_sport_trade.xlsx" replace
			out=work.eu_sport_trade dbms=xlsx;
run;

proc contents data=eu_sport_trade;
run;
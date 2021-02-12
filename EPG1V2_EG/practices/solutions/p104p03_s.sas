***********************************************************;
*  LESSON 4, PRACTICE 3 SOLUTION                          *;
***********************************************************;

*Before macro variable; 
data mammal; 
    set pg1.np_species; 
    where Category="Mammal"; 
    drop Abundance Seasonality Conservation_Status; 
run; 

proc freq data=mammal; 
    tables Record_Status; 
run;

*Using macro variable;
%let cat=Bird;

data &cat;
	set pg1.np_species;
	where Category="&cat";
	drop Abundance Seasonality Conservation_Status;
run;

proc freq data=&cat;
	tables Record_Status; 
run;

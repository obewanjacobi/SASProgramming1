***********************************************************;
*  LESSON 4, PRACTICE 2 SOLUTION                          *;
***********************************************************;

libname out "s:/workshop/output";

data out.fox;
    set pg1.np_species;
    where Category='Mammal' and Common_Names like '%Fox%' 
        and Common_Names not like '%Squirrel%';    
    drop Category Record_Status Occurrence Nativeness;
run;

proc sort data=out.fox;
    by Common_Names;
run;



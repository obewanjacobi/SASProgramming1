***********************************************************;
*  LESSON 3, PRACTICE 4                                   *;
*  a) Add a WHERE statement to print only the rows where  *;
*     ParkName includes Preserve.                         *;
*  b) Submit the program and verify the generated output. *;
*     Which codes are used for Preserves?                 *;
***********************************************************;

/*part a*/
proc print data=pg1.np_summary;
	var Type ParkName;
	*Add a WHERE statement;
	where ParkName like '%Preserve%';
run;

/*part b*/
* The codes PRE, PRESERVE, AND NPRE are used.


***********************************************************;
*  LESSON 3, PRACTICE 4 Level 2                           *;
*  a) Write a PROC PRINT step to read the pg1.eu_occ 
*	  table. Use a WHERE statement to list rows where 
*	  Hotel, ShortStay, and Camp are missing. Submit the 
*	  program.                         					  *;
*  b) How many rows are included?	  	                  *;
*  c) Modify the WHERE statement to list rows with Hotel 
*	  values greater than 40,000,000. Submit the program. *;
*  d) Which months are included in the report?			  *;
***********************************************************;

/*part a*/
proc print data=pg1.eu_occ;
	 where Hotel is missing and ShortStay is missing and 
           Camp is missing;
run;

/*part b*/
* There are 101 rows that are included.
*;

/*part c*/
proc print data=pg1.eu_occ;
     where Hotel > 40000000;
run;

/*part d*/
* The months July and August are included in the report.
*;


***********************************************************;
*  LESSON 3, PRACTICE 4 Level 3                           *;
*  a) Write a PROC FREQ step to analyze rows from 
*	  pg1.np_species. Include only rows where Species_ID 
*	  starts with YOSE (Yosemite National Park) and 
*	  Category equals Mammal. Generate frequency tables 
*	  for Abundance and Conservation_Status   			  *;
*  b) Write a PROC PRINT step to list the same subset of 
*	  rows from pg1.np_species. Include Species_ID, 
*	  Category, Scientific_Name, and Common_Names in the 
*	  report. Run the program	  	                  	  *;
*  c) How many rows meet the two specified conditions?	  *;
*  d) Create a macro variable named ParkCode to store 
*	  YOSE, and another macro variable named SpeciesCat 
*	  to store Mammal. Modify the code to reference the 
*	  macro variables. Submit the program and confirm that 
*	  the same results are generated.			 		  *;
*  e) Change the values of the macro variables to ZION 
*	  (Zion National Park) and Bird. Submit the program.  *;
*  f) How many rows meet the two specified conditions?	  *;
***********************************************************;

/*part a*/
proc freq data=pg1.np_species;
     tables Abundance Conservation_Status;
     where Species_ID like "YOSE%" and Category="Mammal";
run;

/*part b*/
proc print data=pg1.np_species;
     var Species_ID Category Scientific_Name Common_Names;
     where Species_ID like "YOSE%" and Category="Mammal";
run;

/*part c*/
* 16 rows meet the specified conditions.
*;

/*part d*/
%let ParkCode=YOSE;
%let SpeciesCat=Mammal;

proc freq data=pg1.np_species;
     tables Abundance Conservation_Status;
     where Species_ID like "&ParkCode%" and Category="&SpeciesCat";
run;

proc print data=pg1.np_species;
     var Species_ID Category Scientific_Name Common_Names;
     where Species_ID like "&ParkCode%" and Category="&SpeciesCat";
run;

* The results are the same.
*;

/*part e*/
%let ParkCode=ZION;
%let SpeciesCat=Bird;

proc freq data=pg1.np_species;
     tables Abundance Conservation_Status;
     where Species_ID like "&ParkCode%" and Category="&SpeciesCat";
run;

proc print data=pg1.np_species;
     var Species_ID Category Scientific_Name Common_Names;
     where Species_ID like "&ParkCode%" and Category="&SpeciesCat";
run;

/*part f*/
* 46 rows
*;
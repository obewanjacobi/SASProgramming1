***********************************************************;
*  LESSON 2, PRACTICE 1                                   *;
*    a) Complete the PROC PRINT statement to list the     *;
*       first 20 observations in PG1.NP_SUMMARY.          *;
*    b) Add a VAR statement to include only the following *;
*       variables: Reg, Type, ParkName, DayVisits,        *;
*       TentCampers, and RVCampers. Highlight the step    *;
*       and run the selected code.                        *;
*       Do you observe any possible inconsistencies in    *;
*       the data?                                         *;
*    c) Copy the PROC PRINT step and paste it at the end  *;
*       of the program. Change PRINT to MEANS and remove  *;
*       the OBS= data set option. Modify the VAR          *;
*       statement to calculate summary statistics for     *;
*       DayVisits, TentCampers, and RVCampers. Highlight  *;
*       the step and run the selected code.               *;
*       What is the minimum value for tent campers? Is    *;
*       that value unexpected?                            *;
*    d) Copy the PROC MEANS step and paste it at the end  *;
*       of the program. Change MEANS to UNIVARIATE.       *;
*       Highlight the step and run the selected code.     *;
*       Are there negative values for any of the columns? *;
*    e) Copy the PROC UNIVARIATE step and paste it at the *;
*       end of the program. Change UNIVARIATE to FREQ.    *;
*       Change the VAR statement to a TABLES statement to *;
*       produce frequency tables for Reg and Type.        *;
*       Highlight the step and run the selected code.     *;
*       Are there any lowercase codes? Are there any      *;
*       codes that occur only once in the table?          *;
*    f) Add comments before each step to document the     *;
*       program. Save the program as np_validate.sas in   *;
*       the output folder.                                *;
***********************************************************;

/* part a */
proc print data=pg1.np_summary (obs=20);
run;

/* part b */
proc print data=pg1.np_summary ;
	 var Reg Type ParkName DayVisits TentCampers RVCampers;
run;

* Things to note:
* we have PRE and PRESERVE as a type. Seems like Type is just gonna be an
* issue in a lot of ways (Riverways vs RVR, and probably more)
* My impulse says that DayVisits should be Tent + RV campers, but that 
* doesn't seem to be the case.
*;

/* part c */
proc means data=pg1.np_summary ;
	 var DayVisits TentCampers RVCampers;
run;

* The minimum number of tent campers is 0, which makes sense;

/* part d */
proc univariate data=pg1.np_summary ;
	 var DayVisits TentCampers RVCampers;
run;

* no negative values found;

/* part e */
proc freq data=pg1.np_summary ;
	 tables Reg Type;
run;

* There are no lowercase codes, however there are codes that occur only once.
* The problem codes are actually the ones we mentioned earlier, so we 
* expected this.
*;



***********************************************************;
*  LESSON 2, PRACTICE 1 Level 2                           *;
*    a) Write a PROC FREQ step to produce frequency 
*		tables for the Reg and Type columns in the 
*		pg1.np_summary table. Submit the step and look 
*		for invalid values.          					  *;
*    b) What invalid values exist for Reg?				  *; 
*    c) What invalid values exist for Type?               *;
*    d) Write a PROC UNIVARIATE step to generate 
*		statistics for the Acres column in the 
*		pg1.np_summary table. Submit the step. 			  *;
*    e) What are the observation numbers for the smallest 
*		park and the largest park?          			  *;
*    f) View the pg1.np_summary table to identify the 
*		name and size of the smallest and largest parks.  *;
***********************************************************;

/* part a */
proc freq data=pg1.np_summary ;
	 tables Reg Type;
run;

/* part b */
* Reg values are all correct;
/* part c */
* Type has quite a few invalid values, those being:
* NPRE, PRESERVE, and RIVERWAYS
*;

/* part d */
proc univariate data=pg1.np_summary;
	 var Acres;
run;

/* part e */
* The smallest park has 78 observations and the largest has 6.
*;

/* part f */
* The smallest park is the African Burial Ground Monument with .35 acres.
* The largest park is the Noatak National Preserve with 65,87,071 acres. 
*;
***********************************************************;
*  Activity 4.08                                          *;
*    1) Run the program and examine the results. Why is   *;
*       Ocean truncated? What value is assigned when      *;
*       Basin='na'?                                       *;
*    2) Modify the program to add a LENGTH statement to   *;
*       declare the name, type, and length of Ocean       *;
*       before the column is created.                     *;
*    3) Add an assignment statement after the KEEP        *;
*       statement to convert Basin to uppercase. Run the  *;
*       program.                                          *;
*    4) Move the LENGTH statement to the end of the DATA  *;
*       step. Run the program. Does it matter where the   *;
*       LENGTH statement is in the DATA step?             *;
***********************************************************;
*  Syntax                                                 *;
*       LENGTH char-column $ length;                      *;
***********************************************************;

/*1*/
data storm_summary2;
	set pg1.storm_summary;
	*Add a LENGTH statement;
	keep Basin Season Name MaxWindMPH Ocean;
	*Add assignment statement;
	OceanCode=substr(Basin,2,1);
	if OceanCode="I" then Ocean="Indian";
	else if OceanCode="A" then Ocean="Atlantic";
	else Ocean="Pacific";
run;

* Ocean is truncated because the first assignment statement assigns the 
* character "Indian" which assigns the length to the column.
*;

/*2-3*/
data storm_summary2;
	set pg1.storm_summary;
	length Ocean $ 8;
	keep Basin Season Name MaxWindMPH Ocean;
	Basin = upcase(Basin);
	OceanCode=substr(Basin,2,1);
	if OceanCode="I" then Ocean="Indian";
	else if OceanCode="A" then Ocean="Atlantic";
	else Ocean="Pacific";
run;

/*4*/
data storm_summary2;
	set pg1.storm_summary;
	keep Basin Season Name MaxWindMPH Ocean;
	Basin = upcase(Basin);
	OceanCode=substr(Basin,2,1);
	if OceanCode="I" then Ocean="Indian";
	else if OceanCode="A" then Ocean="Atlantic";
	else Ocean="Pacific";
	length Ocean $ 8;
run;

* Yes the ordering does matter here. Even the logs warn us that the
* length of the Ocean character variable has already been set.
*;

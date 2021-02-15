***********************************************************;
*  LESSON 4, PRACTICE 7                                   *;
*    a) Submit the program and view the generated output. *;
*    b) In the DATA step, use IF-THEN/ELSE statements to  *;
*       create a new column, ParkType, based on the value *;
*       of Type.                                          *;
*       NM -> Monument                                    *;
*       NP -> Park                                        *;
*       NPRE, PRE, or PRESERVE -> Preserve                *;
*       NS -> Seashore                                    *;
*       RVR or RIVERWAYS -> River                         *;
*    c) Modify the PROC FREQ step to generate a frequency *;
*       report for ParkType.                              *;
***********************************************************;

data park_type;
	set pg1.np_summary;
	*Add IF-THEN-ELSE statements;
run;

proc freq data=park_type;
	tables Type;
run;

/*part b*/
data park_type;
	set pg1.np_summary;
	*Add IF-THEN-ELSE statements;
	if Type = 'NM' then ParkType = 'Monument';
	else if Type = 'NP' then ParkType = 'Park';
	else if Type =: 'PRE' then ParkType = 'Preserve';
	*Note 'like' does not work in if statements, instead use =:; 
	else if Type = 'NS' then ParkType = 'Seashore';
	else if Type = 'RVR' or Type = 'RIVERWAYS' then ParkType = 'River';
	else ParkType = .;
run;

/*part c*/
proc freq data=park_type;
	tables ParkType;
run;



***********************************************************;
*  LESSON 4, PRACTICE 7 Level 2
*    a) Write a DATA step to create two temporary tables, 
*		named parks and monuments, that are based on the 
*		pg1.np_summary table. Read only national parks or 
*		monuments from the input table. (Type is either NP 
*		or NM.)
*    b) Create a new column named Campers that is the sum 
*		of all columns that contain counts of campers. 
*		Format the column to include commas.
*    c) When Type is NP, create a new column named 
*		ParkType that is equal to Park, and write the row 
*		to the parks table. When Type is NM, assign 
*		ParkType as Monument and write the row to the 
*		monuments table.
*	 d) Keep Reg, ParkName, DayVisits, OtherLodging, 
*		Campers, and ParkType in both output tables. 
*		Submit the program and view the output data.
*	 e) How many rows are in each table?
***********************************************************;

/*part a*/
data parks monuments;
    set pg1.np_summary;
    where type in ('NP', 'NM');
run;

/*part b*/
data parks monuments;
    set pg1.np_summary;
    where type in ('NM', 'NP');
    Campers=sum(OtherCamping, TentCampers, RVCampers,
                BackcountryCampers);
    format Campers comma17.;
run;

/*part c*/
data parks monuments;
    set pg1.np_summary;
    where type in ('NM', 'NP');
    Campers=sum(OtherCamping, TentCampers, RVCampers,
                BackcountryCampers);
    format Campers comma17.;
    length ParkType $ 8;
    if type='NP' then do;
        ParkType='Park';
        output parks;
    end;
    else do;
        ParkType='Monument';
        output monuments;
    end;
run;

/*part d*/
data parks monuments;
    set pg1.np_summary;
    where type in ('NM', 'NP');
    Campers=sum(OtherCamping, TentCampers, RVCampers,
                BackcountryCampers);
    format Campers comma17.;
    length ParkType $ 8;
    if type='NP' then do;
        ParkType='Park';
        output parks;
    end;
    else do;
        ParkType='Monument';
        output monuments;
    end;
    keep Reg ParkName DayVisits OtherLodging Campers ParkType;
run;

/*part e*/
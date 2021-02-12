***********************************************************;
*  Exploring Automatic SAS Libraries                      *;
***********************************************************;
*  Syntax                                                 *;
*                                                         *;
*    Work library - personal temporary tables             *;
*    Sashelp library - sample tables                      *;
*                                                         *;
*    WORK is the default library                          *;
*    **equivalent statements**                            *;
*    proc contents data=work.class;                       *;
*    proc contents data=class;                            *;
***********************************************************;

***********************************************************;
*  Demo                                                   *;
*  1) Run the demo program and use the navigation pane to *; 
*     examine the contents of the Work and out libraries. *;
*  2) Which table is in the Work library? Which table is  *;
*     in the out library?                                 *;
*  3) Restart SAS.                                        *;
*     a) Enterprise Guide: In the Servers list, select    *;
*        Local, right-click, and select Disconnect.       *;
*        Expand Local to start SAS again, and then expand *;
*        Libraries.                                       *;
*     b) SAS Studio: Select More application options ->   *;
*        Reset SAS Session.                               *;
*  4) Discuss the following questions:                    *;
*     a) What is in the Work library?                     *;
*     b) Why are the out and pg1 libraries not available? *;
*     c) Is class_copy2 saved permanently?                *;
*     d) What must be done to re-establish the out        *;
*        library?                                         *;
*  5) To re-establish the pg1 library, open and run the   *;
*     libname.sas program that was saved previously in    *;
*     the main course files folder.                       *;
***********************************************************;

*Modify the path if necessary;
libname out "C:\Users\JNT1372\Documents\Learning SAS\SAS Programming 1\EPG1V2_EG\output";

data class_copy1 out.class_copy2;
	set sashelp.class;
run;

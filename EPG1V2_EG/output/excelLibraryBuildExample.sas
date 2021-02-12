*Building a library from Excel Docs;
*Data in the library is from the np_info.xlsx file;

libname np xlsx "&path/np_info.xlsx";
options validvarname=v7;

*remember to do data = !! I forgot and got some wonky errors;
proc contents data=np.parks;
run;

*removing the library when finished;
libname np clear;
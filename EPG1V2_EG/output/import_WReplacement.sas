*The importance of this script is to teach us how the `replace` option is
necessary to refresh and rerun any data import;
proc import datafile="&path/storm_damage.tab"
            dbms=tab out=storm_damage_tab replace;
run;
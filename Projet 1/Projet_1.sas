 /*    B 1-2-3   */

data Africa;
infile "/folders/myfolders/SAS_ESSAI_Projects/P1/African_Data.csv"  dlm=";" firstobs=2 ;
length name $ 12 Lang $ 13 Money $ 18 ;
input Name $ PIB  Pop_Total  Lang $ Money $;
PIB_Hb = PIB/ POP_Total;
run;

libname Prjct_d '/folders/myfolders/SAS_ESSAI_Projects/P1';
data Prjct_d.Afrique ;
set africa;
run ;

/*********************************************/
/*         C 1     					*/

proc freq data =Africa ;
run;
/************************************************/
/*  C 2   				*/

proc means data=prjct_d.afrique mean;
var Pop_Total;
class Lang ;
 where Lang ="French";

run;
 /*  C 3   				*/
proc means data=prjct_d.afrique mean;
var PIB;
class Lang ;
 where Lang ="English";
run;
/*  C 4  				*/
proc means data=prjct_d.afrique std ;
var Pop_Total;
class Lang ;
 where Lang ="Arabic";
run;
/*  C 5   				*/

proc means data=prjct_d.afrique mean;
var PIB;
class Lang 
run;
/****    D 1   ************/
data PIB ; set prjct_d.afrique ;
 by descending PIB  ;
run;
/****    D 2   ************/
data PIB1 sort by   PIB_Hb    ; 
set prjct_d.afrique (obs =1);
run;

/****    D 3   ************/
data PIB1 sort by   Pop_Total    ; set prjct_d.afrique (obs =1);
 where Lang= "French";
run;




;
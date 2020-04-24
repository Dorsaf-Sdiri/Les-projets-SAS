/*		A 1 		**/
libname Data '/folders/myfolders/SAS_ESSAI_Projects/P2' ;
/*  A  2			*/
data Data.data_p2 ;
infile '/folders/myfolders/SAS_ESSAI_Projects/P2/data_p2.txt'  delimiter= "	"  firstobs=2;
 length pays $12 Religion $ 12 lang $ 12 ;
input  id	Pays $	Pop	PIB	lang	$ Religion $;
run;

/*			A  3   */
DATA Data.Africa_A;
length Country $ 11  ;
input Country $ Pop Lang $ GDP ;
datalines ;
Tunisia 11118000 Ar 46995 
Nigeria 18264000 Eg 568508
Morroco 33680000 Ar 107005
Algeria 39903000 Ar 214063
SouthAfrica 54957000 Eg 352817
;
run;
 /*******           4      *******/
libname New_L '/folders/myfolders/SAS_ESSAI_Projects/P2' ;
data New_L.Data_P2_10 ;
set Data.data_p2 (obs=10);
run;
/****				B 1				******/
proc means data =data.data_p2 sum;
var   Pop;
class Religion;
where Religion ="Islam" ;
run;
/****				B 2				******/
data Data.data_p2 ;
set Data.data_p2;
keep id	Pays 	Pop	PIB	lang	  Religion  pib_p ;
pib_p =  PIB/POP ;

run;
proc means data =Data.data_p2   ;
class Pays;
var pib_p;
where lang ="Portuguese" ;
run;
/****				B 3				*****/ 
proc freq data =Data.data_p2;
tables lang;
run;
/****				B 4				*****/ 

proc means data =Data.data_p2  mean;
 class lang   Religion pays ;
 var pib_p ;
where lang = "French" and Religion ="Islam";
run;


/******  C1       ******/
proc freq  data =data.data_p2 ; 

tables lang;
run;


/********* C2      ****/

proc freq  data =data.data_p2 ; 

tables religion;
run;


Data Examples;
informat books $char10.
price comma8.
City $upcase8.
profit percent2.
open_time TIME5.;
input books price city profit open_time ;
datalines ;
Bigdata 2,562 tunis 10% 10:30
smalldata 845,521 paris 12% 9:20
onlydata 588,412 newyork 9% 10:00
justdata (5008) tokyo 55% 6:00
;
run ;
data Examples;
input Code Langue $ birthdate salaire grade;
datalines;
1254 ARB 14120 11000 2
9936 FRA 14169 5000 0
7529 ANG 14187 9000 1
9154 FRA 14208 10000 2
;
run;

proc format ;
value $lg 'ARB' ='Arabe'
'FRA' = 'français'
'ANG' = 'Anglais' ;
value grade 
0= 'BAC'
1= 'BAC + 1'
2= 'BAC + 2';
run;
data new ;
set Examples ;
format Langue $lg.
birthdate date9.
salaire dollar9.2
grade $grade.
;
run;
data pays ;
input code_ville ville $ PIB ;
datalines;
2 tunis 22000
1 newyork 30000
4 newdelhi 902000
3 tokyo 25000
;
run;
data pop_pays;
input code_ville pop_1990 pop_2010;
datalines;
3 75000 76000 77000
1 40000 40500 41000
4 92152 92999 100000
2 45000 45400 45800
;
run;
proc sql;
create table details_pop as
select *
from pays,pop_pays
where pays.code_ville =pop_pays.code_ville
order by pays.code_ville;
quit;
proc sql;
select *
from work.details_pop
where pop_1990> 50000;
quit;

data Data_P5;
INFILE 'C:\Users\TOSHIBA PC\Data_p5.csv' dlm=';' firstobs=2;
LENGTH Region$15 Product$15 Subsidiary$20 ;
Input Region$ Product$ Subsidiary$ Stores Sales Inventory Returns;
Run;
LIBNAME P5'C:\';
SET Data_P5;
Run;
proc contents data=Data_P5;
Run;
proc tabulate data =Data_P5;
Class Region Subsidiary Product;
var Sales (drop= Sport Shoe);
where Region="Africa";
table Region*Subsidiary (Drop =Seoul) ,Product*mean=''/rts=20;
Run;
proc tabulate data =Data_P5;
var Stores Sales Inventory Returns;
table variables,Labels,N,mean=' ',std =' ',min=' ',max=' ';
Run;
proc boxplot data=Data_P5;
plot returns*Region;
run;
proc sgplot data=Data_P5;
histogram returns ;
run;
proc sgplot data =Data_P5;
scatter y=sales x=returns;
run;
proc univariate data=Data_P5;
var Sales;
run;





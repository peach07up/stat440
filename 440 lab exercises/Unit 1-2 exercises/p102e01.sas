options linesize=95 pagesize=52;

data work.country;
   length Country_Code $ 2 Country_Name $ 48;
   infile 'country.dat' dlm='!';
   input Country_Code $ Country_Name $;
run;

proc print data=work.country;
run;

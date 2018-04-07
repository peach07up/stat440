data work.SalesEmps;
   length Job_Title $ 25;
   infile 'sales.csv' dlm=',';
   input Employee_ID First_Name $ Last_Name $ 
         Gender $ Salary Job_Title $ Country $;
run;

goptions reset=all;
proc gchart data=work.SalesEmps;
   vbar3d Job_Title / sumvar=Salary type=mean;
   hbar Job_Title / group=Gender sumvar=Salary 
                    patternid=midpoint;
   pie3d Job_Title / noheading;
   where Job_Title contains 'Sales Rep';
   label Job_Title='Job Title';
   format Salary dollar12.;
   title 'Orion Star Sales Employees';
run;
quit;

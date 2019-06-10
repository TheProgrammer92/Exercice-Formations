clear screen;


-- suppression des tables
drop table emp;
drop table  emp2;

drop table dept;




create table DEPT (
  DEPTNO integer primary key not null,
  DNAME varchar(24),
  LOC varchar(24));

--creation des table
create table EMP (
  EMPNO number(4) not null primary key,
  ENAME varchar2(15),
  JOB varchar2(15),
  MGR  number(4),
  HIREDATE DATE,
  SAL decimal,
  COMM number(7,2),
  DEPTNO integer,
  
  foreign key (DEPTNO) references DEPT (DEPTNO)
  

);


create table emp2 as select * from emp;

set serveroutput on;


declare

 
 actualSal float;
 sommeTotal float;

 departementName varchar(50);
 i int;
 counter int;

 
 nbrHightSalary int;
 
 
 firstQuart int;
 secondQuart int;
 minHightSalary int;

 cursor hightSalaryCursor  is select * from emp2  order by sal asc;
 ligne hightSalaryCursor%rowtype;


begin

--    insertion dans la table emp2 
 
     proc_insert_table_emp2();
     
     
     minHightSalary := 2000;
     
     select count(*) into nbrHightSalary from emp2 where sal >minHightSalary;
    
    
    counter :=0;
    firstQuart := ROUND(0.25 * nbrHightSalary); --le first quart
    secondQuart := ROUND(0.5* nbrHightSalary); --le second quart
     counter:=1; 
 
     sommeTotal:=0;
     
    dbms_output.put_line( 'count = '||nbrHightSalary || '      firstQuart =  ' ||firstQuart|| '      secondQuart = ' ||secondQuart);
     
      open hightSalaryCursor;
     loop
      fetch hightSalaryCursor into ligne;
          
           exit when hightSalaryCursor%NOTFOUND;
            
           if (counter<firstQuart and ligne.sal >minHightSalary) then
                 -- recuperation e la sommeTotal dans cette 
                  sommeTotal := sommeTotal + func_refactor_show_bd(ligne.empno,ligne.deptno,4);
               
       
                counter := counter +1;
              
          elsif  (counter>firstQuart and counter <secondQuart and  ligne.sal >minHightSalary) then
            
            
                sommeTotal := sommeTotal +  func_refactor_show_bd(ligne.empno,ligne.deptno,6);
               

                counter := counter +1;
          else 
                   sommeTotal:= sommeTotal +  func_refactor_show_bd(ligne.empno,ligne.deptno,8);
               
                 

                counter := counter +1;
           end if;
      
       
   
    
     end loop;
     
    close hightSalaryCursor;

  
  
 
  dbms_output.put_line( '');
  dbms_output.put_line( '---------------------------------------------------');
  dbms_output.put_line( '---------------------------------------------------');
  
  dbms_output.put_line('LE MONTANT TOTAL DE L"AUGMENTATION DES SALAIRES EST    : ' || sommeTotal);


end;
/
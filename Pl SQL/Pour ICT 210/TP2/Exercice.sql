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
 

 cursor hightSalaryCursor  is select * from emp2  order by sal asc;
 ligne hightSalaryCursor%rowtype;


begin

--    insertion dans la table emp2 
    FOR j IN 1..20 LOOP
    
        insert into DEPT values (j , CONCAT( 'departement ',j),concat('loc ',j+1));
        insert into emp2 values (j, 'jesbe','franc',22,SYSDATE, 5000, 22,j);
     
        
     END LOOP;
     
     select count(*) into nbrHightSalary from emp2 where sal >400;
    
    
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
            
           if (counter<firstQuart) then
                 
                 select dname into departementName from dept where deptno = ligne.deptno;
                 actualSal := (ligne.sal*100)/4;
                 dbms_output.put_line( 'Avant ----- nom = '|| ligne.ename || '      Departement =  ' ||ligne.deptno|| '      salaire = ' || ligne.sal);
         
                    update emp2 set sal = actualsal where empno = ligne.empno;

                 dbms_output.put_line( 'Apres ----- nom = '|| ligne.ename || '      Departement =  '  || departementName ||   '      salaire = ' ||actualsal);
                 dbms_output.put_line( '---------------------------------------------------');
          
                  sommeTotal := sommeTotal + (actualsal - ligne.sal);  
                  --salaire qui a été augment

                  counter := counter +1;
              
          elsif  (counter>firstQuart and counter <secondQuart) then
            
                select dname into departementName from dept where deptno = ligne.deptno;
                 actualSal :=  (ligne.sal*100)/6;
                 dbms_output.put_line( 'Avant ----- nom = '|| ligne.ename || '      Departement =  ' || departementName|| '      salaire = ' || ligne.sal);
         
                    update emp2 set sal = actualsal where empno = ligne.empno;

                 dbms_output.put_line( 'Apres ----- nom = '|| ligne.ename || '      Departement =  '  || departementName ||   '      salaire = ' ||actualsal);
                 dbms_output.put_line( '---------------------------------------------------');
          
                  sommeTotal := sommeTotal + (actualsal - ligne.sal);  
                  --salaire qui a été augment

                counter := counter +1;
          else 
                   select dname into departementName from dept where deptno = ligne.deptno;
                 actualSal :=  (ligne.sal*100)/8;
                 dbms_output.put_line( 'Avant ----- nom = '|| ligne.ename || '      Departement =  ' || departementName|| '      salaire = ' || ligne.sal);
         
                    update emp2 set sal = actualsal where empno = ligne.empno;

                 dbms_output.put_line( 'Apres ----- nom = '|| ligne.ename || '      Departement =  '  || departementName ||   '      salaire = ' ||actualsal);
                 dbms_output.put_line( '---------------------------------------------------');
          
                  sommeTotal := sommeTotal + (actualsal - ligne.sal);  
                  --salaire qui a été augment

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
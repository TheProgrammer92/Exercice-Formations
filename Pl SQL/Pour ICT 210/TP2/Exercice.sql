clear screen;


-- suppression des tables
drop table dept;
drop table emp;
drop table  emp2;


--creation des table
create table EMP (
  EMPNO number(4) not null primary key,
  ENAME varchar2(15),
  JOB varchar2(15),
  MGR  number(4),
  HIREDATE DATE,
  SAL number(7,2),
  COMM number(7,2),
  DEPTNO number(2)
);


create table DEPT (
  DEPTNO integer primary key not null,
  DNAME varchar(14),
  LOC varchar(13));


create table emp2 as select * from emp;

set serveroutput on;


declare

 employeeNbr number;
 
 firstQuart int;
 secondQuart int;
 rest int;
 
 firstSal float;
 secondSal float;
 restSal float;
 actualSal float;
 sommeTotal float;
 
 
 nom varchar(100);
 sal float;
 totalMount float;
 departementName varchar(50);

 
 
 i int;
 counter int;
 
 cursor monCur  is select * from emp2;
 ligne monCur%rowtype;

begin
--  ouverture du cursor  

   
--    insertion dans la table emp2 
    FOR j IN 1..20 LOOP
        
        insert into emp2 values (j, 'jesbe','franc',22,SYSDATE, 30, 22,33);
     
        insert into dept values (j , CONCAT( 'departement ',j),concat('loc ',j+1));
     END LOOP;
     
   

    open monCur;
    
--  selection du nombre demployé dans la table
    select count(*) into employeeNbr from emp2;
    
--  recuperation du premier quart, second et reste
  firstQuart := 0.25 * employeeNbr;
  secondQuart := 0.5 * employeeNbr;
  rest :=employeeNbr - (firstQuart+secondQuart);
  
 counter:=1;
 
sommeTotal:=0;
  
  
  loop
      fetch monCur into ligne;
      
      
      exit when monCur%NOTFOUND;
  
    

      if counter<=firstQuart then
      
--         recuperation du departement

           select dname into departementName from dept where deptno = counter;
         
         
--        augmentation des salaire (update)

         actualSal :=  (ligne.sal*100)/4;
         dbms_output.put_line( 'Avant ----- nom = '|| ligne.ename || '      Departement =  ' || departementName|| '      salaire = ' || ligne.sal);
         
         update emp2 set sal = actualsal where empno = counter;

          dbms_output.put_line( 'Apres ----- nom = '|| ligne.ename || '      Departement =  '  || departementName ||   '      salaire = ' ||actualsal);
          dbms_output.put_line( '---------------------------------------------------');
         
         
        
         sommeTotal := sommeTotal + (actualsal - ligne.sal); 
         --salaire qui a été augmenté
         counter := counter +1;
         
      elsif (counter>firstQuart and counter < secondQuart) then
        select dname into departementName from dept where deptno = counter;
         
         actualSal :=  (ligne.sal*100)/6;
         
         
             dbms_output.put_line( 'Avant ----- nom = '|| ligne.ename || '      Departement =  ' || departementName|| '      salaire = ' || ligne.sal);
         
         update emp2 set sal = actualsal where empno = counter;

          dbms_output.put_line( 'Apres ----- nom = '|| ligne.ename || '      Departement =  '  || departementName ||   '      salaire = ' ||actualsal);
          dbms_output.put_line( '---------------------------------------------------');
          
            sommeTotal := sommeTotal + (actualsal - ligne.sal);  
            --salaire qui a été augment

         counter := counter +1;
      else 
          select dname into departementName from dept where deptno = counter;
         
          actualSal :=  (ligne.sal*100)/8;
            dbms_output.put_line( 'Avant ----- nom = '|| ligne.ename || '      Departement =  ' || departementName|| '      salaire = ' || ligne.sal);
         
         update emp2 set sal = actualsal where empno = counter;

          dbms_output.put_line( 'Apres ----- nom = '|| ligne.ename || '      Departement =  '  || departementName ||   '      salaire = ' ||actualsal);
          dbms_output.put_line( '---------------------------------------------------');
            sommeTotal := sommeTotal + (actualsal - ligne.sal);  
            --salaire qui a été augmenté

         counter := counter +1;
      
      end if;
      
      
  end loop;
  dbms_output.put_line( '');
  dbms_output.put_line( '---------------------------------------------------');
  dbms_output.put_line( '---------------------------------------------------');
  
  dbms_output.put_line('LE MONTANT TOTAL DE L"AUGMENTATION DES SALAIRES EST    : ' || sommeTotal);
  
  close monCur;


end;
/
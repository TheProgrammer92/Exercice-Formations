
clear screen;

create or replace function func_refactor_show_bd(empn IN EMP2.empno%Type,deptn IN EMP2.deptno%Type,montantPourcent number) return float is 

 actualsal number;
 departementName varchar2(55);
 enames varchar2(55);
 salaire number;
 sommeTotal float;
 
begin
  sommeTotal :=0;
   select dname into departementName from dept where deptno = deptn;
  select sal into salaire from emp2 where empno = empn;
   select ename into enames from emp2 where empno = empn;


   
                 actualSal := (salaire*100)/montantPourcent;
                 dbms_output.put_line('empno ' || empn || ' deptn ' || deptn);
                 dbms_output.put_line( 'Avant ----- nom = '|| enames || '      Departement =  ' ||departementName|| '      salaire = ' || salaire);
         
                    update emp2 set sal = actualsal where empno =empn;

                 dbms_output.put_line( 'Apres ----- nom = '|| enames || '      Departement =  '  || departementName ||   '      salaire = ' ||actualsal);
                 dbms_output.put_line( '---------------------------------------------------');
          
                  sommeTotal :=actualsal - salaire;  
                  --salaire qui a été augment

               
    return sommeTotal;
end;


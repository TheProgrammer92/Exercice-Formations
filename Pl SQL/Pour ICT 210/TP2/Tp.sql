--create table emp2 as select * from emp;

/*insert into emp2 values (18, 'jesbe','franc',22,'17/01', 30, 22,33);*/


truncate table emp2;

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
 
 
 nom varchar(100);
 sal float;
 totalMount float;
 departementName varchar(50);
 
 
 i int;
 counter int;
 cursor monCur  is select * from emp2;
 ligne monCur%rowtype;

begin
--  ouverturedu cursor  

   
    
    FOR j IN 1..20 LOOP
        
        insert into emp2 values (j, 'jesbe','franc',22,'17/01', 30, 22,33);
     END LOOP;
     
   

    open monCur;
    
--  selection du nombre demployé
    select count(*) into employeeNbr from emp2;
    
--  recuperation du premier quart, second et reste
  firstQuart := 0.25 * employeeNbr;
  secondQuart := 0.5 * employeeNbr;
  rest :=employeeNbr - (firstQuart+secondQuart);
  
 counter:=1;
  
  
  loop
      fetch monCur into ligne;
      exit when monCur%NOTFOUND;
  
    

      if counter<=firstQuart then
         
         
--          augmentation des salaire (update)

         actualSal :=  (ligne.sal*100)/4;
         dbms_output.put_line( 'nom = '|| ligne.ename || '      salaire = ' || ligne.sal);
         
         update emp2 set sal = actualsal where empno = counter;

          dbms_output.put_line( 'nom = '|| ligne.ename || '      salaire = ' ||actualsal);
          
         counter := counter +1;
         
      elsif (counter>firstQuart and counter < secondQuart) then
      
         actualSal :=  (ligne.sal*100)/6;
         
         
           dbms_output.put_line( 'nom = '|| ligne.ename || '      salaire = ' || ligne.sal);
         update emp2 set sal = actualsal where empno = counter;
           dbms_output.put_line( 'nom = '|| ligne.ename || '      salaire = ' || actualsal);

       
         counter := counter +1;
      else 
          actualSal :=  (ligne.sal*100)/8;
           dbms_output.put_line( 'nom = '|| ligne.ename || '      salaire = ' || ligne.sal);
         update emp2 set sal = actualsal where empno = counter;
           dbms_output.put_line( 'nom = '|| ligne.ename || '      salaire = ' ||actualsal);

         counter := counter +1;
      
      end if;
      
      
  end loop;
  close monCur;


end;
/
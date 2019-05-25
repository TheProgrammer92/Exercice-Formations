

--exercice 3


--exercice 3

set serveroutput on
declare

 somme number;

begin
  
  
   somme :=0;
  
  FOR i IN 1000..10000 LOOP
        somme  := i+ somme;

   END LOOP;
  
  dbms_output.put_line('la somme des nombre est ' || somme);


end;
/
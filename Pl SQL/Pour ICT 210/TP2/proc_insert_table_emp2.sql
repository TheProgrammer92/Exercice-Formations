

clear screen; 

create or replace procedure proc_insert_table_emp2 is

begin
  FOR j IN 1..20 LOOP
    
        insert into DEPT values (j , CONCAT( 'departement ',j),concat('loc ',j+1));
        insert into emp2 values (j, 'jesbe','franc',22,SYSDATE, DBMS_RANDOM.VALUE(500,5000), 22,j);
     
        
     END LOOP;
end;

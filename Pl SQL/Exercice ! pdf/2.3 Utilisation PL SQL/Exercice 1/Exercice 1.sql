clear screen;
truncate table clients;
set serveroutput on;

declare 

 i int;
begin
  
  
  for  i in 1..21 loop
  
      insert into clients ( numero_cli,nom, prenom) values(i,((select nom from personne where numpers =i)), (select prenom from personne where numpers = i));
  
  end loop;
  
  
end;
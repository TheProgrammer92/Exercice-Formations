clear screen;
create or replace procedure puissance(nbre number, puiss number) is
  counts number ;
  cobail number;

  
  begin 
      
      cobail := nbre;
      counts :=1;
     
     loop 
      
            cobail := nbre * cobail;
      exit when  counts >= (puiss-1);
     
       counts:= counts+1;
     
     end loop;
     
     dbms_output.put_line(cobail);
     
   
  end;
  /
execute puissance(4);

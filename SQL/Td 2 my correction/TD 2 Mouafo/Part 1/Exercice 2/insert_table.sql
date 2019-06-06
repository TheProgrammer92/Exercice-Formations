  
  
delimiter ^^
	
	drop procedure if exists insert_table_exercice2 ^^
    
    create procedure insert_table_exercice2()
    
    begin
		declare i, j int;
        
        set i =1;
        
        repeat 
        
			insert into  MembreJury values (i,concat('jury',i), concat('fonction',i));
			insert into Styliste values (i, concat('styliste',i), concat('adresse',i));
            insert into Costume values (i,concat('designation',i), i);
          
            insert into NotesJury values (i,(i+1),(i*15));
            insert into Fonction values (i);
         
			set i = i+1;
            
		until i>=20
        end repeat;
    end ^^
delimiter ;


call insert_table_exercice2();
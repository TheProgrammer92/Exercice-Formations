delimiter $$

  drop procedure if exists insert_all_tables;
 
  create procedure insert_all_tables()
  
  begin
 
 
  declare i integer default 0;
  
    set i :=1;
    repeat 
    
      insert into Article (DesArt,PuArt,QteEnStock,SeuilMinimum,SeuilMaximum) values (concat('designation',i),(i*200),i,(i*120),(i*125));
        set i := i+1;
    until i>=20 end repeat;
    
    
  end $$

delimiter ;

DELIMITER  $$
   
   drop procedure if exists insert_all_tables;
  CREATE   PROCEDURE `insert_all_tables`()
  begin

    declare i integer default 0;
  
    set i :=1;
    repeat 
    
      insert into Article (DesArt,PuArt,QteEnStock,SeuilMinimum,SeuilMaximum) values (concat('designation',i),(i*200),i,(i*120),(i*125));
      insert into Commande values (i,now());
      insert into LigneCommande values (i,i,(i*2));
	set i := i+1;
    until i>=20 end repeat;
    
    
  end $$
  
DELIMITER ;
delimiter $$

	drop procedure if exists number_hight $$
    
    create procedure number_hight()
    
    begin
	declare a int;
    
    set @a=(select max(NumCom) from Commande) +1;
    insert into commande values(@a, now());
    
    insert into LigneCommande select @a, NumArt, SeuilMinimum*3
		from Article where QteEnStock <= SeuilMinimum;
		
    end $$
delimiter ;


	
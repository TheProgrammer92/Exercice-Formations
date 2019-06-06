/* je n'ai pas terminé, cet exercice */

delimiter ^^
	
    drop procedure if exists affichage ^^
    
    create procedure affichage ()
    
    begin 
	
        declare numCom int;
        declare dateCom varchar(55);
        
		declare monCur Cursor for select  commande.NumCom, commande.DatCom from commande;
        declare continue handler for not found set done = true;
        open monCur;
        
        fetch monCur into numCom,dateCom ;
			while (not done) do
            
				select numCom,dateCom;
                fetch monCur into numCom,dateCom;
                
			end while;
            close monCur;
        
    end ^^

delimiter ;

call affichage();
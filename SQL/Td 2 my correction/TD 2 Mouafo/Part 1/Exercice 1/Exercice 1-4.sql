delimiter $$
	
   
    drop procedure if exists meilleures_commande_5 $$
     
    create procedure meilleures_commande_5()
    
    begin 
	
			create table T1 as select commande.NumCom as NumCom,DatCom as DatCom,sum(ligneCommande.QteCommandee*article.PuArt) as montant
            from commande , lignecommande, article 
            where commande.NumCom = ligneCommande.NumCom and ligneCommande.NumArt = article.NumArt  
	
            group by PuArt  order by PuArt desc  limit 0,5;
    
    end $$
   
delimiter ;
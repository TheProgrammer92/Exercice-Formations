DELIMITER $$

	drop  procedure if exists montant_commande_10 $$ 
	drop  procedure if exists calcul_commande_10 $$ 
	drop  procedure if exists recup_numArt $$ 
    
    
	create procedure montant_commande_10()
    
    begin 
    declare montant_cmd_10 int;
    
		select sum(lignecommande.QteCommandee * article.PuArt ) as somme into montant_cmd_10 from article,lignecommande where 
        lignecommande.NumCom = 13 and lignecommande.NumArt = article.NumArt;
        
        select concat(" la somme est ", montant_cmd_10);
     
     
		if montant_cmd_10 <100000 then
          select "commande Normale";
		else 
			select "commande speciale";
		end if;

    
  
		
    end $$
DELIMITER ;






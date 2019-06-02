DELIMITER $$


	create procedure recup_numArt(out numArticle integer)
    
    begin 
    declare montant_cmd_10 int;
	select NumCom into montant_cmd_10 from Commande where NumCom =10;
    
    /*recuperation du  numero de l'article dans Ligne commande*/
    select NumArt into numArticle  from LigneCommande where NumComm = montant_cmd_10;
    
		
    end $$
DELIMITER ;






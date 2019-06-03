call recup_numArt(@resultat);
select @resultat;

DELIMITER $$
	 
     /* cette procedure nous renvois le numero de l'article, eu  a   partir de la commande 10 */

	drop procedure if exists recup_numArt;
	create procedure recup_numArt(out numArticle integer)
    
    begin 
		declare montant_cmd_10 int;
		select NumCom into montant_cmd_10 from Commande where NumCom = 10;
		
		/*recuperation du  numero de l'article dans Ligne commande*/
		select NumArt into numArticle  from LigneCommande where NumCom = montant_cmd_10;
		
		
    end $$
DELIMITER ;






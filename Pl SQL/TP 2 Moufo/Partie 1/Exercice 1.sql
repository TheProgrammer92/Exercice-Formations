DELIMITER $$
   
   drop procedure if exists calcul_commande_10;
   
   create procedure calcul_commande_10()

   begin
   declare montant_cmd_10 int;
   declare numCom int;
   declare numArt int;
   declare PuArt int;
   declare QteEnStock int;
  
  
     
     
     /* recuperation de la commande d'article 10 */
     
    select NumCom into montant_cmd_10 from Commande where NumCom =10;
    
    /*recuperation du  numero de l'article dans Ligne commande*/
    select NumArt into numArt  from LigneCommande where NumComm = montant_cmd_10;
    
	declare cursor monCur for select PuArt,QteEnStock, from Article where NumArt = numArt;
	open monCur;
    
    fetch monCur into PuArt,QteEnStock;
    
    select concat('le montant de la commande 10  est ',QteEnStock);
	 
   
   
   end $$

DELIMITER ;




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


DELIMITER $$
   


	drop procedure if exists calcul_commande_10;
	create procedure calcul_commande_10(in numArts integer)

   begin
   declare montant_cmd_10 int;
   declare numCom int;
   declare PuArts int;
   declare QteCommande int;
   declare montant decimal;
   
   
    select PUArt into PuArts from Article where NumArt = numArts;
    select QteCommandee into QteCommande from LigneCommande where NumArt = numArts;

     /* recuperation de la commande d'article 10 */
	
 
    
    set montant := QteCommande * PuArts;
    
   
     if (montant < 100000)  then
       select concat('Commmande Normale  :=  ' , montant);
<<<<<<< HEAD:SQL/Td 2 my correction/TD 2 Mouafo/Part 1/Exercice 1/Prodecure_calcul_commande.sql
   	else 
=======
	 else 
>>>>>>> f3086f90e034182e656515e1bb59f4b781d3eb87:SQL/ICT 210 Mouafo/TD 2 Mouafo/Part 1/Exercice 1/Prodecure_calcul_commande.sql
      
       select concat('Commmande Speciale !!    :=  ' , montant);
   
    end if;
   end $$

DELIMITER ;


call recup_numArt(@resultat);
call calcul_commande_10((@resultat));




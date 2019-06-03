DELIMITER $$


	create procedure recup_numArt(out numArticle integer)
    
    begin 
    declare montant_cmd_10 int;
    
		select commande.*,NumCom.lignecommande,
        NumArt.lignecommande,sum(QteCommandee * PuArt.lignecommande) into montant_cmd_10 where 
        NumCom.commande = NumCom.lignecommande and NumArt.lignecommande = NumArt.article;
        
        select  concat("le montant est", montant_cmd_10);

    
  
		
    end $$
DELIMITER ;






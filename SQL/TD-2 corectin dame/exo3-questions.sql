delimiter $$
drop procedure if exists sp1 $$
create procedure sp1()
begin
	Select NumStagiaire, NomStagiaire 
    From Stagiaire 
    where NumStagiaire not in (Select NumStagiaire from Notation);
end $$
delimiter ;

delimiter $$
drop procedure if exists sp2 $$
create procedure sp2()
begin
	Select Filiere.NumFiliere, NomFiliere 
    from Filiere, Programme
    Where Filiere.numFiliere=Programme.Numfiliere
	Group by Filiere.NumFiliere, NomFiliere
	Having Count(NumModule)>=10;
end $$
delimiter ;

delimiter $$
drop procedure if exists sp3 $$
create procedure sp3(in codSecteur int(5))
begin
	Select NomModule 
    from Module M,Programme P, Filiere F
	Where M.Nummodule=P.NumModule 
		and P.NumFiliere=F.NumFiliere 
        and CodSecteur=@codSecteur
	group by NomModule
	Having count(F.NumFiliere)=(select Count(NumFiliere) 
		from Filiere where CodSecteur=@codSecteur);
end  $$
delimiter ;

delimiter $$
drop procedure if exists sp4 $$
create procedure sp4(in numStagiaire int(5))
begin
	Select Module.NumModule, NomModule, Note,Coefficient
    from Module, Notation,Programme
	Where Notation.NumModule=Module.NumModule 
		and Module.NumModule=Programme.NumModule 
        and NumStagiaire=@numStagiaire;
end $$
delimiter ;

delimiter $$
drop procedure if exists sp5 $$
create procedure sp5()
begin
	Declare NumSta int;
    declare NomPreSta varchar(50);
    declare NomFil varchar(50);
    declare done int default false;
	Declare C1 Cursor for Select NumStagiaire, NomStagiaire + ' ' + PrenomStagiaire,NomFiliere
		from Stagiaire S, Filiere F where S.NumFiliere=F.NumFiliere;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	Open C1 ;
    while not done do
			select 'Nom et Prénom : ' + @NomPreSta + ' Filière : ' + @NomFil;
			if exists (select NumModule from Programme P, Stagiaire S 
						where P.NumFiliere=S.NumFiliere and NumStagiaire=@NumSta 
							and NumModule not in (select NumModule from notation where
									NumStagiaire=@NumSta)) then 
					select 'En cours de traitement';
					
                    select NumModule from Programme P, Stagiaire S 
						where P.NumFiliere=S.NumFiliere 
							and NumStagiaire=@NumSta 
							and NumModule not in (select NumModule from Notation
								where NumStagiaire=@NumSta);
					
                    Fetch from C1 into NumSta, NomPreSta,NomFil;
			end if;
            if (select count(NumModule) from Notation where NumStagiaire =@NumSta and note<3) >2 then
					select  'Notes Eliminatoires';

					Select NomModule from Module M, Notation N 
						where M.NumModule=N.NumModule 
							and NumStagiaire=@NumSta 
							and note <3;
                        
					Fetch from C1 into NumSta, NomPreSta,NomFil;
			end if;
            
            Select NomModule, Coefficient, Note 
				from Module M, Programme P, Notation N, Stagiaire S 
                where M.NumModule=P.NumModule 
					and P.numFiliere=S.NumFiliere 
					and M.NumModule=N.NumModule 
					and N.NumStagiaire=S.NumStagiaire and S.NumStagiaire=@NumSta;

			Select Sum(Note*Coefficient) / Sum(Coefficient) 
				from Module M, Programme P, Notation N, Stagiaire S 
                where M.NumModule=P.NumModule 
					and P.NumFiliere=S.NumFiliere 
                    and M.NumModule=N.NumModule 
                    and N.NumStagiaire=S.NumStagiaire 
                    and S.NumStagiaire=@NumSta;
                    
			Fetch  from C1 into NumSta, NomPreSta, NomFil;
    end while;
    close C1;
end $$
delimiter ;
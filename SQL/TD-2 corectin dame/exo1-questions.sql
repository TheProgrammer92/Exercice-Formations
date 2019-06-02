-- premiere question exo 1
delimiter $$
drop procedure if exists montantCommande10 $$
create procedure montantCommande10 ()
begin
	declare montant decimal;
    set @montant =(select sum(PUArt*QteCommandee) from Commande C, Article A,
		LigneCommande LC where C.NumCom=LC.NumCom and 
        LC.NumArt = A.NumArt and C.NumCom = 10);
	if @monatnt is null then
			select 'cette commande existe pas ou ne possède pas de ingredients';
	else
		if @montant <= 10000 then
			select 'commaande normale';
		else
			select 'commande speciale';
		end if;
	end if;
end $$
delimiter ;

-- deuxième question exo 1
delimiter $$
drop procedure if exists suppressionArticle8 $$
create procedure suppressionArticle8()
begin
	declare Qte int(5);
    set @Qte = (select QteCommandee from LigneCommande where NumCom=5
		and NumArt=8);
	delete from LigneCommande where NumCom=5 and NumArt=8;
    update Article set QteEnStock=QteEnStock+@Qte where NumArt=8;
    if not exists (select numcom from LigneCommande where NumCom=5) then
		delete from Commande where NumCom=5;
	end if;
end $$
delimiter ;

-- troisième question exo 1
delimiter $$
drop procedure if exists listCommande $$
create procedure listCommande()
begin
	
	select  C.NumCom, DatCom,Sum(PUArt*QteCommandee), 
		case
			when Sum(PUArt*QteCommandee)<=10000 then  'commande normale'
			else 'commande speciale'
		end  as 'Type'
	from Commande C, Article A, LigneCommande LC
    where C.NumCom=LC.NumCom and LC.NumArt=A.NumArt
    group by C.NumCom, DatCom;
end $$

delimiter ;

-- quatrième question exo 1
delimiter $$
drop procedure if exists stockage $$
create  procedure stockage()
begin
	drop table if exists T1;
	create table T1(NumCom int, DatCom date, montantCom int);
    insert into T1 select C.NumCom, datCom, sum(PUArt*QteCommandee) as Mt
		from Commande C, Article A, LigneCommande LC
        where C.NumCom = LC.NumCom and LC.NumArt=A.NumArt
        group by C.NumCom, datCom
        order by Mt Desc
        limit 5;
end $$

delimiter ;

-- question 5 exo 1
delimiter $$
drop procedure if exists calcul $$
create procedure calcul()
begin
	declare a int;
    set @a=(select max(NumCom) from Commande) +1;
    insert into commande values(@a, now());
    insert into LigneCommande select @a, NumArt, SeuilMinimum*3
		from Article where QteEnStock <= SeuilMinimum;
end $$

delimiter ;

-- question 6 exo 1 (curseurs)
delimiter $$
drop procedure if exists affichage $$
create procedure affichage()
begin
	declare a int;
    declare b date;
    declare c int;
    declare done int default false;
    declare chaine1 varchar(50);
    declare chaine2 varchar(50);
    declare c1 cursor for select C.NumCom, datCom, sum(PUArt*QteCommandee)
		from Commande C, Article A, LigneCommande LC
        where C.NumCom = LC.NumCom and LC.NumArt = A.NumArt
        group by C.NumCom, datCom;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	open c1;
    -- fetch next from c1 into a,b,c;
    Fetch from c1 into a,b,c;
    myLoop: LOOP
        select @chaine1;
		select NumArt from LigneCommande where NumCom = @a;
        set @chaine2 = 'Son montant est : ' + @c;
        select @chaine2;
        if done then 
			leave myLoop;
		end if; 
        Fetch from c1 into a,b,c;
	end loop;
    close c1;
  --  deallocate prepare c1;
end $$

delimiter ;

-- question 7 exo 1
delimiter $$
drop procedure if exists commandeArticle $$
create procedure commandeArticle()
begin
	Declare a int;
    declare chaine varchar(50);
	declare done int default false;
	Declare Cur_Com Cursor for select NumCom from Commande;
   
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	open Cur_Com;
   
	-- Fetch Next from Cur_Com into a;
    Fetch from Cur_Com into a;
	myLoop: LOOP
		if not exists (Select NumArt from LigneCommande where NumCom=@a) then 
				set @chaine = 'Aucun article pour la commande N° : ' +
					 @a + '. Elle sera supprimée';
				select @chaine;  
				Delete From Commande Where NumCom=@a;
		Else
				set @chaine = 'Commande n° : '+ @a ;
                select @chaine;
				Select A.NumArt, DesArt, PUArt, QteCommandee
						From Article A, Lignecommande LC
						Where A.NumArt=LC.NumArt and NumCom=@a;
		End if;
			if done then 
				leave myLoop;
			end if;
            Fetch from Cur_Com into a;
	End LOOP;
	Close Cur_Com;
  --  DEALLOCATE prepare Cur_Com;
end $$

delimiter ;

call montantCommande10();
call suppressionArticle8();
call listCommande();
call stockage();
call calcul();
call affichage();
call commandeArticle();
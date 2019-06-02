delimiter $$
drop procedure if exists ps1 $$
create procedure ps1()
begin
	Select NumCostume, DesCostume, NomStyliste, AdrStyliste 
    from Styliste,Costume 
    where Styliste.NumStyliste=Costume.NumStyliste;
end $$
delimiter ;
 
delimiter $$
drop procedure if exists ps2 $$
create procedure ps2(in NumCos int(5))
begin
	Select DesCostume, NomStyliste, AdrStyliste 
    from Styliste, Costume 
    where Styliste.NumStyliste = Costume.NumStyliste and NumCostume=@NumCos;
end $$
 
 delimiter ;
 
 delimiter $$
drop procedure if exists ps3 $$
create procedure ps3(in NumCos int(5))
begin
	Select MembreJury.NumMembreJury, NomMembreJury, FonctionMembreJury,NoteAttribuee 
    from MembreJury, Notesjury 
    where MembreJury.NumMembreJury=Notesjury.NumMembreJury and NumCostume =@NumCos;
end $$
 
 delimiter ;
 
 delimiter $$
drop procedure  if exists ps4 $$
create procedure  ps4(out NbrCos int(5) ) 
begin
	declare NbrCos int(5);
	Set @NbrCos=(select count(NumCostume) from Costume);
    select 'le nombre de costume est:' + @NbrCos;
end $$
 delimiter ;
 
delimiter $$
drop procedure  if exists ps5 $$
create procedure  ps5(in NumCos int(5), in MJ int(5), out note int (5) ) 
begin
	Set @note=(select NoteAttribuee from Notesjury 
		where NumCostume =@NumCos and
			NumMembreJury=@MJ);
	select 'la note attribuee par le membre de jury numero ' + @MJ + 'est :' + @note ;
end $$
 delimiter ;
 
 delimiter $$
drop procedure  if exists ps6 $$
create procedure  ps6(in NumCos int(5) ) 
begin
	declare moy decimal;
	Set @moy=(select Avg(NoteAttribuee) from NotesJury where NumCostume =@NumCos);
	select 'la moyenne obtenue par le costume numéro ' + @NumCos + 'est  de:' + @moy ;
end $$
 delimiter ;
 
 
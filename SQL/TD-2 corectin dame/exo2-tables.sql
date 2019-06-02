-- base de données interdefile

-- structure de la table MembreJury
drop table if exists MembreJury;
CREATE TABLE MembreJury (
	NumMembreJury int(5) NOT NULL auto_increment,
    NomMembreJury varchar(50),
	FonctionMembreJury varchar(50),
    PRIMARY KEY (NumMembreJury)
) ENGINE = InnoDB DEFAULT CHARSET= latin1;

-- contenu de la table  MembreJury
insert into MembreJury(NumMembreJury, NomMembreJury, FonctionMembreJury) values(
	1, 'Atsa', 'enseignant'),
    (2, 'Tchuente', 'enseignant emerite'),
    (3, 'Fouda', 'medecin');
    

-- structure de la table Costume 
drop table if exists Costume;
CREATE TABLE Costume (
	NumCostume int(5) NOT NULL auto_increment,
    DesCostume varchar(50),
	NumStyliste int(5) not null,
    PRIMARY KEY (NumCostume),
    key FK_Costume_Styliste (NumStyliste)
) ENGINE = InnoDB DEFAULT CHARSET= latin1;

-- contenu de la table costume
insert into Costume(NumCostume, DesCostume, NumStyliste) values (
	1,'decolte',1),
    (2, 'surmesure', 1),
    (3, 'mao', '2');
    

-- structure de la table Styliste
drop table if exists Styliste;
create table Styliste (
	NumStyliste int(5) not null auto_increment,
    NomStyliste varchar(50),
    AdrStyliste varchar(50),
    PRIMARY KEY (NumStyliste)
) ENGINE = InnoDB DEFAULT CHARSET= latin1;


-- contenu de la table Styliste
insert into Styliste (NumStyliste, NomStyliste, AdrStyliste) values (
	1, 'bradd pitt', 'avenue st germain'),
    (2, 'r kelly', 'rue 1441 los angeles'),
    (3, 'kim kardashian', 'av 1206 new york');
	
-- structure de la table NotesJury
drop table if exists NotesJury;
CREATE TABLE NotesJury (
	NumCostume int(5) NOT NULL,
    NumMembreJury int(5) NOT NULL,
	NoteAttribuee int(2),
    PRIMARY KEY (NumCostume, NumMembreJury),
    key FK_NotesJury_Costume (NumCostume),
    key FK_NotesJury_MembreJury (NumMembreJury)
) ENGINE = InnoDB DEFAULT CHARSET= latin1;

-- contenu de la table notesjury
insert into NotesJury(NumCostume, NumMembreJury, NoteAttribuee) values (
	1,1,12),
    (1,2,14),
    (2,2,7);
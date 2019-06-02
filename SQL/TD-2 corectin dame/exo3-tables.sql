-- Base de données faculte

-- structure de la table filière
drop table if exists Filiere;
CREATE TABLE Filiere (
	NumFiliere int(5) NOT NULL auto_increment,
    NomFiliere varchar(50),
	CodSecteur int(5),
    PRIMARY KEY (NumFiliere),
    key FK_Filiere_Secteur(CodSecteur)
) ENGINE = InnoDB DEFAULT CHARSET= latin1;

-- contenu de la table  MembreJury
-- insert into MembreJury(NumMembreJury, NomMembreJury, FonctionMembreJury) values(
	-- 1, 'Atsa', 'enseignant'),
    -- (2, 'Tchuente', 'enseignant emerite'),
    -- (3, 'Fouda', 'medecin');
    

-- structure de la table Secteur
drop table if exists Secteur;
CREATE TABLE Secteur (
	CodSecteur int(5) NOT NULL auto_increment,
    NomSecteur varchar(50),
    PRIMARY KEY (CodSecteur)
) ENGINE = InnoDB DEFAULT CHARSET= latin1;

-- contenu de la table costume
-- insert into Costume(NumCostume, DesCostume, NumStyliste) values (
	-- 1,'decolte',1),
    -- (2, 'surmesure', 1),
    -- (3, 'mao', '2');
    

-- structure de la table Programme
drop table if exists Programme;
create table Programme (
	NumFiliere int(5) not null,
    NumModule int(5) not null,
    Coefficient int(5),
    PRIMARY KEY (NumFiliere,NumModule),
    key FK_Programme_Module(NumModule),
	key FK_Programme_Filiere(NumFiliere)
) ENGINE = InnoDB DEFAULT CHARSET= latin1;


-- contenu de la table Styliste
-- insert into Styliste (NumStyliste, NomStyliste, AdrStyliste) values (
	-- 1, 'bradd pitt', 'avenue st germain'),
    -- (2, 'r kelly', 'rue 1441 los angeles'),
    -- (3, 'kim kardashian', 'av 1206 new york');
	
-- structure de la table Stagiaire
drop table if exists Stagiaire;
CREATE TABLE Stagiaire (
	NumStagiaire int(5) NOT NULL auto_increment,
    NomStagiaire varchar(50),
    PrenomStagiaire varchar(50),
	SexeStagiaire varchar(1),
    DateNaissance date,
    NumFiliere int(5) not null,
    PRIMARY KEY (NumStagiaire),
    key FK_Stagiaire_Filiere(NumFiliere)
) ENGINE = InnoDB DEFAULT CHARSET= latin1;

-- contenu de la table Stagiaire
-- insert into NotesJury(NumCostume, NumMembreJury, NoteAttribuee) values (
-- 	1,1,12),
  --   (1,2,14),
  --   (2,2,7);
  
  drop table if exists Module;
CREATE TABLE Module (
	NumModule int(5) NOT NULL auto_increment,
    NomModule varchar(50),
    PRIMARY KEY (NumModule)
) ENGINE = InnoDB DEFAULT CHARSET= latin1;

drop table if exists Notation;
CREATE TABLE Notation (
	NumModule int(5) NOT NULL ,
    NumStagiaire int(5) NOT NULL ,
    Note decimal,
    PRIMARY KEY (NumModule,NumStagiaire),
    key FK_Notation_Module (NumModule),
    key FK_Notation_Stagiaire (NumStagiaire)
) ENGINE = InnoDB DEFAULT CHARSET= latin1;
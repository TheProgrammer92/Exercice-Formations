/*create table exercice 2*/

drop table if exists MembreJyry;
drop table if exists Costume;
drop table if exists NotesJury;
drop table if exists Styliste;
create table  MembreJury (
NumMembreJury integer not null  primary key auto_increment,
NomMembreJury varchar(55),
FonctionMemberJury varchar(45)
);

create table Costume (
NumCostume integer not null primary key auto_increment, 
DesignationCostume varchar(55),
NumStyliste integer not null,
foreign key (NumStyliste) references Styliste (NumStyliste));

create table NotesJury
( NumCostume integer not null ,
NumMembreJury integer not null,
NoteAttribuee integer not null,
primary key (NumCostume,NumMembreJury),
foreign key (NumCostume) references Costume (NumCostume),
foreign key (NumMembreJury) references MembreJury (NumMembreJury));

create table Styliste 
(NumStyliste integer not null auto_increment primary key,
NomStyliste varchar(44) not null,
AdrStyliste varchar(55) not null

);

Create table Fonction (
Fonction  varchar(45) not null primary key)

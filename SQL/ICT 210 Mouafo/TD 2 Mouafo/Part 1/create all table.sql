drop table LigneCommande;
drop table article;
drop table commande;


create table Article (NumArt integer not null primary key,
DesArt varchar(55) not null,
PuArt integer  not null,
QteEnStock integer not null,
SeuilMinimum integer not null,
SeuilMaximum integer not null);

create table Commande (
NumCom integer not null primary key,
DatCom varchar(55)  not null);


create table LigneCommande (
NumCom integer not null, 
NumArt integer not null,
QteCommandee integer not null,
primary key (NumCom, NumArt),
foreign key (NumCom) references Commande (NumCom),
foreign key (NumArt) references Article (NumArt)

);


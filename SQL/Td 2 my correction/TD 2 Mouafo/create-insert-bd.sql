create table commande (
NumCom integer not null primary key,
 DatCom varchar(30)



);

create table Article (

NumArt integer not null primary key,
DesArt varchar(44) not null,
PUArt varchar(50) not null, 
QteEnStock integer not null, 
seuilMinimum integer not null, 
seuilMaximum integer not null

);
create table LigneCommande (

NumCom integer not null,
NumArt integer not null,
QteCommandee integer not null,
primary key(NumCom, NumArt),
FOREIGN KEY (NumArt) REFERENCES Article (NumArt),
FOREIGN KEY (NumCom) REFERENCES commande (NumCom)
)
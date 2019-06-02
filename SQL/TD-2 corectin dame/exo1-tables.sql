-- base données exo1
-- structure de la table Article
CREATE TABLE Article (
	NumArt int(5) NOT NULL auto_increment,
    DesArt varchar(50),
    PUArt int(5) default null,
    QteEnStock int(5) default null,
    SeuilMinimum int(5),
    SeuilMaximum int(5), 
    PRIMARY KEY (NumArt)
) ENGINE = InnoDB DEFAULT CHARSET= latin1;

-- contenu de la table article
INSERT INTO Article (NumArt, DesArt, PUArt, QteEnStock,SeuilMinimum,SeuilMaximum) VALUES (1, 'savon',
200, 20,50,100),
(2, 'okok', 175, 20,50,78),
(3, 'Graves', 124, 50,45,1000),
(4, 'Ruinard', 40, 10,34,57);

-- structure dela table commande
create table Commande (
	NumCom int(5) not null auto_increment,
    DatCom date not null,
     PRIMARY KEY (NumCom)
)ENGINE = InnoDB DEFAULT CHARSET= latin1;

-- contenu de la table commande 
insert into Commande (NumCom, DatCom) values (1,
'2007-12-23'),
(2,'2007-12-23');

-- structure de la table Commande
CREATE TABLE LigneCommande (
	NumCom int(5) NOT NULL  auto_increment,
    NumArt int(5) NOT NULL,
    QteCommandee int(10),
    PRIMARY KEY (NumCom,NumArt),
    key FK_LigneCommande_Article (NumArt)
)ENGINE = InnoDB DEFAULT CHARSET= latin1;

-- contenu de la table LigneCommande
insert into LigneCommande(NumCom, NumArt, QteCommandee) values (
	1,1,3),
    (1,2,2),
    (2,2,3);

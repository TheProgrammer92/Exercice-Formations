CREATE TABLE PERSONNE
( numpers number PRIMARY KEY, nom varchar2(30) NOT NULL, prenom varchar2(30) , pere REFERENCES PERSONNE ( numpers ) ,
mere REFERENCES PERSONNE ( numpers )
);
INSERT INTO PERSONNE VALUES (1 ,	'de Montmirail ,	dit	le	Hardi ' ,	'Godefroy ' , NULL, NULL);
INSERT INTO PERSONNE VALUES (16 ,	'ET' , NULL, NULL, NULL);
INSERT INTO PERSONNE VALUES (2 ,	'Le Croquant ' ,	'Jacqou ' , 1 , 16);
INSERT INTO PERSONNE VALUES (3 ,	'La Fripouille ' ,	' Jacqouille ' , 1 , 16);
INSERT INTO PERSONNE VALUES (4 ,	'Bush ' ,	'Kate ' , NULL, NULL);
INSERT INTO PERSONNE VALUES (13 ,	'Granger ' ,	'Hermione ' , NULL, NULL);
INSERT INTO PERSONNE VALUES (5 ,	'Du F	mur' ,	'M	dor' , 3 ,4	);
INSERT INTO PERSONNE VALUES (12 ,	'KobalevskaA�a�	' ,	' Sofia ' , NULL, NULL);
INSERT INTO PERSONNE VALUES (6 ,	'Rieu ' ,	'AndrA� c ' , NULL, NULL);
INSERT INTO PERSONNE VALUES (7 ,	'Bontoutou ' ,	'Rex ' , 6 ,	4);
INSERT INTO PERSONNE VALUES (8 ,	' Dijkstra ' ,	'Edvard ' , 2 , 13);
INSERT INTO PERSONNE VALUES (9 ,	' Leibniz ' ,	' Gottfrie1d Wilhem ' , 8 , 12);
INSERT INTO PERSONNE VALUES (10 ,	'Bach ' ,	'Johann Sebastien ' , 5 , 12);
INSERT INTO PERSONNE VALUES (17 ,	'Mathieu ' ,	' Mireille ' , NULL, NULL);
INSERT INTO PERSONNE VALUES (11 ,	'Lemarchal ' ,	'Gregory ' , 10 , 17);
INSERT INTO PERSONNE VALUES (15 ,	' Socrate ' , NULL,	3 , 13);
INSERT INTO PERSONNE VALUES (19 ,	'Leroy ' ,	'Nolwen ' , NULL, NULL);
INSERT INTO PERSONNE VALUES (20 ,	' Bartoli ' ,	' Jennifer ' , 9 , 19);
INSERT INTO PERSONNE VALUES (21 ,	'Fabian ' ,	'Lara ' , 10 , 17);
INSERT INTO PERSONNE VALUES (14 ,	'Stone ' ,	'Sharon ' , 15 , 20);
INSERT INTO PERSONNE VALUES (18 ,	'Frege ' ,	' Elodie ' , 7 , 13);

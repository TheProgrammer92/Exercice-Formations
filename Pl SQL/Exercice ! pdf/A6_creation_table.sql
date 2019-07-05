DROP TABLE OPERATION;
DROP TABLE TYPEOPERATION;
DROP TABLE COMPTECLIENT;
DROP TABLE TYPECCL;
DROP TABLE PERSONNEL;
DROP TABLE CLIENT;

CREATE TABLE CLIENT
(numcli number,
 nomcli varchar2(30),
 prenomcli varchar2(30),
 adresse varchar2(60),
 tel varchar(10)
);

CREATE TABLE PERSONNEL
(numpers number,
 nompers varchar2(30),
 prenompers varchar2(30),
 manager number,
 salaire number
);

CREATE TABLE TYPECCL
(numtypeccl number,
 nomtypeccl varchar2(30)
);

CREATE TABLE COMPTECLIENT
(numcli number,
 numccl number,
 numtypeccl number,
 dateccl date default sysdate not null,
 numpers number
);

CREATE TABLE TYPEOPERATION
(numtypeoper number,
 nomtypeoper varchar2(30)
);

CREATE TABLE OPERATION
(numcli number,
 numccl number,
 numoper number,
 numtypeoper number,
 dateoper date default sysdate not null,
 montantoper number not null,
 libeloper varchar2(30)
);

ALTER TABLE CLIENT ADD
        (
        CONSTRAINT pk_client PRIMARY KEY (numcli),
        CONSTRAINT ck_telephone CHECK(LENGTH(tel)=10)
        );

ALTER TABLE PERSONNEL ADD
        (
        CONSTRAINT pk_personnel PRIMARY KEY (numpers),
        CONSTRAINT ck_salaire CHECK(SALAIRE >= 1254.28)
        );

ALTER TABLE TYPECCL ADD
        CONSTRAINT pk_typeccl PRIMARY KEY (numtypeccl);

ALTER TABLE TYPEOPERATION ADD
        CONSTRAINT pk_typeoperation PRIMARY KEY (numtypeoper);

ALTER TABLE COMPTECLIENT ADD
        (
        CONSTRAINT pk_compteclient
                PRIMARY KEY (numcli, numccl),
        CONSTRAINT fk_ccl_typeccl
                FOREIGN KEY (numtypeccl)
                REFERENCES TYPECCL (numtypeccl),
        CONSTRAINT fk_ccl_client
                FOREIGN KEY (numcli)
                REFERENCES CLIENT (numcli),
        CONSTRAINT fk_ccl_personnel
                FOREIGN KEY (numpers)
                REFERENCES PERSONNEL (numpers)
        );

ALTER TABLE OPERATION ADD
        (
        CONSTRAINT pk_operation
                PRIMARY KEY (numcli, numccl, numoper),
        CONSTRAINT fk_oper_ccl
                FOREIGN KEY (numcli, numoper)
                REFERENCES COMPTECLIENT (numcli, numccl),
        CONSTRAINT fk_oper_codeoper
                FOREIGN KEY (numtypeoper)
                REFERENCES typeoperation (numtypeoper),
        CONSTRAINT montant_operation
                CHECK(montantoper <> 0)
        );

INSERT INTO TYPECCL VALUES (
        (SELECT nvl(MAX(numtypeccl), 0) + 1
        FROM TYPECCL
        ),
'Compte courant');

INSERT INTO TYPECCL VALUES (
        (SELECT nvl(MAX(numtypeccl), 0) + 1
        FROM TYPECCL
        ),
'livret');

INSERT INTO TYPECCL VALUES (
        (SELECT nvl(MAX(numtypeccl), 0) + 1
        FROM TYPECCL
        ),
'PEL');

INSERT INTO TYPEOPERATION VALUES (
        (SELECT nvl(MAX(numtypeoper), 0) + 1
        FROM TYPEOPERATION
        ),
'dépôt espèces');

INSERT INTO TYPEOPERATION VALUES (
        (SELECT nvl(MAX(numtypeoper), 0) + 1
        FROM TYPEOPERATION
        ),
'prélèvement');

INSERT INTO TYPEOPERATION VALUES (
        (SELECT nvl(MAX(numtypeoper), 0) + 1
        FROM TYPEOPERATION
        ),
'virement');

INSERT INTO TYPEOPERATION VALUES (
        (SELECT nvl(MAX(numtypeoper), 0) + 1
        FROM TYPEOPERATION
        ),
'retrait');-- bonj
create table EMP (
EMPNO number(4) not null primary key,
ENAME varchar2(10),
JOB varchar2(9),
MGR  number(4),
HIREDATE DATE,
SAL number(7,2),
COMM number(7,2),
DEPTNO number(2)
);

create table DEPT (
DETPNO number(2),
DBNAME varchar(14),
LOC varchar(13));


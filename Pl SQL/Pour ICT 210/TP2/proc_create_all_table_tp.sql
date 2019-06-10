

clear screen;


create or replace procedure create_all_table_tp is


  var1 varchar2(4000);
  
begin  

  var1 := 
    'drop table emp;
        drop table  emp2;
        
        drop table dept;
        
        
        
        
        create table DEPT (
          DEPTNO integer primary key not null,
          DNAME varchar(24),
          LOC varchar(24));
        
        --creation des table
        create table EMP (
          EMPNO number(4) not null primary key,
          ENAME varchar2(15),
          JOB varchar2(15),
          MGR  number(4),
          HIREDATE DATE,
          SAL decimal,
          COMM number(7,2),
          DEPTNO integer,
          
          foreign key (DEPTNO) references DEPT (DEPTNO)
          
        
        );
      create table emp2 as select * from emp;
';
  EXECUTE IMMEDIATE var1;
end;
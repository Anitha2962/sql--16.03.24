CREATE DATABASE COMPANY_DETAILS

create table employee(emp_id int primary key,
 first_name varchar(40),
 last_name varchar(40),
 birth_day date,
 sex varchar(1),
 salry int,
 super_id int,
 branch_id int);

 create table branch(branch_id int primary key,
 branch_name varchar(40),
 mgr_id int,
 mgr_start_date date,
 foreign key(mgr_id)references employee(emp_id)on delete set null);

 alter table employee
 add foreign key(branch_id)
 references branch(branch_id)
 on delete set null;

 alter table employee
 add foreign key (super_id)
 references employee(emp_id)
 on delete no action;

 create table client(client_id int primary key,
 client_name varchar(40),
 branch_id int,
 foreign key (branch_id) references branch(branch_id) on delete set null);


 create table works_with(emp_id int,
 client_id int,
 total_sales int,
 primary key(emp_id,client_id),
 foreign key(emp_id)references employee(emp_id)on delete cascade,
 foreign key(client_id)references client(client_id)on delete cascade);


 create table branch_suplier(
 branch_id int,
 supplier_name varchar(40),
 supply_type varchar(40),
 primary key (branch_id,supplier_name),
 foreign key (branch_id)references branch(branch_id) on delete cascade);


 insert into employee values(100,'David','wallace','1967-11-17','M',250000,null,null);


 insert into branch values(1,'corporate',100,'2006-02-09');

 update employee 
 set branch_id=1
 where emp_id=100;

 insert into employee values(101,'jan','Levinson','1961-05-11','F',110000,100,1);
 --branch 2

 INSERT INTO employee values(102,'Michael','scott','1964-03-15','M',75000,100,null);

 insert into branch values(2,'Scranton',102,'1992-04-06');

 update employee 
 set branch_id=2
 where emp_id=102;

 insert into employee values(103,'Angela','Martin','1971-06-25','F',63000,102,2);
 insert into employee values(104,'kelly','kapoor','1980-02-05','F',65000,102,2);
 INSERT INTO EMPLOYEE values(105,'stanley','Hudson','1958-02-19','M',69000,102,2);

 INSERT INTO EMPLOYEE values(106,'Josh','Porter','1969-09-05','M',78000,100,null);
 insert into branch values(3,'stamford',106,'1998-02-13');

 update employee
 set branch_id=3
 where emp_id=106;

  INSERT INTO EMPLOYEE values(107,'Andy','Bernard','1973-07-22','M',65000,106,3);
   INSERT INTO EMPLOYEE values(108,'Jim','Halpert','1978-10-01','M',71000,106,3);

select * from employee
insert into branch_suplier values(2,'Hammer mill','Papper');
insert into branch_suplier values(2,'Uni-ball','writing utensils');
insert into branch_suplier values(3,'Patriot papper','Papper');
insert into branch_suplier values(3,'Uni-ball','Writing utensils');
insert into branch_suplier values(3,'Hammer mill','Papper');
insert into branch_suplier values(3,'Stamford labels','Custom forms');


insert into client values(400,'dunmore highschool',2); 
insert into client values(401,'lacknow county',2);    
insert into client values(402,'fedex',3);    
insert into client values(403,'jhone daly law,LLC',3);    
insert into client values(404,'scranton whitepages',2) ; 
insert into client values(405,'time news paper',3) ;
insert into client values(406,'fedex',2) ;

insert into works_with values(105,400,55000);
insert into works_with values(102,401,267000);
insert into works_with values(108,402,22500);
insert into works_with values(107,403,5000);
insert into works_with values(108,403,12000);
insert into works_with values(105,404,33000);
insert into works_with values(107,405,26000);
insert into works_with values(102,406,15000);
insert into works_with values(105,406,130000);

select * from employee
select * from branch
select * from branch_suplier
select * from client
select * from works_with

select * from employee
order by salary desc;

select * from employee
order by sex,first_name desc;

select Top 5 * from employee

SELECT first_name,last_name
from employee

select first_name as forenmae, last_name as surname
from employee

select distinct  sex from employee
select distinct branch_id from employee

---FUNCTIONS----

select count(super_id) from employee
select count(*) from employee

select count(emp_id) from employee
where sex='F'  and birth_day >'1971-01-01';

select avg(salary) from employee
where sex='M';

SELECT SUM(salary) from employee
where sex='f';

select count(sex),sex
from employee
group by sex;

select sum(total_sales),emp_id
from works_with
group by emp_id

select sum(total_sales),client_id
from works_with
group by client_id

select * from client
where client_name like '%FEDEX';

SELECT * FROM branch_suplier
where supply_type like'papper';

select * from employee
where birth_day like'____-06%';

----UNION----

select first_name from employee
union
select branch_name from branch

select first_name as company_name from employee

select client_name from client
union
select supplier_name from branch_suplier

select salary from employee
union
select total_sales from works_with
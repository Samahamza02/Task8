create table doctor
(
    doctor_id int primary key,
    name varchar(20) NOT NULL,
    email varchar(50),
    phone varchar(11),
    specialty varchar(50),
    yearsexp INT CHECK (yearsexp >= 0)
)

create table petient(
    ur_number int primary key,
    name varchar(20) NOT NULL,
    adderess varchar(20),
    age int,
    email varchar(50),
    phone varchar(11),
    card_number int,
    doctor_id int references doctor(doctor_id) --fk
 )

 create table company(
  c_name varchar(20) primary key,
  adderess varchar(20),
  phone varchar(11)
  )
  create table drug(
  drug_id int primary key not null,
  trade_name varchar(20),
  strngth varchar(20),
  c_name varchar(20) references company(c_name),
  )

  create table prescription(
      prescriptionid int primary key ,
      pre_date date,
      quantity int check (Quantity > 0),
      doctor_id int references doctor(doctor_id) ,--fk
      ur_number int references petient(ur_number), --fk
      drug_id int references drug(drug_id), --fk
     --primary key (doctor_id,ur_number,drug_id),
     )
-- 
insert into doctor
values(1,'ahmed','ahmed@gmail','0123145','random',20)
--
insert into company
values
('me','my','033333')
--
insert into drug
values
(101,'Panadol','500 mg','me')
--
insert into  petient
values
(
1001,'Sara','Cairo',22,'sara@gmail.com','01011111111',5,1)
--1-SELECT: Retrieve all columns from the Doctor table.
select *
from doctor

--2-ORDER BY: List patients in the Patient table in ascending order of their ages.
select *
from petient
order by age asc

--3-OFFSET FETCH: Retrieve the first 10 patients from the Patient table, starting from the 5th record.
select * 
from petient 
order by ur_number
offset 4 rows
fetch next 10 rows only

--4-SELECT TOP: Retrieve the top 5 doctors from the Doctor table.
select top (5)*
from doctor

--5-SELECT DISTINCT: Get a list of unique address from the Patient table.
select distinct adderess
from petient

--6-WHERE: Retrieve patients from the Patient table who are aged 25.
select *
from petient
where age = 25

--
insert into  petient
values
(
1003,'sama','Cairo',22,null,'01011111111',5,1)
--7-NULL: Retrieve patients from the Patient table whose email is not provided.
select *
from petient
where email is null


--
insert into doctor
values(2,'sama','sama@gmail','0123145','Cardiology',4)
--
insert into doctor
values(3,'menna','menna@gmail','0123145','Cardiology',6)
insert into doctor
values(4,'ali','ali@gmail','0123145','Dermatology',10)
--8-AND: Retrieve doctors from the Doctor table who have experience greater than 5 years and specialize in 'Cardiology'.

select *
from doctor
where yearsexp> 5 AND specialty = 'Cardiology'


--9-IN: Retrieve doctors from the Doctor table whose speciality is either 'Dermatology' or 'Oncology'.
select *
from doctor
where specialty in ('Dermatology','Oncology')

--10-BETWEEN: Retrieve patients from the Patient table whose ages are between 18 and 30.
select *
from petient
where age between 18 and 30
--
insert into doctor
values(5,'dr.rana','rana@gmail','0155548487','Dermatology',15)
--11-LIKE: Retrieve doctors from the Doctor table whose names start with 'Dr.'.

select *
from doctor
where name like 'dr.%'
--12-Column & Table Aliases: Select the name and email of doctors, aliasing them as 'DoctorName' and 'DoctorEmail'.
select name doctorname,email docotremail
from doctor 

--13-Joins: Retrieve all prescriptions with corresponding patient names.
select p.prescriptionid,p.quantity,p.pre_date,pa.name
 
 from prescription p
 join petient pa
 on p.ur_number=pa.ur_number

 --14-GROUP BY: Retrieve the count of patients grouped by their cities.
select adderess,count (*) patientcount
from petient
group by adderess
--
insert into  petient
values
(
1004,'walid','alex',44,null,'01011111111',5,1)
--
insert into  petient
values
(
1005,'nuha','Cairo',25,null,'01011111111',6,2)
--
insert into  petient
values
(
1006,'hoda','Cairo',25,null,'0251584265',6,2)
--15-HAVING: Retrieve cities with more than 3 patients.
select adderess,count (*) patientcount
from petient
group by adderess
having count(*) >3

--16-EXISTS: Retrieve patients who have at least one prescription.
select *
from petient p
where exists(
select 1
from prescription pr
where p.ur_number=pr.ur_number
)

--17-UNION: Retrieve a combined list of doctors and patients.
select name
from doctor
union
select name
from petient

--18-INSERT: Insert a new doctor into the Doctor table.
insert into doctor
values (6,'dr.mahy','mahy@gmail','01112121','Oncology',11)

select *
from doctor


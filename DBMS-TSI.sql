create database TSI_db
use TSI_db

Create table airlines(airline_id int primary key, airline_name varchar(50))

Create table aircraft(aircraft_id int primary key, aircraft_name varchar(50),aircraft_model varchar(50),
aircraft_Businessclass_capacity int,aircraft_Firstclass_capacity int,aircraft_Economyclass_capacity int,
airline_id int Foreign Key References airlines(airline_id))

Create table cities(city_id int primary key, city_name varchar(50))
alter table cities add  depcity_name varchar(50)

Create table fare( fare_id int primary key,fare_type varchar(20), departure_city_id int Foreign key References cities(city_id), 
destination_city_id int Foreign key References cities(city_id), duration varchar(10),fare_charge money)
Alter table fare add booking_id int foreign key references booking(booking_id)

Create table flight( flight_id int primary key, flight_date date, flight_time time, flight_fare_id int Foreign key References fare(fare_id))
Alter table flight add airline_id int foreign key references airlines(airline_id)

Create table passenger(passenger_id int primary key, passenger_name varchar(50), passenger_age int, gender char, passenger_email varchar(10), 
passenger_phoneno char, passenger_age_category varchar(10))

Create table booking( booking_id int primary key, booking_flight_id int Foreign key References flight(flight_id),
booking_passenger_id int Foreign key References passenger(passenger_id), booking_number int unique, booking_seatno varchar(10), 
booking_class varchar, booking_date Date, booking_infantseat varchar)

Create table meal(meal_id int primary key, meal_name varchar(20), meal_type varchar(20), meal_price money, 
meal_flight_id int foreign key references flight(flight_id) )

Create table special_services(ss_id int primary key, ss_name varchar, ss_cost money, 
ss_flight_id int foreign key references flight(flight_id), ss_passenger_id int foreign key references passenger(passenger_id) )


alter table passenger add passenger_meal_id int foreign key references meal(meal_id)
select* from passenger


drop table booking
select * from booking
select * from special_services


insert into airlines values(101,'Boeing')
insert into airlines values(102,'YetiAirlines')
insert into airlines values(103,'BuddhaAirlines')


insert into aircraft values(01,'Yeti','YA-03-09',20,30,15,101)
insert into aircraft values(02,'Buddha','B3-03-09',20,30,15,102)
insert into aircraft values(03,'Sita','S2-03-09',20,30,15,103)

insert into cities values(01,'Pokhara')
insert into cities values(02,'Kathmandu')
insert into cities values(03,'Malaysia')
insert into cities values(04,'Delhi')

UPDATE cities
SET depcity_name = 'Kathmandu'
WHERE city_id=01

UPDATE cities
SET depcity_name = 'Malaysia'
WHERE city_id=02

UPDATE cities
SET depcity_name = 'Quatar'
WHERE city_id=03

UPDATE cities
SET depcity_name = 'Kathmandu'
WHERE city_id=04

insert into fare values(01,'Business',01,02,1000,1)
insert into fare values(02,'First',03,04,20000,1)
insert into fare values(03,'Economy',02,03,35000,1)

Alter table fare ADD aircraft_id int FOREIGN KEY REFERENCES aircraft(aircraft_id)
select*from fare
 UPDATE fare
SET duration = 1, fare_charge=2000
WHERE fare_id=01;
UPDATE fare
SET duration = 1, fare_charge=1000
WHERE fare_id=02;
UPDATE fare
SET duration = 1,fare_charge=3500
WHERE fare_id=03;

UPDATE fare
SET aircraft_id = 01,fare_charge=3500
WHERE fare_id=03;

UPDATE fare
SET aircraft_id = 02
WHERE fare_id=02;

UPDATE fare
SET aircraft_id = 03
WHERE fare_id=01;
UPDATE fare
SET fare_type = 'oneway'
WHERE fare_id=01;
UPDATE fare
SET fare_type = 'twoway'
WHERE fare_id=02;

UPDATE fare
SET booking_id = '101'
WHERE fare_id=01;
UPDATE fare
SET booking_id = '102'
WHERE fare_id=02;
UPDATE fare
SET booking_id = '103'
WHERE fare_id=03;



Alter table flight add flight_status varchar(50)
insert into flight values(01,'2019/09/08','02:00',01)
insert into flight values(02,'2019/09/12','04:00',02)
insert into flight values(03,'2019/09/14','09:00',01)
UPDATE flight
SET flight_status = 'OnGoing'
WHERE flight_id=01;

UPDATE flight
SET flight_status = 'OnGoing'
WHERE flight_id=02;

UPDATE flight
SET flight_status = 'OnGoing'
WHERE flight_id=03;

UPDATE flight
SET airline_id = '101'
WHERE flight_id=01;

UPDATE flight
SET airline_id = '102'
WHERE flight_id=02;

UPDATE flight
SET airline_id = '103'
WHERE flight_id=03;
select * from flight

Alter table passenger drop column passenger_email;
alter table passenger add passenger_email varchar(50)
select*from passenger
Alter table passenger drop column passenger_phoneno;
Alter table passenger drop column gender;
Alter table passenger add  passenger_phoneno varchar(10), gender varchar(10)
Alter table passenger add  passenger_Passportno nvarchar(50)
insert into passenger values(01,'Ram',23,'Adult',02,'ram@gmail.com')
insert into passenger values(02,'Simran',40,'Adult',02,'simran@gmail.com','9867894534','Female')
insert into passenger values(03,'Sagar',35, 'Adult',01,'sagar@gmail.com','9876543255','Male')
UPDATE passenger
SET passenger_phoneno = '9876543210', gender= 'Male'
WHERE passenger_id=01
UPDATE passenger
SET passenger_Passportno = 'AS001345689'
WHERE passenger_id=01;

UPDATE passenger
SET passenger_Passportno = 'AA001456780'
WHERE passenger_id=02;

UPDATE passenger
SET passenger_Passportno = 'CA009876453'
WHERE passenger_id=03;


insert into meal values(01,'Burger','Veg',300,01)
insert into meal values(02,'Sandwich','Veg',500,03)
insert into meal values(03,'Pasta','Non-Veg',250,01)
insert into meal values(04,'Chicken Biryani','Non-Veg',450,02)
select*from meal
UPDATE meal
SET meal_name = 'Chicken-Pasta'
WHERE meal_id=03;

Alter table booking drop column booking_class;
Alter table booking drop column bstatus;
Alter table booking drop column booking_infantseat;
Alter table booking add booking_class varchar(50), booking_infantseat varchar(20)
Alter table booking add bstatus varchar(50)
insert into booking values(101,01,01,1001,'B01','2019/09/08','BusinessClass','No')
insert into booking values(102,01,02,1002,'E04','2019/09/28','EconomyClass','Yes')
insert into booking values(103,01,03,1003,'F01','2019/09/20','FirstClass','No')
insert into booking values(104,01,03,1004,'F01','2019/09/20','FirstClass','No','Valid')
select*from booking

UPDATE booking
SET bstatus = 'Valid'
WHERE booking_id=101;

UPDATE booking
SET bstatus = 'Valid'
WHERE booking_id=102;

UPDATE booking
SET bstatus = 'Valid'
WHERE booking_id=103;

UPDATE booking
SET bstatus = 'Valid'
WHERE booking_id=104;


Alter table special_services drop column ss_name;
select*from special_services
Alter table special_services add  ss_name varchar(50);
insert into special_services values(01,1500,01,02,'childcare')


Create table cancelation (cancle_id nvarchar(50) primary key not null, cancle_date datetime, cancle_booking_id int foreign key references booking(booking_id) )

insert into cancelation values(01,'2019/09/08',101)

select*from cancelation
drop table cancelation
/* trigrer member2 */

Create Trigger cancle_booking
on booking 
instead of delete 
as
declare @booking_id as nvarchar(50)
declare @flight_time as datetime
declare @cancle as nvarchar(50)
declare @cancle_no as integer
set @cancle =(select top 1 cancle_id from cancelation order by cancle_id DESC)
set @booking_id=(select booking_id from deleted)
set @flight_time =( select f.flight_time from flight f
					inner join booking b on b.booking_id =f.flight_id where b.booking_id =@booking_id)
		set @cancle_no = SUBSTRING(@cancle,4,8)
if(select DATEDIFF(HOUR, CURRENT_TIMESTAMP,@flight_time))>3
begin
update booking 
set bstatus ='Invalid'
where @booking_id = booking_id
insert into cancelation(cancle_id,cancle_date,cancle_booking_id)
values('CAN' + (CAST(@cancle_no+ 1 as nvarchar)), (CAST(GETDATE()as DATE)),@booking_id)

print'Booking_ID:' +@booking_id
print'Flight on :' +Convert(varchar, @flight_time)
print'Booking Cancelled'
print'Fine :N/A'
end
else 
Begin
update booking 
set bstatus ='Invalid'
where @booking_id =booking_id
insert into cancelation(cancle_id,cancle_date,cancle_booking_id)
values('CAN' + (CAST(@cancle_no+ 1 as nvarchar)), (CAST(GETDATE()as DATE)),@booking_id)

print'Booking_ID:' +@booking_id
print'Flight on :' +Convert(varchar, @flight_time)
print'Booking Cancelled'
print'Fine : Rs: 200'
end
Go

Delete from booking where booking_id=101 
select * from booking
select * from cancelation 


DROP TRIGGER  cancle_booking  
  
  SELECT 
    definition   
FROM 
    sys.sql_modules  
WHERE 
    object_id = OBJECT_ID('cancle_booking'); 


/* trigrer member1 */

Create Trigger flight_delay
on flight
instead of delete
as Begin
RAISERROR('Flight cannot proceed as ususl. Flight will be postpone instead.',16,10)
select * from flight
update flight 
set flight_status ='Postpone'
from flight f inner join deleted d on f.flight_id = d.flight_id
End
Go

select*from flight
Delete from flight where flight.flight_id=02


/*StoreProcedure member1*/
CREATE procedure aircraft_details  @capacity INT
AS BEGIN
 SELECT aircraft.aircraft_name, aircraft.aircraft_model,aircraft.aircraft_Businessclass_capacity FROM aircraft WHERE 
 (aircraft.aircraft_Businessclass_capacity > @capacity)
 END 
 Go
 EXEC aircraft_details @capacity=5

 
 /*StoreProcedure member2*/
 Create procedure passenger_Passportno @passportnumber nvarchar(50)
 as 
 select* from passenger
 where passenger_Passportno =@passportnumber
 GO
 exec passenger_Passportno 'AS001345689'

 exec passenger_Passportno 'AA001456780'


 /*Member-2 Queires*/

 /*Question viii*/
SELECT A.flight_id AS Aircraft, F.fare_charge AS Regular_First_Class, F.fare_charge * 0.75 AS Discounted_First_Class_Fare FROM flight A, fare F,booking b 
WHERE A.flight_fare_id = F.fare_id AND b.booking_flight_id=A.flight_id 
Select fare_charge from fare where booking_id='101'

 /*Question ix*/
 Select* from fare
 order by duration

  /*Question x*/

select * from meal 
where meal_type NOT LIKE 'v%' AND meal_flight_id IS NOT NULL

  /*Question xi*/
SELECT DISTINCT city_name FROM cities

 /*Question xii*/
 SELECT COUNT (flight.flight_id) AS [Flight count],airlines.airline_name 
 FROM flight,airlines,aircraft WHERE flight.flight_date ='2019/09/12' AND 
 aircraft.airline_id=airlines.airline_id AND flight.flight_fare_id=aircraft.aircraft_id 
 Group By airlines.airline_name with rollup

 /*Question xiii*/

 SELECT m.meal_name,f.flight_id, aircraft_name FROM meal m,flight f ,aircraft where f.flight_id = m.meal_flight_id 
 AND aircraft.aircraft_id= f.flight_id 
 AND aircraft_name = 'Yeti' 

 /*Question xiv*/
 SELECT f.flight_id as FlightNumber,p.passenger_name as Name, p.passenger_Passportno, s.ss_name
 FROM passenger p
 join flight f
 on p.passenger_id = f.flight_id
 join special_services s 
 on p.passenger_id =s.ss_id
 where s.ss_name= 'childcare'
 group by  f.flight_id, p.passenger_id, p.passenger_name,p.passenger_Passportno, s.ss_name


 /*NonCluster-Index*/
 create NonClustered index IX_airlines_airline_name
             on airlines (airline_name ASC)  

 /*Member-1 Queires*/
  /*Question i*/
  select * from flight,fare where flight.flight_id = fare.fare_id and
flight.flight_date='2019-09-08' and fare.departure_city_id='01' and
fare. destination_city_id='02'

/*Question 2*/
select aircraft_id,aircraft_Businessclass_capacity*100 as
business,aircraft_Economyclass_capacity*100 as economy,aircraft_Firstclass_capacity*100
as firstClass,aircraft_Firstclass_capacity*100 as totalEstimateRevenue from aircraft

/*Question 3*/
select p.passenger_id, a.airline_name, b.booking_id,p.passenger_name,b.booking_date,
p.passenger_age_category, f.flight_id, ff.fare_charge,b.bstatus from passenger
inner join passenger p on p.passenger_id = p.passenger_id
inner join booking b on p.passenger_id = b.booking_id
inner join flight f on b.booking_id = f.flight_id
inner join fare ff on f.flight_id= ff.fare_charge
inner join airlines a on ff.fare_charge = a.airline_name

/*Queston 4*/

select * from flight

select count (f.flight_id) as noftravell, a.airline_name, ff.departure_city_id, 
ff.destination_city_id from flight f, fare ff 
inner join aircraft af on af.aircraft_id = af.aircraft_id
inner join airlines a on a.airline_name= a.airline_name
where f.flight_date between '2019-09-08' and '2019-09-12' and
ff.departure_city_id ='01' and ff.destination_city_id ='02' 
group by a.airline_name,ff.departure_city_id,ff.destination_city_id order by noftravell desc


/*Question 5*/
 select case when passenger.passenger_age <=1 then 'infant' 
 when passenger.passenger_age <=12 then 'children' 
 when passenger.passenger_age <=17 then 'youths'
 when passenger.passenger_age <=54 then 'adult'
when passenger.passenger_age >=55 then 'senior' else 'unknown age' end, 
count(case when passenger.passenger_age <=1 then 'infant' 
when passenger.passenger_age <=12 then 'children' 
when passenger.passenger_age <=17 then 'youths' 
when passenger.passenger_age <=54 then 'adult'
when passenger.passenger_age >=55 then 'senior' else 'unknown age' end)
from booking,passenger where passenger_id=passenger.passenger_id and booking.booking_flight_id 
in (select flight.flight_id from flight,fare,aircraft,airlines 
where flight.flight_fare_id=fare.fare_id and fare.fare_type='OneWay' and 
flight.flight_date='2019-09-08' and aircraft.aircraft_id=aircraft.aircraft_id and 
aircraft.airline_id=airlines.airline_id and airlines.airline_name='Boeing')
group by case when passenger.passenger_age <=1 then 'infant' when passenger.passenger_age <=12 
then 'children' 
when passenger.passenger_age <=17 then 'youths' when passenger.passenger_age <=54 then 
'adult' when passenger.passenger_age >=55 then 'senior'
else 'unknown age' 
end


/*Question 6*/
select count (f.flight_id) as noofjourney,a.airline_name,ff.departure_city_id, 
ff.destination_city_id from flight f, fare ff
inner join airlines a on a.airline_name = a.airline_name
group by a.airline_name,f.flight_id,ff.departure_city_id,ff.destination_city_id
order by noofjourney desc

/*Question 7*/
select fare.destination_city_id,
case
when passenger.passenger_age <=1 then 'infant'
when passenger.passenger_age <=12 then 'children'
when passenger.passenger_age <=17 then 'youths'
when passenger.passenger_age <=54 then 'adult'
when passenger.passenger_age >=55 then 'senior'
else 'unknown age'
end,
count(case
when passenger.passenger_age <=1 then 'infant'
when passenger.passenger_age <=12 then 'children'
when passenger.passenger_age <=17 then 'youths'
when passenger.passenger_age <=54 then 'adult'
when passenger.passenger_age >=55 then 'senior'
else 'unknown age'
end)
from booking,passenger,flight,fare where
booking.booking_passenger_id=passenger.passenger_id and
booking.Booking_Flight_ID=flight.Flight_ID and flight_fare_id=fare.Fare_ID
group by fare.Destination_City_Id,
case
when passenger.passenger_age <=1 then 'infant'
when passenger.passenger_age <=12 then 'children'
when passenger.passenger_age <=17 then 'youths'
when passenger.passenger_age <=54 then 'adult'
when passenger.passenger_age >=55 then 'senior'
else 'unknown age'
end
## the Q ##
USE VaccinationDelivetyDB;

## The City projector corona Q ##
# 1) show how many people vaccined the first vaccine
SELECT count(VID1)
from persons
where VID1 is NOT NULL;

#2) how many persons over 60age ther allredy vaccined
SELECT count(PID)into @overSixty 
FROM persons  
WHERE date_of_brith < DATE_SUB(NOW(),INTERVAL 60 YEAR);

select concat(round ((100* @overSixty) /(select count(PID) FROM persons)) , '%' ) as result
from persons
group by result;

#3) show the inventory
select HMO_ID, HMO_name, city ,inventory 
from hmo
where city is NOT NULL;

#4) show all the next week order supply
SELECT OID 
FROM orders  
WHERE Supply_date BETWEEN current_date AND current_date + interval 7 day;

#5) show the hmo thst vaccined the most the first vaccined >> VID1
select HMO_ID , count(HMO_ID) as countt
from persons
where VID1 is not null
group by HMO_ID order by countt desc limit 1;

## The laboratory Q ##

#1) Which HMO ordered the most vaccines.
select HMO_ID ,HMO_name , sum(Vaccines_amount) as amount
from orders JOIN hmo using (HMO_ID)
group by HMO_ID order by amount desc limit 1;

#2) Which day is the most popular to supply.
select dayofweek(Supply_date) , count(dayofweek(Supply_date)) as countDay
from orders
group by dayofweek(Supply_date) order by countDay desc limit 1;

#3) Show all the vaccines which are expired in this week.
SELECT vid , validity 
FROM vaccine  
WHERE validity BETWEEN current_date AND current_date + interval 7 day;

#4) Show all the orders to supply for today.
SELECT vid , validity 
FROM vaccine  
WHERE validity = current_date;

#5) show all the HMOs that order from specific laboratory.
select distinct HMO_ID
from orders
where LID = '21' ;

## The HMO Q ##

 #1) Show all the patients that over 60 age.
select *
from persons
where date_of_brith < DATE_SUB(NOW(),INTERVAL 60 YEAR) and HMO_ID = '313';
 
 #2) Show all the future vaccines orders.
SELECT OID , Supply_date
FROM orders  
WHERE Supply_date >= current_date ;

#3) Show all the vaccines which are expired in this week.
SELECT VID , validity
FROM vaccine  
WHERE validity BETWEEN current_date AND current_date + interval 7 day ;

#4) Show current vaccine amount.
select HMO_name, inventory
from hmo;

## The delivery_company Q ##

#1) Show the expected order for the next week.
SELECT *  
FROM orders  
WHERE Supply_date BETWEEN current_date AND current_date + interval 7 day;

#2) show the lab that orders the most deliveries
select LID , count(LID) as countID
from orders
group by LID order by countID desc limit 1;

#3) Show all HMOs that receive orders today.
select distinct * 
from orders
where Supply_date =current_date;





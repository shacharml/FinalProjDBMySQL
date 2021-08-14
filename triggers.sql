USE vaccinationdelivetydb;
#TABLE FOR CHEKING THE TRIGGERS
create table TRIGGERS_TEST (MESSAGE varchar(100));

SHOW triggers
from vaccinationdelivetydb;

select* FROM triggers_test;

#1)Check for valid supply date, if not valid set supply date for the next week.
DELIMITER $
create trigger BEFOR_SUPPLAY_TRIGGER before insert
		ON orders
		for each row begin
			IF NEW.Supply_date < current_date() THEN
				SET NEW.Supply_date = (current_date() + interval 7 day);
                insert into triggers_test values('TRIGGER  WORKS - SUPPLAY DATE');
			else
				insert into triggers_test values('TRIGGER NOT WORKS - SUPPLAY DATE');
			END IF;
            END$
DELIMITER ;

insert into orders
VALUES(131, 22, 311 ,205 , 300 ,'2021-02-06');
select* FROM orders;
select* FROM triggers_test;

#2) Check if the date of birth is valid and if not send an error message.
DELIMITER $$
create trigger IS_VALID_BDAY_TRIGGER before insert
	on persons
    for each row begin
		IF NEW.date_of_brith < current_date() THEN
			insert into triggers_test values('TRIGGER NOT WORKS - VALID BDAY');
		else
			insert into triggers_test values('TRIGGER WORKS - INVALID BDAY');
			signal SQLSTATE '45000' SET MESSAGE_TEXT = 'INVALID BDAY';
		end if;
        END$$
DELIMITER ;

insert into persons
VALUES(2067800, 'MOSHE','Asaf',0586645563,'2022-12-11',NULL,NULL,313);

# 3)If a person gets vaccinated, the vaccine inventory in his HMO gets an update. (subtract one vaccine from the inventory)
DELIMITER $$
create trigger UPDATE_INVENTORY_HMO_TRIGGER after update
	ON persons
    for each row begin
		update hmo
        SET inventory = inventory-1
        where HMO_ID = NEW.HMO_ID;
       # signal SQLSTATE '1' SET MESSAGE_TEXT = 'THE HMO INVENTORY WAS UPDATE';
	END$$
DELIMITER ;
  
  
## UPDATES ##
   
# 1) Update the number of vaccines for the existing order.
update orders
set Vaccines_amount = Vaccines_amount+ 500
where OID = 112;

#2) chang HMO address
update hmo
set street = 'Herzel' , num = 19
where HMO_ID = 312;

#3) update person vaccination stattus
update persons
SET VID2 = 023
where PID = '2067803';

USE VaccinationDelivetyDB;

INSERT INTO  laboratory VALUES
(21,'Teva','Tel Aviv' , 'Gordon',5),
(22,'Moderna','Yehud' , 'HaShita',14),
(23,'Altman','Haifa' , 'HaCharmel',3);
select* from laboratory;

INSERT INTO Persons VALUES
(2067801,'Goldfarb','Isaac','0543088222','1997-02-22',NULL,NULL,311),
(2067302, 'Ofir','Moti',0541234567, '1957-02-10', 002,NULL,311),
(2017231, 'Lazaar','Eti',0502235698,'1960-05-25',003,NULL,312),
(2147301, 'Kochavi','Israel',0537756698,'1950-10-15',004,NULL,312),
(2027301, 'Levy','Shlomi',0554711236,'1996-02-20',005,019,313),
(2098999, 'Klein','Tamar',0573022441,'1948-03-28',006,018,313),
(2017821, 'Haber','Yona',0541238874,'1950-08-29',007,017,313),
(2063831, 'Levy','Moshe',0546708896,'1974-10-10',008,NULL,311),
(2162201, 'Ezra','Gidoon',0587745563,'1994-04-23',009,NULL,312),
(2017101, 'Fogel','Shimon',0543201455,'1990-05-06',010,NULL,313),
(2062561, 'Shachar','Males',0587745563,'1964-02-21',011,NULL,311),
(2061231, 'Niv','Eliyahu',0587745563,'1996-08-14',NULL,NULL,312),
(2067803, 'haim','Asaf',0587745563,'1962-12-11',NULL,NULL,313);
select* from Persons;

INSERT INTO vaccine VALUES
(001 , 21 , '2021-02-22'),
(002 , 21 , '2021-02-22'),
(003 , 21 , '2021-12-01'),
(004 , 21 , '2021-05-28'),
(005 , 21 , '2022-03-17'),
(006 , 22 , '2022-11-20'),
(007 , 22 , '2022-10-12'),
(008 , 22 , '2023-01-13'),
(009 , 22 , '2023-01-14'),
(010 , 22 , '2023-05-05'),
(011 , 22 , '2022-07-21'),
(012 , 23 , '2022-07-21'),
(013 , 23 , '2022-07-21'),
(014 , 23 , '2023-09-12'),
(015 , 23 , '2023-08-15'),
(016 , 23 , '2021-02-02'),
(017 , 22 , '2023-01-14'),
(018 , 22 , '2023-05-05'),
(019 , 22 , '2022-07-21'),
(020 , 23 , '2022-07-21'),
(021 , 23 , '2022-07-21'),
(022 , 23 , '2023-09-12'),
(023 , 23 , '2023-08-15'),
(024 , 23 , '2021-02-02');
INSERT INTO vaccine VALUES
(025 , 23 , now());
select* from vaccine;

INSERT INTO hmo VALUES
(311, 'Macabi', 'GOTHAM' ,'HaHcita' ,18 ,null),
(312, 'Clalit', 'GOTHAM' ,'HaHtalef' ,12, 100),
(313, 'Leomit', 'GOTHAM' ,'HaBrosh' ,18, 20);
select* from hmo;

INSERT INTO delivery_company VALUES
(205, 'DHL'),
(206, 'Cheetah'),
(207, 'Mesira'),
(208, 'Fedex'),
(209, 'Deal delivery');

select* from delivery_company;

INSERT INTO Orders VALUES
(111, 21, 311 ,205 , 300 ,'2021-02-22'),
(112, 23, 311 ,209 , 80 ,'2021-01-30'),
(113, 22, 311 ,206 , 550 ,'2021-10-12'),
(114, 21, 311 ,208 , 120 ,'2022-01-01');
INSERT INTO Orders VALUES
(115, 22, 311 ,206 , 550 ,'2021-02-07');
INSERT INTO Orders VALUES
(116, 22, 311 ,206 , 300 ,NOW());
select* from Orders;



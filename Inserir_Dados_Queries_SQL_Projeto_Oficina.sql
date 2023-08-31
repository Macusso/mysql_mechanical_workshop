-- Inserção de dados e queries
show databases;
use mechanical_workshop;
show tables;
use information_schema;

-- idCliente, Fname, Lname, CPF, Address, Contact
insert into Clients (Fname, Lname, CPF, Address, Contact) values
		  ('Sara','Lemos',12346789254,'rua azul 29, Rio Janeiro', 895623214),
		  ('Rita','Candido',85446789254,'rua do mel 854, Rio Janeiro', 986532589),
          ('Mario','Nunes',47510789254,'av da praia 214, Rio Janeiro', 784512580),
          ('Leila','Costa',45896289254,'rua principal 100, Petropolis', 963258741),
          ('Nuno','Marecos',01478789254,'rua do sol 929, Rio Janeiro', 898520147),
          ('Maria','Julia',36587789254,'rua do bispo 325, Rio Janeiro',563698520);
          

-- idPayment, idPaymentClient, paymentDebit, paymentCredit
 insert into payment (idPaymentClient, paymentDebit, paymentCredit) values
             (1, 124587, 2589634),
             (2, 785425, 8998541),
             (3, 456542, 3652540),
             (4, 652513, 7414786);


-- idCar, idCarClient, carRegistration, carBrand, carModel, carYear
 insert into car (idCarClient, carRegistration, carBrand, carModel, carYear) values
             (1, 'SZA4578','Fiat','Siena',2010),
             (2, 'POU3210','Ford','Focus',2015),
             (3, 'NJK9635','Nissan','Sentra',2020),
             (4, 'ZDV2525','Honda','Fit',2019),
             (5, 'MJH6582','Renault','Duster',2012);
             
             
 -- idRepair, idRepairClient, repairStatus, repairDescription, repairValue 
 insert into repairs (idRepairClient, repairStatus, repairDescription, repairValue) values
             (1,null,'Motor',1500),
             (2,'Em conserto','Chaparia',1000),
             (3,null,'Manutenção',600),
             (4,null,'Porta',500);
             
             
 -- idMechanic, FMECname,  LMECname, mecCPF, mecAddress, mecContact 
insert mechanic(FMECname, LMECname, mecCPF, mecAddress, mecContact) values
			('Paulo','Castro',12457896325,'rua dos anjos 563 São Paulo','896532147'), 
			('Mateus','Lima',12457847850,'rua dos bolos 27 Rio Janeiro','985847145'),
            ('Marcio','Pires',24891896325,'rua dos patos 258 São Paulo','784232147'),
			('Lucio','Jacinto',74256896325,'rua do relogio 56 São Paulo','472532147');          
             

-- idMrMechanic, idMrRepair, mrquantity
insert into mechanicRepair (idMrMechanic, idMrRepair, mrquantity) values
				(1,3,12),
                (2,1,10);


-- Queries

show databases;
show tables;

select * from Repairs;

select Fname,Lname, idRepair, repairStatus from clients c, repairs o where c.idClient = idRepairClient;
select * from mechanic order by FMECname asc; 
select concat(Fname ,'', Lname) as complete_name from clients;

select Fname,carBrand,carModel from car ca, clients cl where ca.idCar = idClient;  
select * from car;

select idRepairClient, repairStatus, repairDescription, repairValue from repairs where repairValue >=600;

select fName, Lname, CPF, repairDescription, repairValue from clients e join repairs on idClient = idRepairClient;
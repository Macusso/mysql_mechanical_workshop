-- Criação do bando de dados para o cénario de uma oficina

-- drop database mechanical_workshop; 
show databases;

create database mechanical_workshop;
use mechanical_workshop;

-- Criar tabela Cliente
create table clients(
	idClient int auto_increment primary key,
    Fname varchar(10),
    Lname varchar(20),
    CPF char(11) not null,
    Address varchar(50),
    Contact char(11),
    constraint unique_cpf_client unique (CPF)
);
  
alter table clients auto_increment=1;

-- criar tabela pagamento
create table payment(
	idPayment int auto_increment primary key,
    idPaymentClient int,
    paymentDebit int,
    paymentCredit int,
    constraint fk_payment_client foreign key (idPaymentClient) references clients(idClient)
);


-- criar tabela carro
create table car(
	idCar int auto_increment primary key,
    idCarClient int,
    carRegistration varchar(10),
    carBrand varchar(15),
	carModel varchar(15),
    carYear int,  
    constraint fk_car_client foreign key (idCarClient) references clients(idClient)
		on update cascade
);

-- criar tabela conserto
create table repairs(
	idRepair int auto_increment primary key,
    idRepairClient int,
    repairStatus enum('Cancelado","Em conserto', 'Terminado') default 'Em conserto',
    repairDescription varchar(255),
    repairValue int,
	constraint fk_repair_client foreign key (idRepairClient) references clients(idClient)
		on update cascade
);

-- criar tabela mecanico
create table mechanic(
	idMechanic int auto_increment primary key,
    FMECname varchar(15),
    LMECname varchar(20),
    mecCPF char(11) not null,
    mecAddress varchar(50),
    mecContact char(11),
    constraint unique_mechanic unique (mecCPF)
);

-- criar tabela mecanico/conserto
create table mechanicRepair(
	idMrMechanic int,
    idMrRepair int,
    mrquantity int not null,
    primary key (idMrMechanic, idMrRepair),
	constraint fk__mechanic_repair foreign key (idMrRepair) references repairs(idRepair),
    constraint fk_product_product foreign key (idMrMechanic) references mechanic(idMechanic)
);





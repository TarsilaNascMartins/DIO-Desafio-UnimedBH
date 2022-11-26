create database oficina;

use oficina;

-- tabela cliente
create table clients(
idClient int auto_increment primary key unique,
Name varchar(45), 
CPF char(11) not null,
contato varchar(200),
carro varchar (200),
constraint unique_cpf_client unique (CPF)
);

alter table clients auto_increment = 1; 

-- tabela car
create table car(
idCar int auto_increment primary key unique,
idCarClient int,
Modelo varchar(45) not null, 
Ano char(4) not null,
CONSTRAINT fk_car_client FOREIGN KEY (idCarClient)
REFERENCES clients (idClient)
);

-- tabela pedido
CREATE TABLE orders (
    idOrders INT AUTO_INCREMENT PRIMARY KEY unique,
    idOrdersClient INT,
    observação varchar(220),
    ordersStatus ENUM('Cancelado', 'Confirmado', 'Em processamento') DEFAULT 'Em processamento',
	serviço ENUM('Concerto', 'Revisão', 'Em analise') DEFAULT 'Em analise',
    dataSolicitação date,
    CONSTRAINT fk_orders_client FOREIGN KEY (idOrdersClient)
	REFERENCES clients (idClient)
);


-- tabela ordem serviço
CREATE TABLE ordemService (
    idOrdemService INT AUTO_INCREMENT PRIMARY KEY unique,
	ordemServiceStatus ENUM('Cancelado', 'Confirmado', 'Em processamento') DEFAULT 'Em processamento',
	dataEmissão date,
	dataEntrega date
);


-- tabela valores
CREATE TABLE valueTotal (
    idValue INT  auto_increment PRIMARY KEY unique,
	idValueOrdemService INT,
    CONSTRAINT fk_value_ordemService FOREIGN KEY (idValueOrdemService)
	REFERENCES ordemService (idOrdemService)
);

-- tabela valor mão de obra
CREATE TABLE valueTrabalho (
    idvalueTrabalho INT PRIMARY KEY unique,
	preçotrabalho float
);

-- tabela peças 
CREATE TABLE peçasOrçamento (
    idpeçasOrçamento INT PRIMARY KEY unique,
	quantityOrçamento int
);

create table peças (
    idpeçasCompradas INT PRIMARY KEY unique,
	quantityPeça int,
    valorPeça float
);

-- tabela mecânicos
create table mecanico(
idMecanico int auto_increment primary key unique,
NomeMecanico varchar(45), 
especialidade varchar(200),
endereço varchar (200)
);

-- tabela equipe mecânicos
create table equipeMecanico(
idEquipe int auto_increment primary key unique,
Departamento varchar(45)
);

-- tabela equipe formadas 
create table equipeFormadas(
idEquipePertenceEquipeMecanica int,
idEquipeContemMecanico INT,
CONSTRAINT fk_equipe_contem_mecanico FOREIGN KEY (idEquipeContemMecanico)
REFERENCES mecanico (idMecanico),
CONSTRAINT fk_equipe_pertence_equipemecanica FOREIGN KEY (idEquipePertenceEquipeMecanica)
REFERENCES equipeMecanico(idEquipe)
);







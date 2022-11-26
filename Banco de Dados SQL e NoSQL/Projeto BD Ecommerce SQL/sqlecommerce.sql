create database ecommerce;

use ecommerce;

-- tabela cliente
create table clients(
idClient int auto_increment primary key,
Fname varchar(10), 
Minit char(3),
Lname varchar(20),
CPF char(11) not null,
Adress varchar(200),
constraint unique_cpf_client unique (CPF)
);

alter table clients auto_increment = 1; 

-- tabela produto
-- size dimensao produto
create table product(
idProduct int auto_increment primary key,
Pname varchar(40), 
classification varchar(30),
category enum('eletronico','vestimenta','brinquedo')not null,
avaliação float,
size varchar(10)
);

-- tabela pedido
CREATE TABLE orders (
    idOrders INT AUTO_INCREMENT PRIMARY KEY,
    idOrdersClient INT,
    ordersStatus ENUM('Cancelado', 'Confirmado', 'Em processamento') DEFAULT 'Em processamento',
    ordersDescription VARCHAR(255),
    sendValue INT DEFAULT 10,
    CONSTRAINT fk_orders_client FOREIGN KEY (idOrdersClient)
        REFERENCES clients (idClient)
);


-- tabela pagamento 
CREATE TABLE payments (
    idOrders INT PRIMARY KEY,
    id_payment INT,
    typePayment ENUM('Boleto', 'Dinheiro', 'Pix'),
    limitAvailable FLOAT,
    payment BOOL DEFAULT FALSE,
	constraint fk_payment_orders foreign key (idOrders) references orders(idOrders)
);

-- tabela estoque
create table productStorage(
idStorage int auto_increment primary key,
quantity int default 0,
stotageLocation varchar(255)
);

-- tabela fornecedor
CREATE TABLE supplier(
idSupplier int auto_increment primary key,
SocialName varchar(255) not null,
CNPJ char(15) not null,
contact char(11) not null,
constraint unique_supplier unique (CNPJ)
);

-- tabela vendedor
CREATE TABLE seller(
idSeller int auto_increment primary key,
SocialName varchar(255) not null,
AbstractName varchar(25),
location varchar (200),
CNPJ char(15),
CPF char (9),
contact char(11) not null,
constraint unique_cnpj_seller unique (CNPJ),
constraint unique_cpj_seller unique (CPF)
);

CREATE TABLE productSeller( 
idSupplier int,
idProduct int,
prodQuantity int not null default 1,

constraint fk_product_supplier foreign key (idSupplier) references supplier(idSupplier),
constraint fk_product_product foreign key (idProduct) references product(idProduct)
);

desc productSeller;

CREATE TABLE productOrder( 
idProduct int,
idOrders int,
poQuantity int default 1,
poStatus ENUM('Disponível', 'Sem estoque') default 'Disponível',

constraint fk_productorder_seller foreign key (idProduct) references product(idProduct),
constraint fk_productorder_product foreign key (idOrders) references orders(idOrders)
);

CREATE TABLE storageLocation( 
idProduct int,
idStorage int,
location varchar (255) not null,

constraint fk_storage_location_product foreign key (idProduct) references product(idProduct),
constraint fk_storage_location_storage foreign key (idStorage) references productStorage(idStorage)
);

-- tabela entrega

CREATE TABLE delivery( 
idDelivery int auto_increment primary key,
deliveryStatus ENUM('Entregue', 'Em processo') default 'Em processo',
codigoRastreio varchar (255) default 0
);







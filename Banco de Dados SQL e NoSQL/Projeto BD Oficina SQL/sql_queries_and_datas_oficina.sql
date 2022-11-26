-- Inserção de dados na Oficina Mecanica
-- Visualizando as tabelas criadas (existentes no BD ecommerce)

use oficina;
show tables;

-- Visualizando as colunas da tabela Cliente
desc clients;

-- Inserindo dados na tabela clients
-- Name varchar(45), CPF char(11) not null,contato varchar(200),carro varchar (200)

insert into clients ( Name, CPF, contato,carro)
	values('Tarsila','45876325879','456445656', 'HB20'),
	      ('Rodrigo','4652489562','465455456','Mercedes'),
          ('Gabriele','21563256987','4654646445465','Palio'),
          ('Daiane','85246975863','546546545','Corsa'),
          ('Paulo','1236985674','454564545646','Sandero'),
		  ('Cintia','12563256879','566456465456','Mob');

-- Inserindo dados na tabela car

desc car;

insert into car (Modelo,Ano)
	values ('45525554','2000'),
           ('477777','2022'),
           ('73343434','2017'),
           ('566984','2003'),
           ('4455522','2010'),
		   ('56654422','2000');
          
 select * from clients;
 select * from car;
 
 -- Inserindo dados na tabela Pedido
desc orders;     

-- observação varchar(220),    ordersStatus ENUM('Cancelado', 'Confirmado', 'Em processamento') DEFAULT 'Em processamento'
-- serviço ENUM('Concerto', 'Revisão') DEFAULT 'Em analise',    dataSolicitação date
  
insert into orders(idOrdersClient, ordersStatus, serviço, dataSolicitação)
	values(1, default, 'Concerto', "2022-09-22"),
		  (2, "Confirmado", 'Revisão',"2022-09-22"),
          (3,'Confirmado', 'Revisão',"2022-09-22");
          
   -- Inserindo dados na tabela ordemService
   
   -- ordemServiceStatus ENUM('Cancelado', 'Confirmado', 'Em processamento') DEFAULT 'Em processamento',
   -- idOrdersServices INT,	dataEmissão date,	dataEntrega date, tipoServiço ENUM('Conserto', 'Revisão', 'Em processamento') DEFAULT 'Em processamento'
  
  insert into ordemService(ordemServiceStatus , dataEmissão, dataEntrega )
  values( "Cancelado", '2022-09-22','2022-09-22'),
		( "Confirmado", "2022-09-22","2022-09-22"),
		('Confirmado', "2022-09-22","2022-09-22");
        
- -- Inserindo dados na valueTrabalho

--  valueTrabalho (    idvalueTrabalho INT PRIMARY KEY unique,	preçotrabalho float);
  insert into valueTrabalho (idvalueTrabalho, preçotrabalho )
  values( 1, 200.50 ),
		( 2, 125.9),
		(3, 56.9);

- -- Inserindo dados peçasOrçamento 
-- peçasOrçamento ( idpeçasOrçamento INT PRIMARY KEY unique, quantityOrçamento int);
insert into peçasOrçamento (idpeçasOrçamento,  quantityOrçamento )
values( 35689, 10),
		( 255464, 2),
		(32564, 3);

- -- Inserindo dados peças
-- peças (    idpeçasCompradas INT PRIMARY KEY unique,	quantityPeça int,    valorPeça float);
insert into peças ( idpeçasCompradas , quantityPeça, valorPeça  )
values(35689, 22, 23.9),
		(8556323, 200, 12.36 ),
		(32564, 120, 100.2);

-- Inserindo dados na tabela mecanico
--  mecanico(Name varchar(45), especialidade varchar(200),endereço varchar (200));
insert into mecanico ( NomeMecanico , especialidade, endereço )
values("Robersvaldo", "Engenheiro Mecânico","Rua 1"),
		("Adriano Salem", "Eletricista","Rua 2"),
        ("Adriana", "Pintura","Rua 3");

-- Inserindo dados na equipe mecanicos

-- equipeMecanico(idEquipe int auto_increment primary key unique,Departamento varchar(45));
insert into equipeMecanico ( Departamento )
values("Conserto"),
		("Revisão");


    
           
select * from clients;

-- Contagem total de clientes
select count(*) from clients;
    
           
-- Relação cliente e pedido
select sum(e.idClient) as 'Client', p.Pname from orders e inner join idOrdersClient  p on p.idClient=e.idClient
group by p.Pname order by p.Pname;           
           
 -- relação produtos e vendedor          
 select * from  mecanico inner join equipeFormadas on mecanico.idMecanico  = equipeFormadas.idMecanico ;

           
           
          
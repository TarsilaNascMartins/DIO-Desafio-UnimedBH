-- Inserção de dados no e-Commerce
-- Visualizando as tabelas criadas (existentes no BD ecommerce)
use ecommerce;
show tables;

-- Visualizando as colunas da tabela Cliente
desc clients;

-- Inserindo dados na tabela Cliente

-- idClient int auto_increment primary key,Fname varchar(10), Minit char(3),Lname varchar(20),CPF char(11) not null,Adress varchar(30),
-- constraint unique_cpf_client unique (CPF)

insert into clients (Fname, Minit , Lname, CPF, Adress)
	values('Tarsila', 'N', 'Martins','45876325879','Rua 2, 4556, São Paulo-São Paulo'),
	      ('Rodrigo', 'M', 'Passos','4652489562','Rua 3, 4556, São Paulo-São Paulo'),
          ('Gabriele', 'N', 'Silva','21563256987','Rua 4, 4556, São Paulo-São Paulo'),
          ('Daiane', 'O', 'Alves','85246975863','Rua 5, 4556, São Paulo-São Paulo'),
          ('Paulo', 'P', 'Amorim','1236985674','Rua 6, 4556, São Paulo-São Paulo'),
		  ('Cintia', 'R', 'Carvalho','12563256879','Rua 7, 4556, São Paulo-São Paulo');

-- Inserindo dados na tabela Produto

desc product;
-- idProduct int auto_increment primary key,Pname varchar(10), classification varchar(30),category enum('eletronico','vestimenta','brinquedo')not null,
-- avaliação float,size varchar(10)

insert into product (Pname, classification , category, avaliação, size)
	values ('Vestido','Feminino','vestimenta', 4.4, null),
           ('Celular','Geral','eletronico', 3.2, "3x15x20"),
           ('Boneca Elsa','Feminino','brinquedo', 5.0, "10x30x30"),
           ('Bermuda Praia Verde','Masculino','vestimenta', 3.4, null),
           ('Brinquedo Homem Aranha','Geral','brinquedo', 4.4, "10x20x10"),
		   ('Roupa maternidade','Criança','vestimenta', 2.4, null);
          
          
 select * from clients;
 select * from product;
 
 -- Inserindo dados na tabela Pedido
desc orders;     

-- idOrders INT AUTO_INCREMENT PRIMARY KEY, idOrdersClient INT, ordersStatus ENUM('Cancelado', 'Confirmado', 'Em processamento') DEFAULT 'Em processamento',
 --  ordersDescription VARCHAR(255), sendValue FLOAT DEFAULT 10,     
insert into orders(idOrdersClient, ordersStatus, ordersDescription,sendValue)
	values(1, default, 'compra pelo app', 10),
		  (2, default, 'troca imediata',30),
          (3,'Confirmado', 'compra pela web',25);
          
  
 -- Inserindo dados na tabela Estoque
 
desc productStorage;

-- quantity int default 0, stotageLocation varchar(255)
insert into productStorage(quantity, stotageLocation)
	values (20,'São Paulo'),
			(400, 'Bahia'),
			(92,'Curitiba'),
             (73, 'Goiânia');
 
-- Inserindo dados na tabela Fornecedor
desc supplier;

-- SocialName varchar(255) not null,CNPJ char(15) not null,contact char(11) not null

insert into supplier(SocialName,CNPJ,contact)
	values ('Marisa ltda','45863254789652','125632545'),
		   ('Eletronica Monteiro ltda','4558698263248','1125689563'),
           ('Casa e Banho','589654782346985','1123658795');

-- Inserindo dados na tabela Vendedor
desc seller;

-- SocialName varchar(255) not null,AbstractName varchar(25),location varchar (200),CNPJ char(15),CPF int (9),contact char(11) not null,
insert into seller(SocialName, AbstractName, location, CNPJ, CPF, contact)
	values ('Alessandra Modas ME', 'Ale Modas', 'SC', '152684632569875',null, '2256875632'),
		   ('Eletronicos Sebastião Tavares', 'EletroPop', 'RJ', '568452369752', null,'112563258');
           
-- Inserindo dados na tabela Produto_vendedor
desc productSeller;
-- idSupplier int,idProduct int,
insert into productSeller(idSupplier, idProduct )
	values(1,2),
		  (1,3),
          (2,1),
          (2,5);  
           
          
desc productOrder;
-- idProduct int,idOrders int,poQuantity int default 1,poStatus ENUM('Disponível', 'Sem estoque') default 'Disponível'

select * from orders; 
insert into productOrder(idProduct,idOrders,poQuantity,poStatus)
	values(1, 1, 15, default),
		  (2, 1, 3, default),
          (3, 2, 6, default),
		  (4, 2, 5, default);
          
           
-- Inserindo dados na tabela storageLocation

desc storageLocation;

-- idProduct int,idStorage int,location varchar

insert into storageLocation(idProduct, idStorage,location)
	values(1, 4, 'sp'),
		  (2, 3,'sp'),
          (3, 2,'sc'),
          (4, 1,'rj');
        
           
select * from productSeller;

-- Contagem total de clientes
select count(*) from clients;

-- inserção de um novo pedido
insert into orders(idOrdersClient, ordersStatus, ordersDescription,sendValue)
	values(6, default, 'compra pelo app com promo', 100);      
           
-- Relação produto e pedido
select sum(e.poQuantity) as 'Quantidade', p.Pname from productOrder e inner join product p on p.idproduct=e.idproduct
group by p.Pname order by p.Pname;           
           
 -- relação produtos e vendedor          
 select * from  product  inner join productSeller on product.idProduct = productSeller.idProduct;

           
           
          
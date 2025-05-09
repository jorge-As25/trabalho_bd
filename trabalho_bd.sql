create database PASCOTTO;
use PASCOTTO;

CREATE TABLE clientes(
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
	nome VARChar(200),
	data_nascimento date,
	CPf int,
	endereco varchar(200),
	id_produto int,
	constraint fk_pedido_produto foreign key (id_cliente) references pedidos(id_pedido_cliente)
 );
 
 create table produtos(
	id_produto int auto_increment primary key,
	nome_produto varchar(200),
	quantidade int,
	valor double
);

create table pedidos(
	id_pedido int auto_increment primary key,
	nome_cliente varchar(200),
	quant_pedidos int,
	data_entrega date,
	numero_pedido int,
	constraint fk_produto_cliente foreign key (id_pedido) references produtos(id_produto)
);
 
 
 create table funcionarios(
	 id_funcionario INT auto_increment primary key,
	 nome varchar(200),
	 data_admissao date,
	 cargo int,
	 constraint fk_cargo_funcionario foreign key(id_funcionario) references cargos(id_cargo)
 );
 
 create table cargos(
	id_cargo int auto_increment primary key,
	supervisor varchar(200),
	vendedor varchar(200),
	suporte_ti varchar(200)
 );
 
 
insert into produtos (nome_produto, quantidade, valor) values
('arroz','2','10');

insert into produtos  (nome_produto, quantidade, valor) values
('batata','10','20'),
('cafe','5','20'),
('teclado','5','340'),
('monitor','10','500'),
('guarda chuva','12','29'),
('chinelo','10','24');


insert into funcionarios (nome, admissao, cargo) values
('judas silva','03/25/2023','1'),
('malafaia santos','09/04/2024','1'),
('anitta malfoy','25/12/2024','2'),
('sabrina carpinteira','03/09/2024','2'),
('eliezer aparecido','01/02/2025','2'),
('gloria jesus','03/05/2025','2'),
('jorge araujo','09/05/2025','3');


insert into clientes (nome, data_nascimento, endereco) values
('jorge','25/06/2006','rua a '),
('gustavo ','11/04/1999','rua b'),
('mateus ','10/11/2003','rua j'),
('tiago','46/08/2006','rua a'),
('pablo','13/09/2000',' rua s'),
('victor','08/06/2000','rua k'),
('blanes','13/98/2000','rua o');

insert into pedidos (nome_cliente, quant_pedidos, numero_pedido) values 
('jorge','1','10'),
('gustavo','2','12'),
('victor ','3','13'),
('pablo','5','20'),
('blanes','8','54'),
('tiago','3','8'),
('mateus','2','6');


 alter table clientes  modify column data_nascimento varchar(200);
 alter table pedidos add column id_pedido_cliente int;
  alter table produtos add column id_pedido int ;
  alter table produtos drop id_pedido;
  alter table funcionarios drop data_admissao;
  alter table funcionarios add column admissao varchar(200);
  alter table cargos add column id_funcionarios int;
  alter table funcionarios add column id_cargo int;
  alter table funcionarios drop foreign key fk_cargo_funcionario;
 alter table funcionarios add constraint fk_cargo_funcionario foreign key (id_cargo) references cargos(id_cargo);
 alter table clientes add column id_pedido int;
 alter table clientes drop constraint fk_pedido_produto;
 alter table clientes add constraint fk_pedido_produto foreign key (id_pedido) references pedidos(id_pedido);
 alter table clientes drop column CPF;
 alter table pedidos drop column data_entrega;

 
 select * from clientes;
 select * from produtos;


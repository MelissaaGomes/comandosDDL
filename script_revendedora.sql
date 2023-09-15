create database revendedora;
use revendedora;


create table automovel(
codigo_nacional  int UNIQUE NOT NULL PRIMARY KEY,
placa char(7) UNIQUE NOT NULL,
marca varchar(20) NOT NULL,
modelo varchar(30) NOT NULL,
ano_fabricacao date NOT NULL,
ano_modelo date NOT NULL, 
cor varchar(15) NOT NULL,
motor varchar(40) NOT NULL,
numero_portas int NOT NULL,
tipo_combustivel varchar(20) NOT NULL,
preco float NOT NULL
);

create table endereco(
CEP varchar(8) NOT NULL PRIMARY KEY,
rua varchar(40) NOT NULL,
bairro varchar(20) NOT NULL,
cidade varchar(20) NOT NULL,
estado varchar(20) NOT NULL
);

create table clientes(
codigo_numerico  int UNIQUE NOT NULL PRIMARY KEY,
nome varchar(40) NOT NULL,
sobrenome varchar(40) NOT NULL,
telefone char(10) NOT NULL,
fk_endereco_completo_CEP varchar(8) NOT NULL,
endereco_numero int,
endereco_complemento varchar(30) default '',
foreign key (fk_endereco_completo_CEP) references endereco (CEP)
);

create table vendedores(
codigo_numerico  int UNIQUE NOT NULL PRIMARY KEY,
nome varchar(40) NOT NULL,
sobrenome varchar(40) NOT NULL,
telefone char(10) NOT NULL,
fk_endereco_completo_CEP varchar(8) NOT NULL ,
data_admissao date,
salario_fixo int,
foreign key (fk_endereco_completo_CEP) references endereco (CEP)
);


create table negocio(
cod_venda  int UNIQUE NOT NULL PRIMARY KEY,
data_venda date, 
preco_pago float NOT NULL,
fk_comprador int UNIQUE NOT NULL, 
fk_vendedor int UNIQUE NOT NULL,
fk_automovel int UNIQUE NOT NULL,
foreign key (fk_comprador) references clientes (codigo_numerico),
foreign key (fk_vendedor) references vendedores (codigo_numerico),
foreign key (fk_automovel) references automovel (codigo_nacional)
);



create database eleicao;
use eleicao;

create table cargo(
codigo_Cargo int UNIQUE NOT NULL PRIMARY KEY,
nome_Cargo varchar(30) UNIQUE NOT NULL
CHECK(nome_Cargo != 'Prefeito' and 'Vereador'),
salario float NOT NULL DEFAULT 17.000,
numero_Vagas int UNIQUE NOT NULL
);

create table candidato(
numero_Candidato int UNIQUE NOT NULL PRIMARY KEY,
nome varchar(40) UNIQUE NOT NULL,
fk_codigo_Partido int NOT NULL,
fk_cod int UNIQUE NOT NULL,
foreign key (fk_cod) references cargo (codigo_Cargo),
foreign key (fk_codigo_Partido) references partido (codigo_Partido)
);

create table voto(
fk_titulo_Eleitor varchar(30) UNIQUE NOT NULL,
fk_numero_Candidato int NOT NULL,
foreign key (fk_numero_candidato) references candidato (numero_Candidato),
foreign key (fk_titulo_Eleitor) references eleitor (titulo_Eleitor)
);

create table partido(
codigo_Partido int UNIQUE NOT NULL PRIMARY KEY,
sigla char(5) UNIQUE NOT NULL,
nome varchar(40) UNIQUE NOT NULL,
numero int UNIQUE NOT NULL
);

create table eleitor(
titulo_Eleitor varchar(30) UNIQUE NOT NULL PRIMARY KEY,
zona_Eleitoral char(5) NOT NULL,
sessao_Eleitoral char(5) NOT NULL,
nome varchar(40) NOT NULL
);


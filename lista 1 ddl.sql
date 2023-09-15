create database clinica;

create table sala(
numero_sala int,
andar int
);

create table medicos(
CRM varchar(15),
nome varchar(40),
idade int,
especialidade char(20),
cpf varchar(15),
data_de_admissao date
);

create table pacientes(
RG varchar(15),
nome varchar(40),
data_nascimento date,
cidade char(30),
doenca varchar(40),
plano_saude varchar(40)
);

create table funcionarios(
matricula varchar(15),
nome varchar(40),
data_nascimento date,
data_admissao date,
cargo varchar(40),
salario float
);

create table consultas(
codigo_consulta int,
data_horario datetime
);
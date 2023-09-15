create database clinica;
use clinica;


create table pacientes(
paciente_id int UNIQUE NOT NULL PRIMARY KEY,
RG varchar(15) UNIQUE NOT NULL,
nome varchar(40) NOT NULL,
data_nascimento date,
cidade char(30) DEFAULT 'Itabuna',
doenca varchar(40) NOT NULL,
plano_saude varchar(40) NOT NULL DEFAULT 'SUS'
);

create table consultas(
codigo_consulta int UNIQUE NOT NULL PRIMARY KEY,
data_horario datetime,
fk_paciente_id int UNIQUE NOT NULL,
foreign key (fk_paciente_id) references pacientes (paciente_id)
);

create table medicos(
CRM varchar(15) NOT NULL UNIQUE PRIMARY KEY,
nome varchar(40) NOT NULL,
idade int 
CHECK(idade > 23),
especialidade char(20) NOT NULL DEFAULT 'Ortopedia',
cpf varchar(15) UNIQUE NOT NULL,
data_de_admissao date,
codigo_atendimento int UNIQUE NOT NULL,
foreign key (codigo_atendimento) references consultas (codigo_consulta)
);

create table sala(
numero_sala int NOT NULL PRIMARY KEY
CHECK(numero_sala > 1 and numero_sala < 50),
andar int NOT NULL UNIQUE
CHECK(andar < 12),
fk_consulta int NOT NULL UNIQUE,
foreign key (fk_consulta) references consultas(codigo_consulta)
);

create table ala(
codigo int UNIQUE NOT NULL PRIMARY KEY,
area varchar(30),
fk_n_sala int NOT NULL UNIQUE,
foreign key (fk_n_sala) references sala (numero_sala)
);

create table funcionarios(
matricula varchar(15) UNIQUE NOT NULL PRIMARY KEY,
nome varchar(40) NOT NULL,
data_nascimento date NOT NULL,
data_admissao date NOT NULL,
cargo varchar(40) NOT NULL DEFAULT 'Assistente Médico',
salario float NOT NULL DEFAULT 510.00,
cod_ala int UNIQUE NOT NULL,
foreign key (cod_ala) references ala (codigo)
);

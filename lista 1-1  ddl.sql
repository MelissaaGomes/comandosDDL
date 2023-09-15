create database aula3;

-- exercicio 1
create table paises(
country_id varchar(2),
country_name varchar(40),
region_id decimal(10,0)
);

-- exercicio 2
-- vai criar a tabela se nao houver uma com o mesmo nome
create table if not exists paises(
country_id varchar(2),
country_name varchar(40),
region_id decimal(10,0)
);

-- exercicio 3
-- like vai fazer uma copia
create table if not exists dup_countries
like paises;

-- exercicio 5
create table if not exists countries(
country_id  varchar(2) NOT NULL,
country_name varchar(40) NOT NULL,
region_id decimal(10,0)
);

-- exercicio 6
create table jobs(
job_id varchar(10) NOT NULL,
job_title varchar(35) NOT NULL,
job_salary decimal(6,0),
max_salary decimal(6,0),
CHECK(max_salary <= 25000)
);

-- exercicio 7
create table paises_2(
country_id  varchar(2) NOT NULL,
country_name varchar(40) NOT NULL,
region_id decimal(10,0),
CHECK(country_name IN('Italy', 'India', 'China'))
);

-- exercicio 8
create table job_history(
employe_id decimal(6,0) NOT NULL,
start_date date NOT NULL,
end_date date NOT NULL
CHECK (end_date LIKE '--/--/----'),
job_id varchar(10) NOT NULL,
departament_id decimal(4,0) NOT NULL
);

-- exercicio 9
create table countries(
country_id  varchar(2) NOT NULL,
country_name varchar(40) NOT NULL,
region_id decimal(10,0),
UNIQUE(country_id)
);

-- exercicio 10
create table job(
job_id varchar(10) NOT NULL UNIQUE,
job_title varchar(35) NOT NULL DEFAULT,
max_salary decimal(6,0) DEFAULT NULL,
min_salary decimal(6,0) DEFAULT 8000
);

-- exercicio 11
create table pais_plural(
country_id  varchar(2) NOT NULL UNIQUE PRIMARY KEY,
country_name varchar(40) NOT NULL,
region_id decimal(10,0) NOT NULL
);

-- exercicio 12
create table paises_paises(
country_id varchar(2) NOT NULL UNIQUE DEFAULT '',
country_name varchar(40) NOT NULL,
region_id decimal(10,0) NOT NULL
);

-- exercicio 13
create table paises_paises(
country_id varchar(2) NOT NULL UNIQUE,
country_name varchar(40) NOT NULL,
region_id decimal(10,0) NOT NULL UNIQUE
);

-- exercicio 14
create table history_job(
employee_id decimal(6,0) NOT NULL UNIQUE,
start_date date NOT NULL,
end_date date NOT NULL,
fk_job_id varchar(10) NOT NULL UNIQUE,
department_id decimal(4,0) NOT NULL,
foreign key (fk_job_id) references job (job_id)
);

-- exercicio 15
create table departamentos(
manager_id int UNIQUE NOT NULL PRIMARY KEY,
department_id int UNIQUE NOT NULL PRIMARY KEY
);

create table funcionarios(
employee_id int UNIQUE, 
first_Name varchar(20) NOT NULL,
last_Name varchar(40) NOT NULL ,
email char(20) NOT NULL, 
phone_number char(10) NOT NULL,
hire_date date, 
job_id int NOT NULL UNIQUE, 
salary float NOT NULL, 
commission float NOT NULL,
fk_manager_id int UNIQUE NOT NULL,
fk_department_id int UNIQUE NOT NULL,
FOREIGN KEY (fk_manager_id) REFERENCES departamentos (manager_id),
FOREIGN KEY (fk_departament_id) REFERENCES departamentos (departament_id)
);

-- exercicio 16
create table funcionario(
employee_id int UNIQUE, 
first_Name varchar(20) NOT NULL,
last_Name varchar(40) NOT NULL ,
email char(20) NOT NULL, 
phone_number char(10) NOT NULL,
hire_date date, 
fk_job_id varchar(10) NOT NULL UNIQUE, 
salary float NOT NULL, 
commission float NOT NULL,
fk_manager_id int UNIQUE NOT NULL,
fk_department_id int UNIQUE NOT NULL,
FOREIGN KEY (fk_manager_id) REFERENCES departamentos (manager_id),
FOREIGN KEY (fk_departament_id) REFERENCES departamentos (departament_id),
FOREIGN KEY (fk_job_id) REFERENCES job (job_id)
);

-- Exercício 17 
create table funcio_narios(
employee_id int NOT NULL UNIQUE, 
first_name varchar(20) NOT NULL, 
last_name varchar(40) NOT NULL,
fk_job_id varchar(10) NOT NULL UNIQUE, 
salário float NOT NULL,
FOREIGN KEY (fk_job_id) REFERENCES job (job_id)
);

-- Exercício 18 
create table fun_cionarios(
employee_id int NOT NULL UNIQUE, 
first_name varchar(20) NOT NULL, 
last_name varchar(40) NOT NULL,
fk_job_id varchar(10) NOT NULL UNIQUE, 
salário float NOT NULL,
FOREIGN KEY (fk_job_id) REFERENCES job (job_id)
);

-- Exercício 19
create table employees(
employee_id int NOT NULL UNIQUE, 
first_name varchar(20) NOT NULL, 
last_name varchar(40) NOT NULL,
fk_job_id varchar(10) NOT NULL UNIQUE, 
salário float NOT NULL,
FOREIGN KEY (fk_job_id) REFERENCES job (job_id)
);

-- Exercício 20 
create table funcionaarios(
employee_id int NOT NULL UNIQUE, 
first_name varchar(40) NOT NULL, 
last_name varchar(10) NOT NULL UNIQUE,
fk_job_id varchar(10) NOT NULL UNIQUE,
FOREIGN KEY (fk_job_id) REFERENCES job (job_id)
);
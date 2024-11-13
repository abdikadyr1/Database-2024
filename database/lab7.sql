create database lab7;

--Creating tables

create table countries (
    country_id serial primary key,
    name varchar(50),
    population integer,
    continent varchar(50)
);

create table departments (
    department_id serial primary key,
    department_name varchar(100),
    budget integer
);

create table employees (
    employee_id serial primary key,
    name varchar(50),
    surname varchar(50),
    salary integer,
    department_id integer,
    country_id integer
);


insert into countries (name, population, continent) values
('Canada', 38000000, 'North America'),
('Australia', 25690000, 'Oceania'),
('Germany', 83100000, 'Europe'),
('Brazil', 212600000, 'South America'),
('Japan', 126300000, 'Asia');

insert into departments (department_name, budget) values
('HR', 150000),
('Engineering', 300000),
('Marketing', 200000),
('Sales', 250000),
('Finance', 180000);

insert into employees (name, surname, salary, department_id, country_id) values
('John', 'Doe', 55000, 1, 1),
('Jane', 'Smith', 60000, 2, 2),
('Alice', 'Johnson', 70000, 1, 3),
('Bob', 'Brown', 50000, 3, 4),
('Charlie', 'Green', 80000, 2, 5),
('David', 'Taylor', 90000, 4, 3),
('Emily', 'Clark', 75000, 5, 1),
('Frank', 'White', 85000, 2, 4),
('Grace', 'Hall', 65000, 3, 5);

--1
create index idx_countries_name on countries(name);

--2
create index idx_employees_name_surname ON employees(name, surname);

--3
create unique index idx_employees_salary_range ON employees(salary);

--4
create index idx_employees_name_substring ON employees((substring(name FROM 1 FOR 4)));

--5
create index idx_employees_department_id_salary ON employees(department_id, salary);
create index idx_departments_department_id_budget ON departments(department_id, budget);




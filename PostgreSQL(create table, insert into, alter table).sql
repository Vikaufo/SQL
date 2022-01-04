-- Создать таблицу employees
-- id. serial,  primary key,
-- employee_name. Varchar(50), not null
create table employees(
id serial primary key,
employee_name varchar(50) not null
);

-- Вывести таблицу employees
select * from employees;

--Наполнить таблицу employee 70 строками.
insert into employees(employee_name)
values('Jack'),
('Mark'),
('Shannon'),
('Patricia'),
('Gary'),
('Raymond'),
('David'),
('Erica'),
('Keith'),
('Paul'),
('Billie'),
('Donna'),
('Clifford'),
('Ronald'),
('Margie'),
('Joseph'),
('Sharon'),
('Janet'),
('Jeremy'),
('Steven'),
('Mary'),
('Chris'),
('Ella'),
('Joseph'),
('Mary'),
('Steven'),
('Gail'),
('James'),
('James'),
('Larry'),
('Loretta'),
('Monica'),
('James'),
('Betty'),
('Cindy'),
('Ralph'),
('George'),
('Russell'),
('Anthony'),
('Patricia'),
('Eugene'),
('Sara'),
('Vickie'),
('James'),
('Anthony'),
('Debra'),
('Adrian'),
('Vera'),
('Edith'),
('David'),
('Paul'),
('Renee'),
('Gary'),
('James'),
('Renee'),
('Stanley'),
('Lorraine'),
('Christina'),
('Kathlee'),
('Emma'),
('Anita'),
('Ronald'),
('Sarah'),
('Jeffrey'),
('David'),
('Daniel'),
('John'),
('Jerry'),
('Daniel'),
('William');

-- Создать таблицу salary
-- id. Serial  primary key,
-- monthly_salary. Int, not null
create table salary(
id serial primary key,
monthly_salary int not null
);

-- Вывести таблицу salary
select * from salary;

-- Наполнить таблицу salary 15 строками
insert into salary(monthly_salary)
values(1000),
(1100),
(1200),
(1300),
(1400),
(1500),
(1600),
(1700),
(1800),
(1900),
(2000),
(2100),
(2200),
(2300),
(2400),
(2500);

-- Создать таблицу employee_salary
-- id. Serial  primary key,
-- employee_id. Int, not null, unique
-- salary_id. Int, not null
create table employee_salary(
id serial primary key,
employee_id int not null unique,
salary_id int not null
);

-- Вывести таблицу employee_salary
select * from employee_salary;

-- Наполнить таблицу employee_salary 40 строками:
-- в 10 строк из 40 вставить несуществующие employee_id
insert into employee_salary(employee_id, salary_id)
values(1, 1),
(2, 3),
(3, 8),
(4, 2),
(5, 15),
(6, 4),
(7, 3),
(8, 13),
(9, 12),
(10, 4),
(11, 6),
(12, 4),
(13, 5),
(14, 11),
(15, 10),
(30, 2),
(31, 3),
(32, 1),
(33, 9),
(34, 1),
(35, 13),
(36, 10),
(37, 3),
(38, 6),
(39, 10),
(40, 11),
(41, 12),
(42, 8),
(43, 7),
(44, 10),
(98, 1),
(99, 7),
(100, 5),
(174, 15),
(175, 14),
(176, 13),
(177, 8),
(178, 4),
(179, 5),
(180, 9);

-- Создать таблицу roles
-- id. Serial  primary key,
-- role_name. int, not null, unique
create table roles(
id serial primary key,
role_name int not null unique
);

-- Вывести таблицу roles
select * from roles;

-- Поменять тип столба role_name с int на varchar(30)
alter table roles 
alter column role_name type varchar(30) using role_name::varchar(30);
-- Или проще
-- alter table roles
-- alter column role_name type varchar(30);

-- Наполнить таблицу roles 20 строками
insert into roles(role_name)
values('Junior_Python_developer'),
('Middle_Python_developer'),
('Senior_Python_developer'),
('Junior_Java_developer'),
('Middle_Java_developer'),
('Senior_Java_developer'),
('Junior_JavaScript_developer'),
('Middle_JavaScript_developer'),
('Senior_JavaScript_developer'),
('Junior_Manual_QA_engineer'),
('Middle_Manual_QA_engineer'),
('Senior_Manual_QA_engineer'),
('Project_Manager'),
('Designer'),
('HR'),
('CEO'),
('Sales_manager'),
('Junior_Automation_QA_engineer'),
('Middle_Automation_QA_engineer'),
('Senior_Automation_QA_engineer');

-- Cоздание связующей таблицы (реляция)
-- Создать таблицу roles_employee
-- id. Serial  primary key,
-- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
-- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
create table roles_employee(
id serial primary key,
employee_id int not null unique,
role_id int not null,
foreign key (employee_id)
		references employees(id),
foreign key (role_id)
		references roles (id)
);

-- Вывести таблицу roles_employee
select * from roles_employee;

-- Наполнить таблицу roles_employee 40 строками
insert into roles_employee(employee_id, role_id)
values(2, 1),
(32, 3),
(33, 5),
(34, 6),
(35, 2),
(42, 7),
(43, 8),
(44, 9),
(45, 20),
(52, 11),
(53, 13),
(54, 12),
(55, 14),
(62, 15),
(63, 1),
(64, 19),
(65, 4),
(66, 4),
(67, 7),
(68, 8),
(69, 9),
(70, 10),
(20, 4),
(21, 1),
(22, 2),
(23, 12),
(24, 17),
(25, 4),
(26, 8),
(27, 11),
(28, 2),
(29, 18),
(30, 1),
(31, 2),
(40, 15),
(41, 11),
(1, 12),
(3, 5),
(6, 16),
(7, 7);

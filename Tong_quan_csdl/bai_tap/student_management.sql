create database if not exists student_management;
use student_management;

create table class(
id int primary key,
name varchar(200)
);

create table teacher(
id int primary key,
name varchar(200),
age int,
country varchar(200)
);

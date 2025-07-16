create database if not exists Product_management;
use Product_management;

create table customer (
cID int primary key,
cName varchar (100),
cAge int
);

create table orders(
oID int primary key auto_increment,
oDate date,
oTotalPrice double,
c_id int,
foreign key(c_id) references customer(cID)
);

create table product (
pID int primary key,
pName varchar (100),
pPrice double
);

create table orderdetail(
 o_id int,
 p_id int,
 odQTY int,
 primary key (o_id,p_id),
 foreign key(o_id) references orders(oID),
 foreign key(p_id) references product(pID)
);
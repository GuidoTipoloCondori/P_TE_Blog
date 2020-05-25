create database db_blog;
use db_blog;

create table usuarios(id int(50) primary key auto_increment not null, usuario varchar(100), password varchar(100));
create table vp_blog(id_vpb int(50) primary key auto_increment not null, fecha date, titulo varchar(300),contenido varchar(1000));

insert into usuarios(usuario,password)values('admi','123');

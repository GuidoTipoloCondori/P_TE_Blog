create database db_blog;
use db_blog;

create table usuarios(id int(50) primary key auto_increment not null, usuario varchar(100), password varchar(100));
create table vp_blog(id_vpb int(50) primary key auto_increment not null, fecha date, titulo varchar(300),contenido varchar(1000));

insert into usuarios(usuario,password)values('admi','123');

![1](https://user-images.githubusercontent.com/65792212/82779709-3497e500-9e55-11ea-808a-cdc712e35d7e.jpg)
![2](https://user-images.githubusercontent.com/65792212/82779719-3d88b680-9e55-11ea-9080-cb39381f0c37.jpg)
![3](https://user-images.githubusercontent.com/65792212/82779728-41b4d400-9e55-11ea-9a36-f6e4b0ff5b55.jpg)

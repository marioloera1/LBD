create database SENDA_PROYECTO

Use SENDA_PROYECTO

create table Pais(
IdPais int not null identity primary key,
NombrePais varchar (50) not null,
)

create table Estado (
IdEstado int not null identity primary key,
NombreEstado varchar (50) not null, 
IdPais int not null  foreign key references Pais(IdPais) on delete cascade 
)

create table Municipio(
	IdMunicipio int not null identity primary key,
	IdEstado int not null foreign key references Estado(IdEstado) on delete cascade,
	NomMunicipio varchar(50)
)

create table Cliente (
IdCliente int not null identity primary key,
NombreCli varchar (50) not null,
ApellidosCli varchar (50) not null,
Sexo varchar (50) not null, 
Telefono int not null, 
Correo varchar (50) not null,
IdMunicipio int not null foreign key references Municipio(IdMunicipio) on delete cascade 
)

create table Sucursal(
	IdSucursal int not null identity primary key,
	IdMunicipio int not null foreign key references Municipio(IdMunicipio) on delete cascade,
	NomSucursal varchar(50),
)

create table Vendedor (
IdVendedor int not null identity primary key, 
NombreVendedor varchar (50) not null,
NumeroSeguro int not null,
IdSucursal int not null foreign key references Sucursal(IdSucursal) on delete cascade,
)

create table Venta (
IdVenta int not null identity primary key,
IdVendedor int not null  foreign key references Vendedor(IdVendedor),
IdCliente int not null foreign key references Cliente(IdCliente) on delete cascade,
EstadoVenta varchar (50) not null ,
CantidadBoletos int not null, 
PrecioTotal int not null,
)


create table Ruta(
IdRuta int not null identity primary key, 
IdRutaOrigen int not null foreign key references Municipio(IdMunicipio) ,
IdRutaDestino int not null foreign key references Municipio(IdMunicipio) on delete cascade
)

create table Boleto(
IdBoleto int not null identity primary key, 
IdCliente int not null foreign key references Cliente(IdCliente) on delete cascade , 
NombrePasajero varchar(50),
NumeroAsientos int not null,
PrecioBoleto int not null,
IdRuta int not null foreign key references Ruta(IdRuta)
)

create table Chofer(
	IdChofer int not null identity primary key,
	NomChofi varchar(50),
	ApeChofi varchar(50)
)

create table Camion(
	IdCamion int not null identity primary key,
	IdChofer int not null foreign key references Chofer(IdChofer) on delete cascade,
	Modelo varchar(50),
	Placas varchar(50),
	EstadoCamion varchar(1),
	NumAsientos int not null,
	Clase varchar(50),
)


create table SucursalCamion(
	IdSucursalCamion int not null identity primary key,
	IdCamion int not null foreign key references Camion(IdCamion) on delete cascade,
	IdSucursal int not null foreign key references Sucursal(IdSucursal) on delete cascade,
)


insert into Chofer values
(
	'Juan', 'Gonzalez'
)

insert into Chofer values
(
	'Luis', 'Guitoerrez'
)

insert into Chofer values
(
	'Erich', 'Ramoz'
)

insert into Chofer values
(
	'Manuel', 'Garcia'
)

insert into Chofer values
(
	'Juventino', 'Santiago'
)

insert into Chofer values
(
	'Alberto', 'Aphac'
)

insert into Chofer values
(
	'Juan', 'Mendez'
)

insert into Camion values
(
	6, 'M100', 'SND01', 'A', 56, 'VIP'
)

insert into Camion values
(
	5, 'M200', 'SND02', 'A', 56, 'Mixta'
)

insert into Camion values
(
	4, 'M300', 'SND03', 'A', 56, 'Economico'
)

insert into Camion values
(
	3, 'M400', 'SND04', 'A', 56, 'VIP'
)

insert into Camion values
(
	2, 'M500', 'SND05', 'A', 56, 'Mixta'
)

insert into Camion values
(
	1, 'M600', 'SND06', 'A', 56, 'Economico'
)

insert into Camion values
(
	2, 'M600', 'SND06', 'A', 56, 'Economico'
)

insert into Camion values
(
	7, 'M700', 'SND07', 'A', 56, 'Economico'
)

insert into Pais values
(
	'Mexico'
)

insert into Pais values
(
	'EUA'
)

insert into Estado values
(
	'Nuevo leon', 1
)

insert into Estado values
(
	'Tamaulipas', 1
)

insert into Estado values
(
	'Chihuahua', 1
)

insert into Estado values
(
	'California', 2
)

insert into Estado values
(
	'Texas', 2
)

insert into Municipio values
(
	1, 'Monterrey'
)

insert into Municipio values
(
	1, 'Tampico'
)

insert into Municipio values
(
	1, 'Piedras Negras'
)

insert into Municipio values
(
	4, 'Los Angeles'
)

insert into Municipio values
(
	5, 'Houston'
)


insert into Sucursal values
(
	1, 'Monterrey Norte'
)

insert into Sucursal values
(
	2, 'Tampico Sur'
)

insert into Sucursal values
(
	4, 'Piedras Negras'
)

insert into SucursalCamion values
(
	1, 4
)

insert into SucursalCamion values
(
	2, 4
)

insert into SucursalCamion values
(
	3, 5
)

insert into SucursalCamion values
(
	4, 5
)

insert into SucursalCamion values
(
	5, 7
)

insert into SucursalCamion values
(
	6, 7
)

insert into SucursalCamion values
(
	7, 7
)

insert into SucursalCamion values
(
	8, 5
)

insert into Cliente values
(
	'Mario', 'Loera', 'M', 123456,'mario@gmail.com', 1
)

insert into Cliente values
(
	'Raul', 'Herrera', 'M', 234567,'raul@gmail.com', 1
)

insert into Cliente values
(
	'Laura', 'Paredes', 'F', 456778,'laura@gmail.com', 1
)

insert into Cliente values
(
	'Jean', 'Rodriguez', 'M', 456456,'jean@gmail.com', 2
)

insert into Cliente values
(
	'Isis', 'Flores', 'F', 783456,'isis@gmail.com', 4
)

insert into Vendedor values
(
	'Diego Contreras', 333333, 4
)

insert into Vendedor values
(
	'Alejandra Charles', 444444, 4
)

insert into Vendedor values
(
	'Alexis Lopes', 555555, 5
)

insert into Vendedor values
(
	'Adrian Villarreal', 666666, 5
)

insert into Vendedor values
(
	'Carlos Ramirez', 7777777, 7
)

insert into Vendedor values
(
	'Daniela Sanchez', 756556, 7
)

insert into Ruta values
(
	1,2
)

insert into Ruta values
(
	1,4
)

insert into Ruta values
(
	2,1
)

insert into Ruta values
(
	2,4
)

insert into Ruta values
(
	4,1
)

insert into Ruta values
(
	4,2
)

insert into Boleto values
(
	1, 'Mario Loera', 11, 300, 1
)

insert into Boleto values
(
	1, 'Carolina Gomez', 12, 300, 1
)

insert into Boleto values
(
	2, 'Raul Herrera', 22, 350, 2
)

insert into Boleto values
(
	2, 'Karime Huerta', 22, 350, 2
)

insert into Boleto values
(
	3, 'Isis Florea', 54, 450, 6
)

insert into Boleto values
(
	4, 'Jean Rodriguez', 23, 300, 4
)

insert into Boleto values
(
	4, 'Janeth Pacheco', 24, 300, 4
)

insert into Boleto values
(
	4, 'Alan Nic', 25, 300, 4
)

insert into Boleto values
(
	5, 'Isis Florea', 37, 450, 6
)

insert into Venta values
(
	1, 1, 'A', 2, 600
)

insert into Venta values
(
	2, 2, 'A', 2, 700
)

insert into Venta values
(
	5, 3, 'A', 1, 450
)

insert into Venta values
(
	3, 4, 'A', 3, 900
)

insert into VEnta values
(
	5, 5, 'A', 1, 450
)


delete from Municipio
where IdMunicipio=3

delete from Sucursal
where IdMunicipio=1

delete from Boleto
where IdBoleto=10

delete from Cliente
where NombreCli='Jean'

delete from Pais
where NombrePais='EUA'

delete from Vendedor
where IdVendedor=4

delete from Chofer
where IdChofer=7

delete from Camion
where IdCamion=7

update Boleto 
set NombrePasajero='Laura Paredes'
where IdCliente=3

update Cliente 
set Telefono=67895845, Correo='rherrera@gmail.com'
where IdCliente=2

update Chofer
set NomChofi='Alberto', ApeChofi='Ramos'
where IdChofer=3

update Sucursal
set NomSucursal='Central Cuahutemoc'
where IdSucursal=4

update Vendedor
set NumeroSeguro=787843
where IdVendedor=5

update Camion
set Modelo='M900', Clase= 'Basica'
where IdCamion=3

update Camion
set Clase= 'Basica'
where IdCamion=6

update Municipio
set NomMunicipio='Tampico-Madero'
where IdMunicipio=2

update Pais
set NombrePais='Estados Unidos Mexicanos'
where IdPais=1

select * from Chofer
select * from Pais
select * from Estado
select * from Municipio
select * from Camion
select * from SucursalCamion
select * from Cliente
select * from Ruta
select * from Venta
select * from Boleto
select * from Vendedor
select * from Sucursal

select IdCliente, max(IdCliente) as cantidad_IdCliente from Cliente group by IdCliente
select IdChofer , max(IdChofer) as cantidad_IdChofer from Chofer group by IdChofer
select Max(IdCliente) as max_cliente from Cliente 
select Min(IdChofer) as min_chofer from Chofer
select SUM(PrecioTotal) as Total_Ventas from Venta 
select * from Cliente where NombreCli = 'Mario'
select * from Camion where Clase = 'VIP' 
select * from Cliente where sexo = 'F'
select sum(PrecioTotal) as Total from Venta having sum (PrecioTotal) >2100
select max(PrecioBoleto) as Boleto from Boleto having max (PrecioBoleto) >300

select top 4 * from Cliente
select top 3 * from Vendedor
select top 2 *from Sucursal 

Create view VistaClienteSENDA as
select C.NombreCli, C.Correo, C.Telefono
from Cliente C 
join Boleto as B on C.Idcliente = B.IdCliente
select *from VistaClienteSENDA

Create view VistaChoferSENDA as
select Ch.NomChofi, Ch.ApeChofi 
from Chofer Ch 
join Camion as Ca on Ca.IdChofer = Ch.IdChofer
select *from VistaChoferSENDA

Create view VistaVentaSENDA as
select V.NombreVendedor, V.IdSucursal, V.IdVendedor
from Vendedor V
join Venta as VE  on V.IdVendedor = VE.IdVendedor 
select *from VistaVentaSENDA

Create view VistaLugarSenda as
select P.NombrePais
from Pais P
join Estado E ON P.IdPais = E.IdPais 
select *from VistaLugarSenda

create view VistaBoletoSenda as
select Bo.NombrePasajero, Bo.PrecioBoleto, Bo.IdRuta
from Boleto Bo
join Cliente Cli on Cli.IdCliente=Bo.IdCliente
select * from VistaBoletoSenda

Create View VistaSucursalSenda as
select SC.IdCamion, SC.IdSucursalCamion
from SucursalCamion SC
join Sucursal S on SC.IdSucursal = S.IdSucursal 
select *from VistaSucursalSenda 

create procedure Proceso1
as begin 
select C.NombreCli, C.Correo, C.Telefono
from Cliente C 
join Boleto as B on C.Idcliente = B.IdCliente
end 
exec Proceso1

create procedure Proceso2
as begin 
select Ch.NomChofi, Ch.ApeChofi 
from Chofer Ch 
join Camion as Ca on Ca.IdChofer=Ch.IdChofer
end 
exec Proceso2 

create procedure Proceso3
as begin 
select V.NombreVendedor, V.IdSucursal, V.IdVendedor
from Vendedor V
join Venta as VE  on V.IdVendedor = VE.IdVendedor
end 
exec Proceso3

create procedure Proceso4
as begin 
select P.NombrePais
from Pais P
join Estado E ON P.IdPais = E.IdPais
end 
exec Proceso4

create procedure Proceso5
as begin
select Bo.NombrePasajero, Bo.PrecioBoleto, Bo.IdRuta
from Boleto Bo
join Cliente Cli on Cli.IdCliente=Bo.IdCliente
end
exec Proceso5

create procedure Proceso6
as begin 
select SC.IdCamion, SC.IdSucursalCamion
from SucursalCamion SC
join Sucursal S on SC.IdSucursal = S.IdSucursal
end 
exec Proceso6

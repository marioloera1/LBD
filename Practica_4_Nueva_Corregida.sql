use Practica_Senda

insert into Sucursal values
(	
	'Monterrey Centro'
)

insert into Sucursal values
(	
	'Saltillo Norte'
)

insert into Sucursal values
(	
	'Tampico Sur'
)

insert into Sucursal values
(	
	'Guaymas Oeste'
)

insert into Sucursal values
(	
	'Mexicali Este'
)

insert into Vendedor values
(
	'Mario', '1234', 1
)

insert into Vendedor values
(
	'Raul', '2345', 3
)

insert into Vendedor values
(
	'Salvador', '3456', 4
)

insert into Vendedor values
(
	'Alexis', '4567', 5
)

insert into Vendedor values
(
	'Adrian', '5678', 6
)

insert into Chofer values
(
	'Christopher', 'Aviles', 'S'
)

insert into Chofer values
(
	'Diego', 'Contreras', 'S'
)

insert into Chofer values
(
	'Jean', 'Ramirez', 'A'
)

insert into Chofer values
(
	'Mario', 'Ayala', 'A'
)

insert into Chofer values
(
	'Adrian', 'Loreto', 'B'
)

insert into Chofer values
(
	'Christopher', 'Aviles', 'S'
)

insert into Cliente values
(
	'Laura', 'Paredes', 'F'
)

insert into Cliente values
(
	'Isis', 'Flores', 'F'
)

insert into Cliente values
(
	'Carolina', 'Gomez', 'F'
)

insert into Cliente values
(
	'Zeus', 'Vera', 'M'
)

insert into Cliente values
(
	'Janeth', 'Pacheco', 'F'
)

insert into Camion values
(
	'M100', 'A', 'VIP', 1, 56
)

insert into Camion values
(
	'M200', 'A', 'VIP', 2, 56
)

insert into Camion values
(
	'M300', 'A', 'Economico', 3, 56
)

insert into Camion values
(
	'M400', 'A', 'Economico', 4, 56
)

insert into Camion values
(
	'M500', 'A', 'VIP', 5, 56
)

insert into Boleto values
(
	1, 1,  '01-05-2017', 12, 150, 'Monterrey', 'Saltillo', 'Laura' 
)

insert into Boleto values
(
	1, 1,  '01-05-2017', 13, 150, 'Monterrey', 'Saltillo', 'Kevin' 
)

insert into Boleto values
(
	2, 2,  '01-06-2017', 22, 100, 'Monterrey', 'Tampico', 'Isis' 
)

insert into Boleto values
(
	5, 3, '02-14-2018', 22, 200, 'Monterrey', 'Mexicali', 'Carolina' 
)

insert into Boleto values
(
	5, 3, '02-14-2017', 21, 200, 'Monterrey', 'Mexicali', 'Mario' 
)

insert into Boleto values
(
	3, 4,  '04-22-2018', 34, 150, 'Monterrey', 'Guaymas', 'Zeus' 
)

insert into Boleto values
(
	4, 5,  '04-22-2018', 46, 250, 'Monterrey', 'Mexicali', 'Janeth' 
)

insert into Boleto values
(
	4, 5,  '04-22-2018', 47, 250, 'Monterrey', 'Mexicali', 'Jean' 
)

insert into Venta values
(
	1, 1, 1, 2, 300
)

insert into Venta values
(
	1, 4, 1, 1, 100
)

insert into Venta values
(
	3, 5, 1, 2, 400
)

insert into Venta values
(
	4, 6, 1, 1, 150
)

insert into Venta values
(
	5, 7, 1, 2, 500
)

update Cliente
set Nombre='Alondra'
where IdCliente=3

update Chofer
set ApellidoChofer='Gonzalez',
Licencia='S'
where IdChofer=3

update Boleto
set Precio=150,
Destino='Guaymas'
where IdBoleto=1

update Boleto
set Precio=150,
Destino='Guaymas'
where IdBoleto=2

update Vendedor
set NumeroSeguro=7890
where IdVendedor=7

delete from Boleto
where IdBoleto=2

delete from Boleto
where IdBoleto=8

select * from Cliente
select * from Chofer
select * from Boleto
select * from Vendedor
select * from Sucursal
select * from Camion

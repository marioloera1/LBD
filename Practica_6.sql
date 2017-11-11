use Practica_Senda

create view ListaCliente as
select cl.Nombre as Nombres, cl.Apellidos as Apellido
from Cliente cl
join Boleto bo on bo.IdCliente = cl.IdCliente
select * from ListaCliente

create view ListaChofer as
select ch.NombreChofer as NombreChofer, ch.ApellidoChofer as ApellidoChofer
from Chofer ch
join Camion ca on ca.IdChofer = ch.IdChofer
select * from ListaChofer

create view ListaSucursal as
select su.NomSucursal as NomSucursal
from Sucursal su
join Vendedor ve on ve.IdSucursal = su.IdSucursal
select * from ListaSucursal

create view ListaVendedor as
select ve.NombreVendedor as NombreVendedor, ve.IdSucursal as IdSucursal
from Vendedor ve
join Venta ven on ven.IdVendedor = ve.IdVendedor
select * from ListaVendedor

create view ClienteVenta as
select vnt.IdCliente as IdCliente, vnt.CantBoleto as CantBoleto, vnt.PrecioTotal as PrecioTotal
from Venta vnt
join Cliente clnt on clnt.IdCliente = vnt.IdCliente
select * from ClienteVenta


select * from Cliente
select * from Camion
select * from Chofer
select * from Sucursal
select * from Boleto
select * from Venta
select * from Vendedor
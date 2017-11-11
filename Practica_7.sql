use Practica_Senda

create procedure PCliente
as begin 
select cl.Nombre as Nombres, cl.Apellidos as Apellido
from Cliente cl
join Boleto bo on bo.IdCliente = cl.IdCliente
end
exec PCliente

create procedure PChofer 
as begin
select ch.NombreChofer as NombreChofer, ch.ApellidoChofer as ApellidoChofer
from Chofer ch
join Camion ca on ca.IdChofer = ch.IdChofer
end
exec PChofer

create procedure PSucursal 
as begin
select su.NomSucursal as NomSucursal
from Sucursal su
join Vendedor ve on ve.IdSucursal = su.IdSucursal
end
exec PSucursal

create procedure PVendedor
as begin
select ve.NombreVendedor as NombreVendedor, ve.IdSucursal as IdSucursal
from Vendedor ve
join Venta ven on ven.IdVendedor = ve.IdVendedor
end
exec PVendedor

create procedure PClienteVenta 
as begin
select vnt.IdCliente as IdCliente, vnt.CantBoleto as CantBoleto, vnt.PrecioTotal as PrecioTotal
from Venta vnt
join Cliente clnt on clnt.IdCliente = vnt.IdCliente
end
exec PClienteVenta
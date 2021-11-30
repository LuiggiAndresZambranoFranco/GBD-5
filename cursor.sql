/*Un cursor que muestre cuantos niños o adultos entraron a tratamientos en determinado año.*/
do $$
declare 
historial record;
historial_cur cursor for 
select extract(year from fecha_servicio) año,nombre_cliente,edad_cliente,descripcion_tratamiento from cliente
inner join servicio on servicio.id_cliente=cliente.id_cliente
inner join tratamientos on servicio.id_tratamiento=tratamientos.id_tratamiento
order by  extract(year from fecha_servicio),edad_cliente desc;
begin
open historial_cur ;
fetch historial_cur into historial ;
while (found)loop raise notice '
AÑO: % |NOMBRE_CLIENTE: %|EDAD_CLIENTE: %|DESCRIPCION_CLIENTE: %',
historial.año,
historial.nombre_cliente,historial.edad_cliente ,historial.descripcion_tratamiento;
fetch historial_cur into historial ;
end loop;
end $$
language plpgsql;

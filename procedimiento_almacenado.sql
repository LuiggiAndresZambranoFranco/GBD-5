create or replace function ingresar(nombres char)
returns table (nombre_medico character varying, nombre_cliente character varying,apellido_cliente character varying )
as
$$
select nombre_medico,nombre_cliente,apellido_cliente from cliente
inner join medico on cliente.id_cliente=medico.id_cliente
where nombre_medico = $1
group by nombre_medico, nombre_cliente, apellido_cliente ;
$$
language SQL;

select ingresar ('ABDO FRANCIS JUAN MIGUEL')

select extract(year from fecha_servicio) año_atendido,nombre_medico,edad_cliente,descripcion_tratamiento from cliente
inner join servicio on servicio.id_cliente=cliente.id_cliente
inner join tratamientos on servicio.id_tratamiento=tratamientos.id_tratamiento
inner join medico on cliente.id_cliente=medico.id_cliente

--Consultar los tipos de terapias que solicitan con más frecuencia.
select descripcion_tratamiento, sum(cantidad_tratamiento) from tratamientos
group by descripcion_tratamiento order by sum(cantidad_tratamiento) desc;

--Cantidad de personas que llegan en el trascurso del mes.
select cantidad_tratamiento as personas, extract(month from fecha_servicio)as mes from tratamientos
inner join servicio on servicio.id_tratamiento=tratamientos.id_tratamiento;

select nombre_cliente, apellido_cliente, edad_cliente, patologias_a from cliente
inner join antecedentes on antecedentes.id_cliente=cliente.id_cliente 


--Consultar los tipos de terapias que solicitan con más frecuencia.
select descripcion_tratamiento, sum(cantidad_tratamiento) from tratamientos
group by descripcion_tratamiento order by sum(cantidad_tratamiento) desc
--Cantidad de personas que llegan en el trascurso del mes.
select cantidad_tratamiento as personas, extract(month from fecha_servicio)as mes from tratamientos
inner join servicio on servicio.id_tratamiento=tratamientos.id_tratamiento;

/*Un listado de personas que cuenten con antecedentes mas comunes, en una de las columnas debe aparecer los 
nombres, en la otra columna apellidos, en la otra la edad y por último debe aparecer los antecedentes mas 
comunes en las personas.*/
select nombre_cliente, apellido_cliente, edad_cliente, patologias_a from cliente
inner join antecedentes on antecedentes.id_cliente=cliente.id_cliente 
 --Mostrar un histórico de inasistencia del personal médico.
select fecha_inasistencia as año,nombre_medico,motivo_inasistencia from medico
inner join registro_asistencia on registro_asistencia.id_medico=medico.id_medico;
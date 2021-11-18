/*==============================================================*/
/* Table: TRATAMIENTOS                                          */
/*==============================================================*/
create or replace table TRATAMIENTOS 
(
   ID_TRATAMIENTO       integer                        not null,
   DESCRIPCION_TRATAMIENTO varchar(100)                   not null,
   CANTIDAD_TRATAMIENTO integer                        not null,
   constraint PK_TRATAMIENTOS primary key clustered (ID_TRATAMIENTO)
);

/*==============================================================*/
/* Tabla: Cliente                                               */
/*==============================================================*/
insert into cliente values (1,'Luiggi Andres',22,'Portoviejo','0991991818','zluiggi@gmail.com','Zambrano Franco');
insert into cliente values (2,'Kelly Larissa',32,'Manta','09651651320','zkelly@gmail.com','Zambrano Zambrano');
insert into cliente values (3,'Maria Rosa',18,'Jaramijo','0945616431','smaria@gmail.com','Santana Franco');
insert into cliente values (4,'Cristobal Anibal',13,'Portoviejo','0941651665','zcristobal@gmail.com','Zambrano Alava');
insert into cliente values (5,'Valeria Magdalena',21,'Manta','0984612345','vvaleria@gmail.com','Vergara Alava');
/*==============================================================*/
/* Tabla: antecedentes                                          */
/*==============================================================*/
insert into antecedentes values (1,1,'No presenta enfermedades patologicas','Gripe');
insert into antecedentes values (2,2,'Presenta diabetes','Tos');
insert into antecedentes values (3,3,'El pasiente presenta asma  ','Tos');
insert into antecedentes values (4,4,'No presenta enfermedades patologicas','ninguna');
insert into antecedentes values (5,5,'No presenta enfermedades patologicas','Ninguna');
/*==============================================================*/
/* Tabla: Tratamientos                                          */
/*==============================================================*/
insert into tratamientos values (1,'aparatos de asistencia con herramientas o dispositivos de ayuda',5);
insert into tratamientos values (2,'terapia cognitiva para aprender nuevamente o mejorar habilidades',6);
insert into tratamientos values (3,'terapia fisica para ayudar con su fuerza',2);
insert into tratamientos values (4,'terapia recreacional para mejorar el bienestar',1);
insert into tratamientos values (5,'rehabilitacion vocacional para ayuda a conseguir vocacion en estudio o trabajo',5);
insert into tratamientos values (6,'terapia cognitiva para aprender nuevamente o mejorar habilidades',4);
/*==============================================================*/
/* Tabla: Cargo                                                 */
/*==============================================================*/
insert into cargo values (1,'Administrador');
insert into cargo values (2,'Empleador')
/*==============================================================*/
/* Tabla: Institucion                                           */
/*==============================================================*/
insert into institucion values (1,'Universidad UTM','Portoviejo-Manabí','0984156166','secretariaposgrado@utm.edu.ec');
insert into institucion values (2,'Universidad ULEAM','Manta-Manabí','0941651648','secretariaposgrado@live.uleam.edu.ec');
insert into institucion values (3,'Universidad PUCEM','Chone-Manabí','0984651648','secretariaposgrado@pucesm.edu.ec');
/*==============================================================*/
/* Tabla: Sueldo                                                */
/*==============================================================*/
insert into sueldo values (1,'01:00', 80.00, 780.00);
insert into sueldo values (2,'02:00', 110.00, 810.00);
insert into sueldo values (3,'03:00', 150.00, 850.00);
/*==============================================================*/
/* Tabla: servicio                                              */
/*==============================================================*/
insert into servicio values (1,1,5,'2021-12-14');
insert into servicio values (2,5,5,'2021-06-14');
insert into servicio values (3,4,4,'2021-12-12');
insert into servicio values (4,3,2,'2021-04-19');
insert into servicio values (5,2,1,'2021-08-12');
/*==============================================================*/
/* Tabla: Medico                                                */
/*==============================================================*/
insert into medico values (1,1,1,3,'ABDO FRANCIS JUAN MIGUEL', 'Portoviejo','0948655689','1989-04-12');
insert into medico values (2,2,2,1,'ABREU HERNÁNDEZ LUIS FELIPE', 'Manta','0948655689','1995-11-12');
insert into medico values (4,2,5,1,'ACOSTA TORRES LAURA SUSANA', 'Jipijapa','0948655689','1985-08-12');
insert into medico values (5,2,4,2,'AGUAYO GONZÁLEZ ÁLVARO', 'Portoviejo','0948655689','1989-12-15');
insert into medico values (6,2,3,2,'ALVARADO CABRERO MARÍA ISABEL', 'Manta','0948655689','1993-01-05');
/*==============================================================*/
/* Tabla: registro_asistencia                                   */
/*==============================================================*/
insert into registro_asistencia values (1,1,'2021-01-15','2021-01-17','Calamidad domestica');
insert into registro_asistencia values (2,2,'2021-02-15','2021-01-17','Enfermedad');
insert into registro_asistencia values (3,1,'2021-01-16','2021-02-13','Permiso de vacaciones');
insert into registro_asistencia values (4,3,'2021-01-21','2021-03-12','Muerte de un familiar');
insert into registro_asistencia values (5,4,'2021-01-16','2021-01-30','Cita medica');
insert into registro_asistencia values (6,4,'2021-01-15','2021-04-16','Mal clima');
insert into registro_asistencia values (7,5,'2021-02-27','2021-03-17','Vacaciones');
/*==============================================================*/
/* Tabla: material                                              */
/*==============================================================*/
insert into material values (1,1,'maquina de estimulacion electrica');
insert into material values (2,1,'Mancuernas y pesas para muñeca');
insert into material values (3,2,'maquina de estimulacion electrica');
insert into material values (4,2,'bicibleta');
insert into material values (5,2,'Caja de espejos');
insert into material values (6,3,'maquina de estimulacion electrica');
insert into material values (7,4,'MusicGlove Hand Therapy');
insert into material values (8,4,'Pelotas para ejercitar las manos');
insert into material values (9,4,'Pelotas de balance');
insert into material values (10,5,'Masilla terapéutica');
insert into material values (11,1,'Tablas de equilibrio');
insert into material values (12,5,'herramienta interactiva FitM');
insert into material values (13,3,'MusicGlove Hand Therapy');
/*==============================================================*/
/* Tabla: estado_material                                       */
/*==============================================================*/
insert into estado_material values (1,1,'nuevo');
insert into estado_material values (2,2,'se encuentran gastadas');
insert into estado_material values (3,1,'nuevo');
insert into estado_material values (4,4,'pedal con grieta');
insert into estado_material values (5,5,'en perfecto estado');
insert into estado_material values (6,1,'nuevo');
insert into estado_material values (7,7,'un cable flojo');
insert into estado_material values (8,8,'desgastadas y con grietas');
insert into estado_material values (9,9,'en perfecto estado ');
insert into estado_material values (10,10,'nueva');
insert into estado_material values (11,11,'perfecto estado');
insert into estado_material values (12,12,'pocas pilas ');
insert into estado_material values (13,7,'con un cable flojo ');
/*==============================================================*/
/* Tabla: Cursos                                                */
/*==============================================================*/
insert into cursos values (1,5,1,'Fisioterapia deportiva','2017-08-10','2018-08-10','12 meses','1');
insert into cursos values (2,1,1,'Fisioterapia neurológica','2017-05-20','2018-05-24','12 meses','2');
insert into cursos values (3,5,2,'Fisioterapia en salud ocupacional y del trabajo','2019-02-24','2021-09-26','18 meses','1');
insert into cursos values (4,2,3,'Fisioterapia torácica','2019-01-07','2021-11-16','32 meses','6');
insert into cursos values (5,1,1,'Fisioterapia respiratoria','2018-08-10','2019-04-07','8 meses','1');
insert into cursos values (6,4,2,'Fisioterapia lenguaje','2013-08-10','2018-08-10','60 meses','8');
insert into cursos values (7,3,1,'Fisioterapia ortopédica','2016-08-10','2017-08-10','12 meses','3');
insert into cursos values (8,1,3,'Fisioterapia neurológica','2019-04-10','2019-08-10','4 meses','1');
insert into cursos values (9,2,1,'Fisioterapia ortopédica','2016-08-10','2018-08-10','24 meses','4');
insert into cursos values (10,3,2,'Fisioterapia lenguaje','2019-07-10','2019-12-30','5 meses','1');


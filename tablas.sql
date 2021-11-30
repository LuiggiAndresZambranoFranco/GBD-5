/*==============================================================*/
/* Table: ANTECEDENTES                                          */
/*==============================================================*/
create or replace table ANTECEDENTES 
(
   ID_ANTECEDENTES      integer                        not null,
   ID_CLIENTE           integer                        null,
   PATOLOGIAS_A         varchar(100)                   not null,
   ENFERMEDADES_ACTUALES varchar(100)                   not null,
   constraint PK_ANTECEDENTES primary key clustered (ID_ANTECEDENTES)
);

/*==============================================================*/
/* Index: ANTECEDENTES_PK                                       */
/*==============================================================*/
create unique clustered index ANTECEDENTES_PK on ANTECEDENTES (
ID_ANTECEDENTES ASC
);

/*==============================================================*/
/* Index: CLIENTE_ANTECEDENTES_FK                               */
/*==============================================================*/
create index CLIENTE_ANTECEDENTES_FK on ANTECEDENTES (
ID_CLIENTE ASC
);

/*==============================================================*/
/* Table: CARGO                                                 */
/*==============================================================*/
create or replace table CARGO 
(
   ID_CARGO             integer                        not null,
   DESCRIPCION_CARGO    varchar(100)                   not null,
   constraint PK_CARGO primary key clustered (ID_CARGO)
);

/*==============================================================*/
/* Index: CARGO_PK                                              */
/*==============================================================*/
create unique clustered index CARGO_PK on CARGO (
ID_CARGO ASC
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create or replace table CLIENTE 
(
   ID_CLIENTE           integer                        not null,
   NOMBRE_CLIENTE       varchar(100)                   not null,
   EDAD_CLIENTE         integer                        not null,
   DIRECCION_CLIENTE    varchar(100)                   not null,
   TELEFONO_CLIENTE     varchar(15)                    not null,
   CORREO_CLIENTE       varchar(100)                   not null,
   APELLIDO_CLIENTE     varchar(100)                   not null,
   constraint PK_CLIENTE primary key clustered (ID_CLIENTE)
);

/*==============================================================*/
/* Index: CLIENTE_PK                                            */
/*==============================================================*/
create unique clustered index CLIENTE_PK on CLIENTE (
ID_CLIENTE ASC
);

/*==============================================================*/
/* Table: CURSOS                                                */
/*==============================================================*/
create or replace table CURSOS 
(
   ID_CURSO             integer                        not null,
   ID_MEDICO            integer                        null,
   ID_INSTITUCION       integer                        null,
   ESPECIALIDAD_CURSO   varchar(200)                   not null,
   FECHA_INICIO_CURSO   date                           not null,
   FECHA_FIN_CURSO      date                           not null,
   DURACION_CURSO       varchar(100)                   not null,
   CANTIDAD_CURSO       integer                        not null,
   constraint PK_CURSOS primary key clustered (ID_CURSO)
);

/*==============================================================*/
/* Index: CURSOS_PK                                             */
/*==============================================================*/
create unique clustered index CURSOS_PK on CURSOS (
ID_CURSO ASC
);

/*==============================================================*/
/* Index: MEDICO_CURSO_FK                                       */
/*==============================================================*/
create index MEDICO_CURSO_FK on CURSOS (
ID_MEDICO ASC
);

/*==============================================================*/
/* Index: INSTITUCION_CURSO_FK                                  */
/*==============================================================*/
create index INSTITUCION_CURSO_FK on CURSOS (
ID_INSTITUCION ASC
);

/*==============================================================*/
/* Table: ESTADO_MATERIAL                                       */
/*==============================================================*/
create or replace table ESTADO_MATERIAL 
(
   ID_ESTADOM           integer                        not null,
   ID_MATERIAL          integer                        null,
   DESCRIPCION_ESTADOM  varchar(100)                   not null,
   constraint PK_ESTADO_MATERIAL primary key clustered (ID_ESTADOM)
);

/*==============================================================*/
/* Index: ESTADO_MATERIAL_PK                                    */
/*==============================================================*/
create unique clustered index ESTADO_MATERIAL_PK on ESTADO_MATERIAL (
ID_ESTADOM ASC
);

/*==============================================================*/
/* Index: MATERIAL_ESTADO_FK                                    */
/*==============================================================*/
create index MATERIAL_ESTADO_FK on ESTADO_MATERIAL (
ID_MATERIAL ASC
);

/*==============================================================*/
/* Table: INSTITUCION                                           */
/*==============================================================*/
create or replace table INSTITUCION 
(
   ID_INSTITUCION       integer                        not null,
   NOMBRE_INSTITUCION   varchar(100)                   not null,
   DIRECCION_INSTITUCION varchar(100)                   not null,
   TELEFONO_INSTITUCION varchar(15)                    not null,
   CORREO_INSTITUCION   varchar(100)                   not null,
   constraint PK_INSTITUCION primary key clustered (ID_INSTITUCION)
);

/*==============================================================*/
/* Index: INSTITUCION_PK                                        */
/*==============================================================*/
create unique clustered index INSTITUCION_PK on INSTITUCION (
ID_INSTITUCION ASC
);

/*==============================================================*/
/* Table: MATERIAL                                              */
/*==============================================================*/
create or replace table MATERIAL 
(
   ID_MATERIAL          integer                        not null,
   ID_MEDICO            integer                        null,
   NOMBRE_MATERIAL      varchar(100)                   not null,
   constraint PK_MATERIAL primary key clustered (ID_MATERIAL)
);

/*==============================================================*/
/* Index: MATERIAL_PK                                           */
/*==============================================================*/
create unique clustered index MATERIAL_PK on MATERIAL (
ID_MATERIAL ASC
);

/*==============================================================*/
/* Index: MEDICO_MATERIAL_FK                                    */
/*==============================================================*/
create index MEDICO_MATERIAL_FK on MATERIAL (
ID_MEDICO ASC
);

/*==============================================================*/
/* Table: MEDICO                                                */
/*==============================================================*/
create or replace table MEDICO 
(
   ID_MEDICO            integer                        not null,
   ID_CARGO             integer                        null,
   ID_CLIENTE           integer                        null,
   ID_SUELDO            integer                        null,
   NOMBRE_MEDICO        varchar(100)                   not null,
   DIRECCION_MEDICO     varchar(100)                   not null,
   TELEFONO_MEDICO      varchar(20)                    not null,
   NACIMIENTO_MEDICO    date                           not null,
   constraint PK_MEDICO primary key clustered (ID_MEDICO)
);

/*==============================================================*/
/* Index: MEDICO_PK                                             */
/*==============================================================*/
create unique clustered index MEDICO_PK on MEDICO (
ID_MEDICO ASC
);

/*==============================================================*/
/* Index: CARGO_MEDICO_FK                                       */
/*==============================================================*/
create index CARGO_MEDICO_FK on MEDICO (
ID_CARGO ASC
);

/*==============================================================*/
/* Index: CLIENTE_MEDICO_FK                                     */
/*==============================================================*/
create index CLIENTE_MEDICO_FK on MEDICO (
ID_CLIENTE ASC
);

/*==============================================================*/
/* Index: SUELDO_MEDICO_FK                                      */
/*==============================================================*/
create index SUELDO_MEDICO_FK on MEDICO (
ID_SUELDO ASC
);

/*==============================================================*/
/* Table: REGISTRO_ASISTENCIA                                   */
/*==============================================================*/
create or replace table REGISTRO_ASISTENCIA 
(
   ID_ASISTENCIA        integer                        not null,
   ID_MEDICO            integer                        null,
   FECHA_ASISTENCIA     date                           not null,
   FECHA_INASISTENCIA   date                           not null,
   MOTIVO_INASISTENCIA  char(100)                      not null,
   constraint PK_REGISTRO_ASISTENCIA primary key clustered (ID_ASISTENCIA)
);

/*==============================================================*/
/* Index: REGISTRO_ASISTENCIA_PK                                */
/*==============================================================*/
create unique clustered index REGISTRO_ASISTENCIA_PK on REGISTRO_ASISTENCIA (
ID_ASISTENCIA ASC
);

/*==============================================================*/
/* Index: MEDICO_ASISTENCIA_FK                                  */
/*==============================================================*/
create index MEDICO_ASISTENCIA_FK on REGISTRO_ASISTENCIA (
ID_MEDICO ASC
);

/*==============================================================*/
/* Table: SERVICIO                                              */
/*==============================================================*/
create or replace table SERVICIO 
(
   ID_SERVICIO          integer                        not null,
   ID_CLIENTE           integer                        null,
   ID_TRATAMIENTO       integer                        null,
   FECHA_SERVICIO       date                           not null,
   constraint PK_SERVICIO primary key clustered (ID_SERVICIO)
);

/*==============================================================*/
/* Index: SERVICIO_PK                                           */
/*==============================================================*/
create unique clustered index SERVICIO_PK on SERVICIO (
ID_SERVICIO ASC
);

/*==============================================================*/
/* Index: CLIENTE_SERVICIO_FK                                   */
/*==============================================================*/
create index CLIENTE_SERVICIO_FK on SERVICIO (
ID_CLIENTE ASC
);

/*==============================================================*/
/* Index: TRATAMIENTO_SERVICIOS_FK                              */
/*==============================================================*/
create index TRATAMIENTO_SERVICIOS_FK on SERVICIO (
ID_TRATAMIENTO ASC
);

/*==============================================================*/
/* Table: SUELDO                                                */
/*==============================================================*/
create or replace table SUELDO 
(
   ID_SUELDO            integer                        not null,
   HORAS_EXTRAS         time                           not null,
   AUMENTO              numeric(8,2)                   not null,
   TOTAL_SUELDO         numeric(8,2)                   not null,
   constraint PK_SUELDO primary key clustered (ID_SUELDO)
);

/*==============================================================*/
/* Index: SUELDO_PK                                             */
/*==============================================================*/
create unique clustered index SUELDO_PK on SUELDO (
ID_SUELDO ASC
);

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
/* Index: TRATAMIENTOS_PK                                       */
/*==============================================================*/
create unique clustered index TRATAMIENTOS_PK on TRATAMIENTOS (
ID_TRATAMIENTO ASC
);

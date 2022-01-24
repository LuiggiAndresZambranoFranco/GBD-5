/*==============================================================*/
/* Table: ANTECEDENTES                                          */
/*==============================================================*/
create table ANTECEDENTES (
   ID_ANTECEDENTES      INT4                 not null,
   ID_CLIENTE           INT4                 null,
   PATOLOGIAS_A         VARCHAR(100)         not null,
   ENFERMEDADES_ACTUALES VARCHAR(100)         not null,
   constraint PK_ANTECEDENTES primary key (ID_ANTECEDENTES)
);

/*==============================================================*/
/* Index: ANTECEDENTES_PK                                       */
/*==============================================================*/
create unique index ANTECEDENTES_PK on ANTECEDENTES (
ID_ANTECEDENTES
);

/*==============================================================*/
/* Index: CLIENTE_ANTECEDENTES_FK                               */
/*==============================================================*/
create  index CLIENTE_ANTECEDENTES_FK on ANTECEDENTES (
ID_CLIENTE
);

/*==============================================================*/
/* Table: CARGO                                                 */
/*==============================================================*/
create table CARGO (
   ID_CARGO             INT4                 not null,
   DESCRIPCION_CARGO    VARCHAR(100)         not null,
   constraint PK_CARGO primary key (ID_CARGO)
);

/*==============================================================*/
/* Index: CARGO_PK                                              */
/*==============================================================*/
create unique index CARGO_PK on CARGO (
ID_CARGO
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_CLIENTE           INT4                 not null,
   NOMBRE_CLIENTE       VARCHAR(100)         not null,
   EDAD_CLIENTE         INT4                 not null,
   DIRECCION_CLIENTE    VARCHAR(100)         not null,
   TELEFONO_CLIENTE     VARCHAR(15)          not null,
   CORREO_CLIENTE       VARCHAR(100)         not null,
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Index: CLIENTE_PK                                            */
/*==============================================================*/
create unique index CLIENTE_PK on CLIENTE (
ID_CLIENTE
);

/*==============================================================*/
/* Table: CURSOS                                                */
/*==============================================================*/
create table CURSOS (
   ID_CURSO             INT4                 not null,
   ID_MEDICO            INT4                 null,
   ID_INSTITUCION       INT4                 null,
   ESPECIALIDAD_CURSO   VARCHAR(200)         not null,
   FECHA_INICIO_CURSO   DATE                 not null,
   FECHA_FIN_CURSO      DATE                 not null,
   DURACION_CURSO       VARCHAR(100)         not null,
   CANTIDAD_CURSO       INT4                 not null,
   constraint PK_CURSOS primary key (ID_CURSO)
);

/*==============================================================*/
/* Index: CURSOS_PK                                             */
/*==============================================================*/
create unique index CURSOS_PK on CURSOS (
ID_CURSO
);

/*==============================================================*/
/* Index: MEDICO_CURSO_FK                                       */
/*==============================================================*/
create  index MEDICO_CURSO_FK on CURSOS (
ID_MEDICO
);

/*==============================================================*/
/* Index: INSTITUCION_CURSO_FK                                  */
/*==============================================================*/
create  index INSTITUCION_CURSO_FK on CURSOS (
ID_INSTITUCION
);

/*==============================================================*/
/* Table: ESTADO_MATERIAL                                       */
/*==============================================================*/
create table ESTADO_MATERIAL (
   ID_ESTADOM           INT4                 not null,
   ID_MATERIAL          INT4                 null,
   DESCRIPCION_ESTADOM  VARCHAR(100)         not null,
   constraint PK_ESTADO_MATERIAL primary key (ID_ESTADOM)
);

/*==============================================================*/
/* Index: ESTADO_MATERIAL_PK                                    */
/*==============================================================*/
create unique index ESTADO_MATERIAL_PK on ESTADO_MATERIAL (
ID_ESTADOM
);

/*==============================================================*/
/* Index: MATERIAL_ESTADO_FK                                    */
/*==============================================================*/
create  index MATERIAL_ESTADO_FK on ESTADO_MATERIAL (
ID_MATERIAL
);

/*==============================================================*/
/* Table: INSTITUCION                                           */
/*==============================================================*/
create table INSTITUCION (
   ID_INSTITUCION       INT4                 not null,
   NOMBRE_INSTITUCION   VARCHAR(100)         not null,
   DIRECCION_INSTITUCION VARCHAR(100)         not null,
   TELEFONO_INSTITUCION VARCHAR(15)          not null,
   CORREO_INSTITUCION   VARCHAR(100)         not null,
   constraint PK_INSTITUCION primary key (ID_INSTITUCION)
);

/*==============================================================*/
/* Index: INSTITUCION_PK                                        */
/*==============================================================*/
create unique index INSTITUCION_PK on INSTITUCION (
ID_INSTITUCION
);

/*==============================================================*/
/* Table: MATERIAL                                              */
/*==============================================================*/
create table MATERIAL (
   ID_MATERIAL          INT4                 not null,
   ID_MEDICO            INT4                 null,
   NOMBRE_MATERIAL      VARCHAR(100)         not null,
   constraint PK_MATERIAL primary key (ID_MATERIAL)
);

/*==============================================================*/
/* Index: MATERIAL_PK                                           */
/*==============================================================*/
create unique index MATERIAL_PK on MATERIAL (
ID_MATERIAL
);

/*==============================================================*/
/* Index: MEDICO_MATERIAL_FK                                    */
/*==============================================================*/
create  index MEDICO_MATERIAL_FK on MATERIAL (
ID_MEDICO
);

/*==============================================================*/
/* Table: MEDICO                                                */
/*==============================================================*/
create table MEDICO (
   ID_MEDICO            INT4                 not null,
   ID_CARGO             INT4                 null,
   ID_CLIENTE           INT4                 null,
   ID_SUELDO            INT4                 null,
   NOMBRE_MEDICO        VARCHAR(100)         not null,
   DIRECCION_MEDICO     VARCHAR(100)         not null,
   TELEFONO_MEDICO      VARCHAR(20)          not null,
   NACIMIENTO_MEDICO    DATE                 not null,
   constraint PK_MEDICO primary key (ID_MEDICO)
);

/*==============================================================*/
/* Index: MEDICO_PK                                             */
/*==============================================================*/
create unique index MEDICO_PK on MEDICO (
ID_MEDICO
);

/*==============================================================*/
/* Index: CARGO_MEDICO_FK                                       */
/*==============================================================*/
create  index CARGO_MEDICO_FK on MEDICO (
ID_CARGO
);

/*==============================================================*/
/* Index: CLIENTE_MEDICO_FK                                     */
/*==============================================================*/
create  index CLIENTE_MEDICO_FK on MEDICO (
ID_CLIENTE
);

/*==============================================================*/
/* Index: SUELDO_MEDICO_FK                                      */
/*==============================================================*/
create  index SUELDO_MEDICO_FK on MEDICO (
ID_SUELDO
);

/*==============================================================*/
/* Table: REGISTRO_ASISTENCIA                                   */
/*==============================================================*/
create table REGISTRO_ASISTENCIA (
   ID_ASISTENCIA        INT4                 not null,
   ID_MEDICO            INT4                 null,
   FECHA_ASISTENCIA     DATE                 not null,
   FECHA_INASISTENCIA   DATE                 not null,
   constraint PK_REGISTRO_ASISTENCIA primary key (ID_ASISTENCIA)
);

/*==============================================================*/
/* Index: REGISTRO_ASISTENCIA_PK                                */
/*==============================================================*/
create unique index REGISTRO_ASISTENCIA_PK on REGISTRO_ASISTENCIA (
ID_ASISTENCIA
);

/*==============================================================*/
/* Index: MEDICO_ASISTENCIA_FK                                  */
/*==============================================================*/
create  index MEDICO_ASISTENCIA_FK on REGISTRO_ASISTENCIA (
ID_MEDICO
);

/*==============================================================*/
/* Table: SERVICIO                                              */
/*==============================================================*/
create table SERVICIO (
   ID_SERVICIO          INT4                 not null,
   ID_CLIENTE           INT4                 null,
   ID_TRATAMIENTO       INT4                 null,
   FECHA_SERVICIO       DATE                 not null,
   constraint PK_SERVICIO primary key (ID_SERVICIO)
);

/*==============================================================*/
/* Index: SERVICIO_PK                                           */
/*==============================================================*/
create unique index SERVICIO_PK on SERVICIO (
ID_SERVICIO
);

/*==============================================================*/
/* Index: CLIENTE_SERVICIO_FK                                   */
/*==============================================================*/
create  index CLIENTE_SERVICIO_FK on SERVICIO (
ID_CLIENTE
);

/*==============================================================*/
/* Index: TRATAMIENTO_SERVICIOS_FK                              */
/*==============================================================*/
create  index TRATAMIENTO_SERVICIOS_FK on SERVICIO (
ID_TRATAMIENTO
);

/*==============================================================*/
/* Table: SUELDO                                                */
/*==============================================================*/
create table SUELDO (
   ID_SUELDO            INT4                 not null,
   HORAS_EXTRAS         TIME                 not null,
   AUMENTO              NUMERIC(8,2)    CHECK (AUMENTO>=0)     not null,
   SUELDO               NUMERIC(8,2)    CHECK (SUELDO>0)     not null,
   TOTAL_SUELDO         NUMERIC(8,2)    CHECK (TOTAL_SUELDO>=0)     not null,
   constraint PK_SUELDO primary key (ID_SUELDO)
);

/*==============================================================*/
/* Index: SUELDO_PK                                             */
/*==============================================================*/
create unique index SUELDO_PK on SUELDO (
ID_SUELDO
);

/*==============================================================*/
/* Table: TRATAMIENTOS                                          */
/*==============================================================*/
create table TRATAMIENTOS (
   ID_TRATAMIENTO       INT4                 not null,
   DESCRIPCION_TRATAMIENTO VARCHAR(100)         not null,
   CANTIDAD INT4     CHECK (CANTIDAD>0)            not null,
   PRECIO NUMERIC(8,2)     CHECK (PRECIO >=0)                 not null,
   constraint PK_TRATAMIENTOS primary key (ID_TRATAMIENTO)
);

/*==============================================================*/
/* Index: TRATAMIENTOS_PK                                       */
/*==============================================================*/
create unique index TRATAMIENTOS_PK on TRATAMIENTOS (
ID_TRATAMIENTO
);

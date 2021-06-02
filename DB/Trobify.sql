
create database trobify;
use trobify;

create table inmueble(
    codigo_inmueble INTEGER PRIMARY key not null,
    nombre varchar(100),
    unidades INTEGER,
    tipo_compra VARCHAR(30),
    ubicacion varchar(150),
    precio INTEGER,
    imagenes VARCHAR(150),
    recamaras_no INTEGER,
    tipo_entrega VARCHAR(50),
    disponibilidad VARCHAR(50)
);

create table historicos(
    id_historicos INTEGER,
    codigo_in INTEGER,
    fecha DATE,
    visita INTEGER,
    oferta INTEGER,
    no_oferta INTEGER,
    no_visita INTEGER,
    
    FOREIGN key(codigo_in) 
    REFERENCES inmueble(codigo_inmueble)
    on delete cascade,
    PRIMARY KEY(id_historicos, codigo_in)
);

CREATE table usuario(
    curp_usaurio VARCHAR(18),
    Nombre VARCHAR(100),
    sexo VARCHAR(9) default "otro",
    correE VARCHAR(50),
    pass varbinary(100) not null,
    
    PRIMARY KEY(curp_usuario)
);

/*para modificar el nombre de usuario*/

alter table usuario
add primary key(curp_usuario);

/*cambiar algun campo en la DB*/
ALTER TABLE usuario change curp_usaurio curp_usuario VARCHAR(18);

create table favorito(
    estado VARCHAR(30),
    fecha DATE,
    fav_id INTEGER not null,
    curp_u1 VARCHAR(18) not null,
    
    PRIMARY KEY(curp_u1, fav_id) ,
    FOREIGN KEY(curp_u1) 
    REFERENCES usuario(curp_usuario)
    ON DELETE CASCADE
);

create TABLE propietario(
    curp_propietario VARCHAR(18) PRIMARY KEY not null,
    nombre VARCHAR(40),
    materno VARCHAR(40),
    paterno VARCHAR(40),
    CorreoE VARCHAR(50)not null,
    sexo VARCHAR(9) default "otro",
    pass varbinary(100) not NULL
);

create table intermediario(
    Nombre_empresa VARCHAR(50),
    correoE VARCHAR(50) not null,
    pass varbinary(50) not NULL,
    
    PRIMARY KEY(cooreoE)
);

create table empleados(
    curp_empleados VARCHAR(18),
    correoE VARCHAR(40),
    Nombre VARCHAR(30),
    materno VARCHAR(30),
    paterno VARCHAR(30),
    correo_inter VARCHAR(50) not null,
    sexo VARCHAR(8) default "otros",
    especialidad VARCHAR(20),
    
    PRIMARY KEY(curp_empleados),
    FOREIGN KEY(correo_inter)
    REFERENCES intermediario(correoE)
    on DELETE CASCADE
);


create table estadisticas(
    curp_emp VARCHAR(18),
    ventas_agendadas INTEGER,
    ventas_cocretadas INTEGER,
    ofertas INTEGER,
    vistas_con INTEGER,
    no_visitas INTEGER,

    PRIMARY KEY(curp_emp),
    FOREIGN key (curp_emp)
    REFERENCES empleados(curp_empleados)
    on DELETE CASCADE 
);

create table administrador(
    cod_inm INTEGER not null,
    curp_prop VARCHAR(18),
    correo_int VARCHAR(50),

    PRIMARY KEY(cod_inm),

    FOREIGN KEY(cod_inm)
    REFERENCES inmueble(codigo_inmueble)
    on DELETE CASCADE,

    FOREIGN KEY(correo_int)
    REFERENCES intermediario(correoE)
    on DELETE CASCADE,

    FOREIGN KEY(curp_prop)
    REFERENCES propietario(curp_propietario)
    on DELETE CASCADE,
);

create TABLE agenda(
    id_agenda integer not null,
    nota VARCHAR(200),
    fecha date,

    PRIMARY KEY(id_agenda)
);

create table sagenda(
    curp_prop1 VARCHAR(18),
    curp_emp1 VARCHAR(18),
    curp_u VARCHAR(18),
    id_agenda1 INTEGER not null,

    PRIMARY KEY (id_agenda1),

    FOREIGN KEY(id_agenda1)
    REFERENCES agenda(id_agenda)
    on DELETE CASCADE,

    FOREIGN KEY(curp_prop1)
    REFERENCES propietario(curp_propietario)
    on DELETE CASCADE,
    
    FOREIGN KEY(curp_u)
    REFERENCES usuario(curp_usaurio)
    on DELETE CASCADE,
);


insert into inmubele values(
    000000,
    'Inmueble rustico de descanso',
    500,
    '',
    '',
    4500,
    '',
    5,
    'inmediata',
    'disponible'
);

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
    Nombre VARCHAR(100),
    sexo VARCHAR(9) default "otro",
    correE VARCHAR(50),
    pass varbinary(100) not null,
    fechaNac DATE,
    tipoUsuario VARCHAR(20) default "normal",
    
    PRIMARY KEY(correoE)
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
    correo_u VARCHAR(50) not null,
    
    PRIMARY KEY(correo_u, fav_id),
    FOREIGN KEY(correo_u) 
    REFERENCES usuario(correoE)
    ON DELETE CASCADE
);

create table estadisticas(
    correo_u1 VARCHAR(50),
    ventas_agendadas INTEGER,
    ventas_cocretadas INTEGER,
    ofertas INTEGER,
    vistas_con INTEGER,
    no_visitas INTEGER,

    PRIMARY KEY(correo_u1),
    FOREIGN key (correo_u1)
    REFERENCES usuario(correE)
    on DELETE CASCADE 
);

create table administrador(
    cod_inm INTEGER not null,
    correoU VARCHAR(50),

    PRIMARY KEY(cod_inm),

    FOREIGN KEY(cod_inm)
    REFERENCES inmueble(codigo_inmueble)
    on DELETE CASCADE,

    FOREIGN KEY(correo_int)
    REFERENCES usuario(correoE)
    on DELETE CASCADE
);

create TABLE agenda(
    id_agenda integer not null,
    nota VARCHAR(200),
    fecha date,

    PRIMARY KEY(id_agenda)
);

create table sagenda(
    correo_u2 VARCHAR(18),
    id_agenda1 INTEGER not null,

    PRIMARY KEY (id_agenda1, correo_u2),

    FOREIGN KEY(id_agenda1)
    REFERENCES agenda(id_agenda)
    on DELETE CASCADE,
    
    FOREIGN KEY(correo_u2)
    REFERENCES usuario(correoE)
    on DELETE CASCADE
);


insert into inmueble values(
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
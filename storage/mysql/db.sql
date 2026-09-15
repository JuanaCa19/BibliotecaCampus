CREATE database biblioteca_campus;
use biblioteca_campus;

create table libro(
	idLibro INT primary key auto_increment,
	isbn varchar(50) not null unique,
	genero varchar(100) not null,
	disponibilidad boolean,
	titulo varchar(150) not null
);

create table autor(
	idAutor INT primary key auto_increment,
	nombre varchar(100) not null,
	apellido varchar(100) not null
);

create table miembro(
	idMiembro INT primary key auto_increment,
	apellido varchar(100) not null,
	nombre varchar(100) not null,
	telefono varchar(15) not null
);

create table publicacion(
	idPublicacion INT primary key auto_increment,
	numeroEdicion varchar(50) not null,
	editorial varchar(100) not null,
	fechaPublicacion date not null,
	idLibro INT not null,
	foreign key(idLibro) references libro(idLibro),
	unique(idLibro,numeroEdicion)
);

create table transaccion(
	idTransaccion INT primary key auto_increment,
	fechaPrestamo date not null,
	estado varchar(100) not null,
	fechaDevolucion date,
	idLibro INT not null,
	idMiembro INT not null,
	foreign key(idLibro) references libro(idLibro),
	foreign key(idMiembro) references miembro(idMiembro)
);

create table libro_autor(
	idLibro INT,
	idAutor INT,
	primary key(idLibro,idAutor),
	foreign key(idLibro) references libro(idLibro),
	foreign key(idAutor) references autor(idAutor)
);


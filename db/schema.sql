USE gestion_academica;

CREATE TABLE DEPARTAMENTO (
    iddepto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    email_contacto VARCHAR(100)
);


CREATE TABLE TITULACION (
    id_titulacion INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    nivel VARCHAR(30),
    creditos INT
);


CREATE TABLE ESTUDIANTE (
    idalumno INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    apellido VARCHAR(100),
    email VARCHAR(100),
    cumpleanos DATE,
    fechaalta DATE
);


CREATE TABLE PROFESOR (
    idprofesor INT PRIMARY KEY AUTO_INCREMENT,
    iddepartamento INT,
    nombre VARCHAR(50),
    apellidos VARCHAR(100),
    email VARCHAR(100),
    FOREIGN KEY (iddepartamento) REFERENCES DEPARTAMENTO(iddepto)
);


CREATE TABLE ASIGNATURA (
    idasignatura INT PRIMARY KEY AUTO_INCREMENT,
    id_titulacion INT,
    nombre VARCHAR(100),
    curso INT,
    creditos INT,
    FOREIGN KEY (id_titulacion) REFERENCES TITULACION(id_titulacion)
);


CREATE TABLE CLASE (
    idclase INT PRIMARY KEY AUTO_INCREMENT,
    idasignatura INT,
    idprofesor INT,
    curso INT,
    aula VARCHAR(30),
    FOREIGN KEY (idasignatura) REFERENCES ASIGNATURA(idasignatura),
    FOREIGN KEY (idprofesor) REFERENCES PROFESOR(idprofesor)
);


CREATE TABLE ACTIVO (
    idactivo INT PRIMARY KEY AUTO_INCREMENT,
    idalumno INT,
    id_titulacion INT,
    fechaalta DATE,
    fecha_baja DATE,
    estado VARCHAR(20),
    FOREIGN KEY (idalumno) REFERENCES ESTUDIANTE(idalumno),
    FOREIGN KEY (id_titulacion) REFERENCES TITULACION(id_titulacion)
);


CREATE TABLE CALIFICACION (
    idnota INT PRIMARY KEY AUTO_INCREMENT,
    idalumno INT,
    idasignatura INT,
    nota DECIMAL(4,2),
    convocatoria VARCHAR(30),
    FOREIGN KEY (idalumno) REFERENCES ESTUDIANTE(idalumno),
    FOREIGN KEY (idasignatura) REFERENCES ASIGNATURA(idasignatura)
);



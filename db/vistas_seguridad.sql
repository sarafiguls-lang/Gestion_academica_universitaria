USE gestion_academica;
CREATE OR REPLACE VIEW vista_estudiantes_publico AS
SELECT 
    idalumno, 
    nombre, 
    apellido, 
    fechaalta
FROM ESTUDIANTE;
CREATE OR REPLACE VIEW vista_profesores_info AS
SELECT 
    p.idprofesor, 
    p.nombre, 
    p.apellidos, 
    d.nombre AS departamento
FROM PROFESOR p
JOIN DEPARTAMENTO d ON p.iddepartamento = d.iddepto;
CREATE OR REPLACE VIEW vista_mis_calificaciones AS
SELECT 
    c.idalumno, 
    e.nombre AS nombre_alumno,
    a.nombre AS asignatura, 
    c.nota, 
    c.convocatoria
FROM CALIFICACION c
JOIN ESTUDIANTE e ON c.idalumno = e.idalumno
JOIN ASIGNATURA a ON c.idasignatura = a.idasignatura
WHERE e.email = USER();

CREATE OR REPLACE VIEW vista_clases_profesor AS
SELECT 
    cl.idclase, 
    p.idprofesor,
    a.nombre AS asignatura, 
    cl.curso, 
    cl.aula
FROM CLASE cl
JOIN PROFESOR p ON cl.idprofesor = p.idprofesor
JOIN ASIGNATURA a ON cl.idasignatura = a.idasignatura
WHERE p.email = USER();
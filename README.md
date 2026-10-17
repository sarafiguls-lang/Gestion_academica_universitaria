Base de Datos Universitaria — M0

Este proyecto consiste en una base de datos para la gestión académica de una universidad, utilizando MySQL 8, Docker y Python.

La base de datos tiene 8 tablas relacionadas y 780 registros ficticios generados con Python y Faker.

1. Requisitos

Docker Desktop

MySQL Workbench

Python 3.11 o superior

Librería Faker (python -m pip install Faker)

2. Iniciar la base de datos

Primero, hacer una copia del archivo .env.example y cambiarle el nombre a .env.

Comprobar que la base de datos se llama gestion_academica y configurar las contraseñas.

Abrir una terminal dentro de la carpeta del proyecto y ejecutar:

docker compose up -d

Esto inicia MySQL dentro de Docker.

3. Conectar con MySQL

Abrir MySQL Workbench y crear una conexión con estos datos:

Host: 127.0.0.1

Puerto: 3307

Usuario: uni_user

Contraseña: la configurada en .env

4. Crear las tablas

Abrir el archivo schema.sql en MySQL Workbench y ejecutarlo.

Esto crea las 8 tablas de la base de datos gestion_academica.

5. Generar y cargar los datos ficticios

Abrir una terminal en la carpeta del proyecto y ejecutar:

python generar_datos.py

Esto genera el archivo datos_sinteticos.sql con 780 registros ficticios.

Después, abrir datos_sinteticos.sql en MySQL Workbench y ejecutarlo para cargar los datos.

6. Comprobar que funciona

Ejecutar estas consultas en MySQL Workbench:

USE gestion_academica;
SHOW TABLES;
SELECT COUNT(*) FROM ESTUDIANTE;
SELECT COUNT(*) FROM CALIFICACION;

Deberían aparecer 8 tablas, 150 estudiantes y 320 calificaciones.

7. Archivos del proyecto

docker-compose.yml — Inicia MySQL con Docker.

schema.sql — Crea las tablas.

generar_datos.py — Genera los datos ficticios.

datos_sinteticos.sql — Contiene los registros generados.

.env.example — Ejemplo de configuración.

from faker import Faker
import random

fake = Faker("es_ES")

f = open("db/02_datos_sinteticos.sql", "w", encoding="utf-8")
f.write("USE gestion_academica;\n")

# Departamentos (5)
departamentos = ["Informatica", "Matematicas", "Fisica", "Economia", "Derecho"]

for i in range(5):
    f.write(f"INSERT INTO DEPARTAMENTO VALUES ({i+1}, '{departamentos[i]}', 'depto{i+1}@example.com');\n")

# Titulaciones (10)
for i in range(10):
    f.write(f"INSERT INTO TITULACION VALUES ({i+1}, 'Titulacion {i+1}', 'Grado', 240);\n")

# Estudiantes (150)
for i in range(150):
    nombre = fake.first_name()
    apellido = fake.last_name()
    nacimiento = fake.date_of_birth(minimum_age=18, maximum_age=30)

    f.write(f"INSERT INTO ESTUDIANTE VALUES ({i+1}, '{nombre}', '{apellido}', 'alumno{i+1}@example.com', '{nacimiento}', '2026-09-01');\n")

# Profesores (25)
for i in range(25):
    nombre = fake.first_name()
    apellido = fake.last_name()
    departamento = random.randint(1, 5)

    f.write(f"INSERT INTO PROFESOR VALUES ({i+1}, {departamento}, '{nombre}', '{apellido}', 'profesor{i+1}@example.com');\n")

# Asignaturas (40)
for i in range(40):
    titulacion = random.randint(1, 10)
    f.write(f"INSERT INTO ASIGNATURA VALUES ({i+1}, {titulacion}, 'Asignatura {i+1}', 1, 6);\n")

# Clases (80)
for i in range(80):
    asignatura = random.randint(1, 40)
    profesor = random.randint(1, 25)
    f.write(f"INSERT INTO CLASE VALUES ({i+1}, {asignatura}, {profesor}, 1, 'Aula 1');\n")

# Estados de estudiantes (150)
for i in range(150):
    titulacion = random.randint(1, 10)
    f.write(f"INSERT INTO ACTIVO VALUES ({i+1}, {i+1}, {titulacion}, '2026-09-01', NULL, 'Activo');\n")

# Calificaciones (320)
for i in range(320):
    alumno = random.randint(1, 150)
    asignatura = random.randint(1, 40)
    nota = round(random.uniform(0, 10), 2)

    f.write(f"INSERT INTO CALIFICACION VALUES ({i+1}, {alumno}, {asignatura}, {nota}, 'Ordinaria');\n")

f.close()

print("Datos creados correctamente")
print("Total: 780 registros")

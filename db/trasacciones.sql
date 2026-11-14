USE gestion_academica;
START TRANSACTION;
UPDATE CALIFICACION 
SET nota = CASE 
    WHEN nota < 5.00 THEN nota + 0.25
    WHEN nota >= 9.00 THEN 10.00 
    ELSE nota                    
END
WHERE idasignatura = 1;
COMMIT;
START TRANSACTION;
INSERT INTO ACTIVO (idalumno, id_titulacion, fechaalta, fecha_baja, estado)
VALUES (1, 1, CURDATE(), NULL, 'Activo');
ROLLBACK;
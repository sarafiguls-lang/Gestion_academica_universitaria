USE gestion_academica;
SELECT * FROM vista_estudiantes_publico LIMIT 5;
SELECT * FROM vista_profesores_info LIMIT 5;
SELECT * FROM vista_mis_calificaciones;
SELECT * FROM vista_clases_profesor;
SELECT 'VALOR INICIAL:' AS estado, idnota, nota FROM CALIFICACION WHERE idnota = 1;
START TRANSACTION;
UPDATE CALIFICACION 
SET nota = CASE 
    WHEN nota < 5.00 THEN 5.00 
    ELSE 0.00 
END 
WHERE idnota = 1;
SELECT 'VALOR PROVISIONAL (Sin guardar):' AS estado, idnota, nota FROM CALIFICACION WHERE idnota = 1;
ROLLBACK;
SELECT 'VALOR TRAS EL ROLLBACK (Restaurado):' AS estado, idnota, nota FROM CALIFICACION WHERE idnota = 1;
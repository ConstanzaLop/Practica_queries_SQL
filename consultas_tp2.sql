--A. Seleccionar los títulos con runtime superior a 90 y lenguaje Francés. Incluir el tipo de contenido. Ordenar los títulos de menor a mayor.

SELECT title_content as titulo, type as tipo
FROM content as c
INNER JOIN production as p
ON p.id_content = c.id_content
WHERE p.runtime > 90 AND p.language = 'French'
ORDER BY c.title_content ASC;

--B. Seleccionar aquellos títulos que posean director y país de origen. Filtrar por aquellas que tengan un Runtime mayor a 70. Ordenar los títulos de manera ascendente.

SELECT director, country as pais
FROM content as c
INNER JOIN production as p
ON p.id_content = c.id_content
WHERE p.runtime > 70
ORDER BY c.title_content ASC;
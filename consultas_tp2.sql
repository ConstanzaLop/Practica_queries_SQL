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

--C. Sume el Runtime de las películas que tengan como único país de origen United States, India, Japan, Spain y Mexico, discriminando y ordenando por país. Incluya la columna género.

SELECT SUM(runtime) AS runtime_total, countries pais, genre as genero
FROM content AS c
JOIN production AS p
ON p.id_content = c.id_content
WHERE country IN ('United States', 'India', 'Japan', 'Spain', 'Mexico')
GROUP BY country
ORDER BY country ASC;

--D. Mostrar las películas clasificadas como drama por netflix, que hayan ganado el Oscar entre 2010 y 2020 y que estén en esta plataforma.

SELECT c.title_content as titulo,
FROM content c
JOIN production p ON c.id_content = p.id_content
JOIN oscar o ON c.id_content = o.id_content
WHERE c.listed_in LIKE '%Drama%' AND o.winner=1
AND o.year_ceremony BETWEEN 2010 and 2020;
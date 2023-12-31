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

--E. Seleccionar el título y el género de las películas puntuadas por IMDB entre 7 y 9. Obtener los títulos en idioma inglés.

SELECT o.title_oscar as titulo, p.genre as genero
FROM oscar AS o
JOIN production p ON o.id_content = p.id_content
WHERE o.imdb BETWEEN 7 AND 9;

--F. Cuente la cantidad de títulos de cada género de la tabla productions. Ordene de manera descendente por las cantidades y ascendente por el género.

SELECT COUNT(title_production) AS cantidad_de_titulos, genre as genero
FROM netflix.production
GROUP by genre
ORDER BY cantidad_de_titulos DESC, genre ASC;

--G. Analizar la relación entre Budget y Box Office. Calcular el ratio Budget/Box Office para las peliculas con un puntaje IMDB entre 7 y 9, sin mostrar nulos y no repetidos.

SELECT distinct(title_oscar) as titulo, ROUND(budget_x_million/box_office_x_million*100) AS
ratio_presupuesto_recaudacion
FROM netflix.oscar
WHERE imdb BETWEEN 7 AND 9
AND budget IS NOT NULL
AND box_office IS NOT NULL;

--H. Obtener las películas que ganaron el Oscar a Best Picture, ordenadas de manera descendente por año ganador.

SELECT title_oscar as titulo
FROM netflix.oscar
WHERE winner=1
AND category='BEST PICTURE'
ORDER BY year_ceremony;

--I. Mostrar el título y el año de ceremonia de los oscar para las peliculas puntuadas por IMDB entre 7 y 9. Ordenarlos alfabéticamente por títulos y de mayor a menor por año de ceremonia.

SELECT title_oscar as titulo, year_ceremony as anio_ceremonia
FROM netflix.oscar
WHERE imdb BETWEEN 7 AND 9
GROUP BY title_oscar
ORDER BY title_oscar ASC, year_ceremony DESC;

--J. Mostrar una lista de las películas originales de netflix ganadoras del oscar (si las hubiera) mostrando las columnas title, category, genre runtime, el imdb_score, la premiere y el año de la ceremonia.

SELECT c.title_content as titulo, o.category as categoria, p.genre as genero, p.runtime as
duracion, p.premiere as estreno, o.year_ceremony as anio_ceremonia
FROM content AS c
INNER JOIN oscar AS o ON c.id_content=o.id_content
INNER JOIN production AS p ON c.id_content=p.id_content
WHERE o.winner=1;

--K. Mostrar una lista de las nominaciones al oscar de películas originales de netflix (si las hubiera) que no fueron ganadoras del premio,mostrando las columnas título, category y año de la ceremonia.

SELECT c.title_content as titulo, o.category as categoria, o.year_ceremony as anio_ceremonia
FROM content AS c
INNER JOIN oscar AS o ON c.id_content=o.id_content
WHERE o.winner=0;
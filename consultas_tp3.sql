--Realizar las siguientes consultas sobre una sola tabla. Los nombres de las columnas deben mostrarse en español:

--A.  Listar todos los registros de la tabla, visualizando las columnas type, title_content, country, rating, duration, listed_in.
SELECT type, title_content, country, rating, duration, listed_in
FROM netflix.content;

--B.  Mostrar todas las filas de la tabla, presentando las columnas id_content, title_production, genre, runtime, imdb_Score.
SELECT id_content, title_production, genre, runtime, imdb_Score
FROM netflix.production;

--C.  Generar un listado de todas las películas en las que participe Argentina, mostrando las columnas id_content, type, title_content, director, cast, rating, duration, listed_in.
SELECT id_content, type, title_content, director, cast, rating, duration, listed_in
FROM netflix .content
WHERE country = 'Argentina';

--D.  Presentar un listado con las columnas id_production, title_production, genre, language, imdb_score de los registros de la tabla en las que el imdb_score sea superior a 7.5.
SELECT id_production, title_production, genre, language, imdb_score
FROM netflix .production
WHERE imdb_score >7.5;

--E.  Mostrar las columnas id_content, type, title_content, listed_in de los registros en los que el rating público general o admitido para todas las edades.
SELECT id_content, type, title_content, listed_in
FROM netflix .content
WHERE rating = 'PG' OR rating = 'G';

--F.  Obtener una lista con las columnas id_production, title_production, genre de los registros en que runtime sea menor o igual a 105 minutos y que además sea de al menos 60 minutos.
SELECT id_production, title_production, genre
FROM netflix .production
WHERE runtime <= 105 AND runtime >= 60;

--G.  Obtener la cantidad de registros discriminando por type y rating, ordenados alfabéticamente por rating y por type.
SELECT
   COUNT(*) AS cantidad_registros, rating, type
   FROM netflix.content
   GROUP BY type, rating
   ORDER BY rating ASC, type ASC;

--H.  Mostrar la cantidad  de películas en los idiomas portugués, francés, alemán, italiano y español, ordenados por cantidad, de mayor a menor.
SELECT
   COUNT(*) AS cantidad_peliculas, language
   FROM netflix.production
   WHERE language IN ('Portuguese','French','Dutch','Italian','Spanish')
   GROUP BY language
   ORDER BY cantidad_peliculas DESC;
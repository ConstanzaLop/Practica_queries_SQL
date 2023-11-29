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
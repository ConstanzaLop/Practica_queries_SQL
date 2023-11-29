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
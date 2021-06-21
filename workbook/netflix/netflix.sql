CREATE TABLE netflix (
    title text,
    genre text,
    premiere date,
    runtime integer,
    imdb numeric(2,1),
    language text
)

COPY netflix(title, genre, premiere, runtime, imdb, language)
FROM 'NetflixOriginals.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM netflix;

SELECT language, title,
CASE 
WHEN language LIKE '%/%' THEN 'Multilingual'
	 ELSE language
END AS multlanguage
INTO DestinationTable
FROM netflix;

SELECT genre, title, imdb, runtime, language, premiere,
CASE 
WHEN genre LIKE '%Comedy%' OR genre LIKE '%comedy%' THEN 'Comedy'
WHEN genre LIKE 'Ani%' THEN 'Animation'
     WHEN genre LIKE '%Action%' THEN 'Action'
	 WHEN genre LIKE 'Adventure%' THEN 'Adventure'
	 WHEN genre LIKE 'Drama%' OR genre LIKE '%drama%' THEN 'Drama'
	 WHEN genre LIKE 'Family%' THEN 'Family'
	 WHEN genre LIKE 'Horror%' THEN 'Horror'
	 WHEN genre LIKE 'Musical%' THEN 'Musical'
	 WHEN genre LIKE 'Roman%' THEN 'Romantic'
	 WHEN genre LIKE 'Science fiction%' THEN 'Sci-fi'
         WHEN genre LIKE 'Documentary%' THEN 'Documentary'
         WHEN genre LIKE '%Thriller%' OR genre LIKE '%thriller%' THEN 'Thriller'
         WHEN genre LIKE 'Mystery%' THEN 'Mystery'
	 ELSE 'Other'
END AS genGenre
INTO destinationtable2
FROM netflix;

select destinationtable.language, destinationtable2.premiere,
destinationtable.multlanguage,destinationtable2.genre,
destinationtable2.title,destinationtable2.imdb,
destinationtable2.runtime,destinationtable2.gengenre

from destinationtable, destinationtable2

where destinationtable.title =destinationtable2.title;
CREATE TABLE vg (
    rank integer,
    name VARCHAR(50),
    platform VARCHAR(50),
    year integer,
    genre VARCHAR(50),
    publisher VARCHAR(50),
    na_sales money,
    eu_sales money,
    jp_sales money,
    other_sales money,
    global_sales money
)

COPY persons(rank, name, platform, year, genre, publisher, na_sales, 
eu_sales, jp_sales, other_sales, global_sales)
FROM 'vgsales.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM vg;

SELECT rank, name, platform, year, genre, publisher, na_sales, 
eu_sales, jp_sales, other_sales, global_sales
FROM vg
WHERE Year IS NULL;

DELETE FROM vg WHERE Year='' OR Year IS NULL;
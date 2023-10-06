use world;

select Percentage from countrylanguage;

-- Questão 01
-- a
SELECT 
	country.Name as "País", 
	count(countrylanguage.Language) as "Número de Línguas" 
FROM 
	country
INNER JOIN 
	countrylanguage on (country.Code = countrylanguage.CountryCode)
GROUP BY
	Name
ORDER BY 
count(countrylanguage.Language) desc limit 10;

-- b
SELECT 
	countrylanguage.Language as "Língua",
	country.Name as "País", 
    round(sum(country.Population * countrylanguage.Percentage /100)) as "População Absoluta"
FROM 
	country
INNER JOIN 
	countrylanguage on (country.Code = countrylanguage.CountryCode)
GROUP BY
	 countrylanguage.Language, country.Name, country.Population
ORDER BY country.Name, Population DESC limit 10;

-- c
select `Língua` as "Lingua", sum(`População Absoluta`) as "PA" from (SELECT 
	countrylanguage.Language as "Língua",
	country.Name as "País", 
    round(sum(country.Population * countrylanguage.Percentage /100)) as "População Absoluta"
FROM 
	country
INNER JOIN 
	countrylanguage on (country.Code = countrylanguage.CountryCode)
GROUP BY
	 countrylanguage.Language, country.Name, country.Population
ORDER BY country.Name, Population DESC) as Tabela
GROUP BY Lingua
ORDER BY PA desc;
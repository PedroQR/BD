--2a) 
SELECT
    film.title
FROM
    film
INNER
    JOIN film_category ON film.film_id = film_category.film_id
INNER
    JOIN category ON film_category.category_id = category.category_id
INNER
    JOIN language ON film.language_id = language.language_id
WHERE
    language.name IN ('English', 'French')
AND
    category.name IN ('Animation', 'Action')
AND
    film.length BETWEEN 100 AND 150;

--2b
 SELECT
a.actor_id, a.first_name, a.last_name, f.genre, COUNT(fa.actor_id) as participacoes
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
GROUP BY a.actor_id, f.genre
ORDER BY participacoes DESC;

SELECT
CONCAT(a.first_name, ' ', a.last_name) as Nome,
c.name as Genero,
COUNT(*) as Participacoes
FROM actor a
INNER
    JOIN film_actor fa ON a.actor_id = fa.actor_id
INNER
    JOIN film_category fc ON fa.film_id = fc.film_id
INNER
    JOIN category c ON fc.category_id = c.category_id
GROUP BY
    a.actor_id,
    c.name
ORDER BY
    Participacoes DESC;
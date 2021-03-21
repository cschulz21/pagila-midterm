/*
 * Write a SQL query SELECT query that:
 * List the first and last names of all actors who have appeared in movies in the "Children" category,
 * but that have never appeared in movies in the "Horror" category.
 *
 * HINT:
 * This requires joining from the category table down to the actor table.
 */

SELECT DISTINCT first_name || ' ' || last_name as "actor_name"
FROM category
INNER JOIN film_category USING (category_id)
INNER JOIN film USING (film_id)
INNER JOIN film_actor USING (film_id)
INNER JOIN actor USING (actor_id)
WHERE name = 'Children'
AND actor_id not in (
    SELECT actor_id
    FROM category
    INNER JOIN film_category USING (category_id)
    INNER JOIN film USING (film_id)
    INNER JOIN film_actor USING (film_id)
    INNER JOIN actor USING (actor_id)
    WHERE name = 'Horror'
)
ORDER BY actor_name;

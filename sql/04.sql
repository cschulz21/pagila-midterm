/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query SELECT query that:
 * Lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 * (You may choose to either include or exclude the movie 'AMERICAN CIRCUS' in the results.)
 */
SELECT f2.title
FROM film_actor fa1
INNER JOIN film f1 USING (film_id)
JOIN film_actor fa2 ON (fa2.actor_id = fa1.actor_id)
INNER JOIN film f2 ON (f2.film_id = fa2.film_id)
WHERE f1.title = 'AMERICAN CIRCUS'
GROUP BY f2.title
HAVING count(*) >= 2
ORDER BY title;

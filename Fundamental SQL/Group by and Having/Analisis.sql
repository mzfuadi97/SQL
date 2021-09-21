USE dqlab1;

/* Penggunaan Max pada Having */
SELECT product_id, MAX(total_price) AS total FROM invoice GROUP BY product_id;
SELECT product_id, MAX(total_price) AS total FROM invoice GROUP BY product_id HAVING MAX(total_price) > 100000;
SELECT product_id, MAX(pinalty) AS total FROM invoice GROUP BY product_id HAVING MAX(pinalty) > 30000;

/* Penggunaan Min pada Having */
SELECT product_id, MIN(total_price) AS total FROM invoice GROUP BY product_id;
SELECT product_id, MIN(total_price) AS total FROM invoice GROUP BY product_id HAVING MIN(total_price) < 500000;
SELECT product_id, MIN(pinalty) AS total FROM invoice GROUP BY product_id HAVING MIN(pinalty) < 50000;

/* Penggunaan Average pada Having */
SELECT product_id, AVG(total_price) AS total FROM invoice GROUP BY product_id;
SELECT product_id, AVG(total_price) AS total FROM invoice GROUP BY product_id HAVING AVG(total_price) > 100000;
SELECT product_id, AVG(pinalty) AS total FROM invoice GROUP BY product_id HAVING AVG(pinalty) > 30000;

/* Penggunaan Gabungan pada Having */
SELECT product_id, AVG(pinalty), COUNT(customer_id)  AS total FROM invoice GROUP BY product_id HAVING  COUNT(customer_id) > 20  ;

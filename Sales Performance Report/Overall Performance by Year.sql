/* Memilih Database  */
USE dqlab_sales_store;

/* Overall perofrmance DQLab Store dari tahun 2009 - 2012 untuk jumlah order dan total sales order finished */
SELECT
	YEAR(order_date) AS years,
	ROUND(SUM(sales)) AS sales,
	COUNT(order_id) AS number_of_order
FROM
	dqlab_sales_store
WHERE
	order_status = 'Order Finished'
GROUP BY
years;
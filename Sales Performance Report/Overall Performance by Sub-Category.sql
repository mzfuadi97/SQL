/* Overall performance DQLab by subcategory product yang akan dibandingkan antara tahun 2011 dan tahun 2012 */
SELECT
    YEAR(order_date) AS years,
    product_sub_category,
    SUM(sales) AS sales
FROM
    dqlab_sales_store
WHERE
    YEAR(order_date) BETWEEN 2011
    AND 2012
    AND order_status LIKE 'Order Finished'
GROUP BY
    years,
    product_sub_category
ORDER BY
    years,
    sales DESC;
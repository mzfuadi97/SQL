USE dqlab1;
/* Total Penjualan dan Revenue pada Quarter-1 (Jan, Feb, Mar) */
SELECT
    SUM(quantity) AS total_penjualan,
    SUM(quantity * priceeach) AS revenue
FROM
    orders_1
WHERE
    status = "Shipped";
/* Total Penjualan dan Revenue pada Quarter-2 (Apr,Mei,Jun) */
SELECT
    SUM(quantity) AS total_penjualan,
    SUM(quantity * priceeach) AS revenue
FROM
    orders_2
WHERE
    status = "Shipped";

    -- Menghitung persentasi keseluruhan penjualan
SELECT
    quarter,
    SUM(quantity) AS total_penjualan,
    SUM(quantity * priceeach) AS revenue
FROM
    (
        SELECT
            orderNumber,
            status,
            quantity,
            priceeach,
            "1" as quarter
        FROM
            orders_1
        UNION
        SELECT
            orderNumber,
            status,
            quantity,
            priceeach,
            "2" as quarter
        FROM
            orders_2
    ) AS tabel_a
WHERE
    status = "Shipped"
GROUP BY
    quarter;

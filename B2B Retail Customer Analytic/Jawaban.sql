Use dqlab1;

-- Apakah jumlah customers xyz.com semakin bertambah?
SELECT
    quarter,
    COUNT(DISTINCT customerID) AS total_customers
FROM
    (
        SELECT
            customerID,
            createDate,
            QUARTER(createDate) AS quarter
        FROM
            customer
        WHERE
            createDate BETWEEN '2004-01-01'
            AND '2004-06-30'
    ) AS tabel_b
GROUP BY
    quarter;

-- Seberapa banyak customers tersebut yang sudah melakukan transaksi?
SELECT
    quarter,
    COUNT(DISTINCT customerID) AS total_customers
FROM
    (
        SELECT
            customerID,
            createDate,
            QUARTER(createDate) AS quarter
        FROM
            customer
        WHERE
            createDate BETWEEN '2004-01-01'
            AND '2004-06-30'
    ) AS tabel_b
WHERE
    customerID IN (
        SELECT
            DISTINCT customerID
        FROM
            orders_1
        UNION
        SELECT
            DISTINCT customerID
        FROM
            orders_2
    )
GROUP BY
    quarter;

-- Seberapa banyak customers yang tetap aktif bertransaksi setelah transaksi pertamanya?
-- Menghitung total unik customers yang transaksi di quarter_1
SELECT
    COUNT(DISTINCT customerID) as total_customers
FROM
    orders_1;

-- output = 25
SELECT
    "1" AS quarter,
    (COUNT(DISTINCT customerID) * 100) / 25 AS Q2
FROM
    orders_1
WHERE
    customerID IN(
        SELECT
            DISTINCT customerID
        FROM
            orders_2
    );
-- Menghitung total unik customers yang transaksi di quarter_2
SELECT COUNT(DISTINCT customerID) as total_customers FROM orders_2;


SELECT
    "1" AS quarter,
    (COUNT(DISTINCT customerID) * 100) / 25 AS Q2
FROM
    orders_2
WHERE
    customerID IN(
        SELECT
            DISTINCT customerID
        FROM
            orders_2
    );
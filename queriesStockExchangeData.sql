SELECT COUNT(index_info.exchange) AS "Number of rows of index info"
FROM index_info;

SELECT COUNT(index_data.id) AS "Number of rows of index data"
FROM index_data;

SELECT d.index_name, i.exchange, d.date, d.open, d.high, d.low, d.close, d.volume, i.currency, i.region
FROM index_data d
INNER JOIN
index_info i ON d.index_name = i.index_name
WHERE d.index_name = 'NYA'  -- wybierz indeks NYA
ORDER BY d.date;  -- sortuj dane chronologicznie

-- Porównanie indeksów
SELECT i1.date AS Date, i1.close AS "Close NYA", i2.close AS "Close IXIC"
FROM index_data i1
JOIN index_data i2 ON i1.date = i2.date
WHERE i1.index_name = 'NYA' AND i2.index_name = 'IXIC';

-- Identyfikacja terndów
SELECT i.index_name, i.date, i.close, 
    AVG(i.close) OVER (ORDER BY i.date) AS MovingAverage
FROM index_data i
WHERE i.index_name = 'NYA';

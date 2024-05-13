-- Displaying the number of rows in a table index_info
SELECT COUNT(index_info.exchange) AS "Number of rows of index info"
FROM index_info;

-- Displaying the number of rows in a table index_data
SELECT COUNT(index_data.id) AS "Number of rows of index data"
FROM index_data;
-- Displays key information about the selected index
SELECT d.index_name, i.exchange, d.date, d.open, d.high, d.low, d.close, d.volume, i.currency, i.region
FROM index_data d
INNER JOIN
index_info i ON d.index_name = i.index_name
WHERE d.index_name = 'NYA'
ORDER BY d.date;

-- Comparison of two indexes
SELECT i1.date AS Date, i1.close AS "Close NYA", i2.close AS "Close IXIC"
FROM index_data i1
JOIN index_data i2 ON i1.date = i2.date
WHERE i1.index_name = 'NYA' AND i2.index_name = 'IXIC';

-- Displaying the moving average for coles
SELECT i.index_name, i.date, i.close, 
    AVG(i.close) OVER (ORDER BY i.date) AS MovingAverage
FROM index_data i
WHERE i.index_name = 'NYA';

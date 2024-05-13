# MySQL and Excel project for visualization of stock exchange data

MySQL database stores information about stock exchange data. File stockExchangeData.xlsx retrieves data directly from the database using ODBC, as well as currency exchange rates directly from the website. The file contains main sheets: MENU - allowing navigation to the relevant section in the report and data refreshment, REPORT - containing data visualization. Sheets storing retrieved data are: index_data, index_info, usd_exchange_rate, and the sheet with data processed for analysis is: data_processed.

link to data: https://www.kaggle.com/datasets/mattiuzc/stock-exchange-data
Website with exchange rates: https://www.x-rates.com/table/?from=USD&amount=1


<p align="center"> <img src="https://github.com/KrystianJamrogiewicz/Excel_MySQL_Stock_Exchange_Data/assets/155767356/1338fd80-9b2b-4c52-91c9-d2f667b9aa8c" alt="Database diagram"> </p>


<p align="center"> <img src="https://github.com/KrystianJamrogiewicz/Excel_MySQL_Stock_Exchange_Data/assets/155767356/360e57ac-67ff-4be2-8864-ded5bde8ef16" alt="Excel MENU">
<img src="https://github.com/KrystianJamrogiewicz/Excel_MySQL_Stock_Exchange_Data/assets/155767356/de9c5c1d-eff1-4a04-a897-376d6ca4698c" alt="Excel raport">
<img src="https://github.com/KrystianJamrogiewicz/Excel_MySQL_Stock_Exchange_Data/assets/155767356/cdf6e25e-34bd-418e-8ae0-4ab4068cc420" alt="Excel raport2 "> </p>


<h3> Sample database queries on queriesStockExchangeData.sql file </h3>
<p>
- Displaying the number of rows in a table index_data
  
    SELECT COUNT(index_data.id) AS "Number of rows of index data"
    FROM index_data;
</p>
<p>
- Displays key information about the selected index
  
    SELECT d.index_name, i.exchange, d.date, d.open, d.high, d.low, d.close, d.volume, i.currency, i.region
    FROM index_data d
    INNER JOIN
      index_info i ON d.index_name = i.index_name
    WHERE d.index_name = 'NYA'
    ORDER BY d.date;
</p>
<p>
- Comparison of two indexes
  
    SELECT i1.date AS Date, i1.close AS "Close NYA", i2.close AS "Close IXIC"
    FROM index_data i1
    JOIN 
      index_data i2 ON i1.date = i2.date
    WHERE i1.index_name = 'NYA' AND i2.index_name = 'IXIC';
</p>
<p>
- Displaying the moving average for close
  
    SELECT i.index_name, i.date, i.close, 
      AVG(i.close) OVER (ORDER BY i.date) AS MovingAverage
    FROM index_data i
    WHERE i.index_name = 'NYA';
</p>






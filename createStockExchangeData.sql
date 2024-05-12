CREATE DATABASE IF NOT EXISTS stock_exchange_data;
USE stock_exchange_data;

CREATE TABLE index_info (
    region VARCHAR(20),
    exchange VARCHAR(70),
	index_name VARCHAR(20) PRIMARY KEY,
    currency VARCHAR(10)
);

CREATE TABLE index_data (
	id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
	index_name VARCHAR(20),
    date DATE,
    open NUMERIC(16,8),
    high NUMERIC(16,8),
    low NUMERIC(16,8),
    close NUMERIC(16,8),
    adj_close NUMERIC(16,8),
    volume NUMERIC(16,5),
    FOREIGN KEY (index_name) REFERENCES index_info(index_name)
);

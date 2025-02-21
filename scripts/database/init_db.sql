-- Create database
CREATE DATABASE IF NOT EXISTS pyrolysis_db;
USE pyrolysis_db;

-- Batch metadata
CREATE TABLE batches (
    batch_id INT AUTO_INCREMENT PRIMARY KEY,
    batch_name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    date_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Samples table
CREATE TABLE samples (
    sample_id VARCHAR(10) PRIMARY KEY,
    batch_id INT,
    collection_date DATE NOT NULL,
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6),
    moisture_pct DECIMAL(4,1) CHECK (moisture_pct BETWEEN 0 AND 100),
    ash_pct DECIMAL(4,1) CHECK (ash_pct BETWEEN 0 AND 100),
    FOREIGN KEY (batch_id) REFERENCES batches(batch_id)
);
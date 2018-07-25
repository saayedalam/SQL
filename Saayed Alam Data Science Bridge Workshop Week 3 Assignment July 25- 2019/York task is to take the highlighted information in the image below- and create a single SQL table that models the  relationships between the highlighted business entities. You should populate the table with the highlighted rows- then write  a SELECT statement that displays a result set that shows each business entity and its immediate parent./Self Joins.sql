/*
Saayed Alam
Data Science Bridge Workshop
Week 3 Assignment
July 25, 2019
*/ 

/* York task is to take the highlighted information in the image below, and create a single SQL table that models the 
relationships between the highlighted business entities. You should populate the table with the highlighted rows, then write 
a SELECT statement that displays a result set that shows each business entity and its immediate parent. */

DROP TABLE IF EXISTS assets;

CREATE TABLE assets
(asset_id INT PRIMARY KEY,
asset_name VARCHAR(30) NOT NULL,
parent_id INT NULL);

INSERT INTO assets 
(asset_id, asset_name, parent_id) 
VALUES 
(1, 'General Electric', NULL),
(2, 'GE Capital', 1),
(3, 'GE Energy Management', 1),
(4, 'GE Oil and Gas', 1),
(5, 'GE Capital Aviation Services', 2),
(6, 'GE Energy Financial Services', 2),
(7, 'GE Power Electronics', 3),
(8, 'GE Power Components', 3);

SELECT 
parent.asset_name AS Parent, 
subsidiary.asset_name AS Subsidiary
FROM assets parent
JOIN assets subsidiary
ON subsidiary.parent_id = parent.asset_id
ORDER BY parent, subsidiary;

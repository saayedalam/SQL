/*
Saayed Alam
Data Science Bridge Workshop
Week 2 Assignment
*/ 

DROP TABLE IF EXISTS tblGroceryList;
DROP TABLE IF EXISTS tblRecipes;
DROP TABLE IF EXISTS tblIngredients;
DROP TABLE IF EXISTS tblCuisine;

#1 Using the MySQL SQL Workbench graphical user interface, create a new database called recipes. All of the work below should be completed in the recipes database.

#2 You should first create two tables, tblCuisine and tblRecipes. Each type of cuisine can have many recipes. Populate the two tables with a few records.
CREATE TABLE tblCuisine
(cuisine_id int PRIMARY KEY,
region varchar(30) NOT NULL);

INSERT INTO tblCuisine
(cuisine_id, region)
VALUES 
(1, 'Bengali'),
(2, 'Indian'),
(3, 'Japanese'),
(4, 'Mexican'),
(5, 'American');

SELECT * 
FROM tblCuisine;

CREATE TABLE tblRecipes
(recipe_id int PRIMARY KEY,
recipe varchar(30) NOT NULL,
cuisine_id int NULL REFERENCES tblCuisine);

INSERT INTO tblRecipes
(recipe_id, recipe, cuisine_id)
VALUES 
(1, 'Kabab', 1),
(2, 'Pizza', 5),
(3, 'Tandoori', 2),
(4, 'Paratha', 2),
(5, 'Biryani', 1),
(6, 'Yakitori', 3),
(7, 'Enchilada', 4),
(8, 'Burger', 5),
(9, 'Tamale', 4),
(10, 'Sushi', 3);

SELECT *
FROM tblRecipes;

#3 Write a JOIN statement that shows the types of cuisines and associated recipes that you entered.
SELECT 
region, 
recipe
FROM tblCuisine c 
INNER JOIN tblRecipes r
ON c.cuisine_id = r.cuisine_id
ORDER BY region, recipe;

#4 You should add a table called tblngredients. There should be a many-to-many relationship between tblIngredients and tblRecipes. To create a many-to-many relationship in SQL, you’ll need a link table, which you should call tblGroceryList. Populate the tables with some appropriate sample information.
CREATE TABLE tblIngredients
(ingredient_id int PRIMARY KEY,
ingredient varchar(30) NOT NULL);

INSERT INTO tblIngredients
(ingredient_id, ingredient) 
VALUES 
(1, 'Beef'),
(2, 'Tomato Sauce'),
(3, 'Snails'),
(4, 'Cabbage'),
(5, 'Penne'),
(6, 'Onions'),
(7, 'White beans'),
(8, 'Duck'),
(9, 'Tomato'),
(10, 'Flour');

SELECT * 
FROM tblIngredients;

CREATE TABLE tblGroceryList
(recipe_id int NOT NULL REFERENCES tblRecipes,
ingredient_id int NOT NULL REFERENCES tblIngredients,
quantity int NOT NULL,
PRIMARY KEY (recipe_id, ingredient_id));

INSERT INTO tblGroceryList
(recipe_id, ingredient_id, quantity)
VALUES 
(4, 6, 2),
(4, 1, 1),
(5, 6, 1),
(5, 4, 3),
(3, 6, 2),
(3, 7, 100),
(3, 8, 2),
(2, 9, 7),
(2, 10, 1);

SELECT * 
FROM tblGroceryList;

SELECT 
recipe,
ingredient,
quantity
FROM tblRecipes r 
INNER JOIN tblGroceryList gl 
ON r.recipe_id = gl.recipe_id
INNER JOIN tblIngredients i 
ON gl.ingredient_id = i.ingredient_id
ORDER BY recipe, ingredient, quantity

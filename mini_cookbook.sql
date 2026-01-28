create database RecipeDB;
use RecipeDB;
CREATE TABLE recipes (
    recipe_id INT AUTO_INCREMENT PRIMARY KEY,
    recipe_name VARCHAR(255) NOT NULL,
    cooking_time_minutes INT,
    cuisine VARCHAR(100)
);

CREATE TABLE ingredients (
    ingredient_id INT AUTO_INCREMENT PRIMARY KEY,
    ingredient_name VARCHAR(255) NOT NULL
);

CREATE TABLE recipe_ingredients (
    recipe_id INT,
    ingredient_id INT,
    quantity VARCHAR(50),
    PRIMARY KEY (recipe_id, ingredient_id),
    FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(ingredient_id)
);

INSERT INTO recipes (recipe_name, cooking_time_minutes, cuisine)
VALUES ('Waffles', 20, 'Breakfast'),
       ('Mac and cheese', 45, 'Italian'),
       ('Quesadillas', 15, 'Mexican');

INSERT INTO ingredients (ingredient_name)
VALUES ('Flour'), ('Eggs'), ('Milk'), ('sugar'), ('butter'), ('Salt'), ('baking powder'),('elbow pasta'),('cheese'),('tortilla');

INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity)
VALUES
(1, 1, '2 cup'),   -- waffles needs Flour
(1, 2, '2'),       -- waffles needs Eggs
(1, 3, '2 cup'),   -- waffles needs Milk
(1, 4, '1/4 cup'),   -- waffles needs sugar
(1, 5, '1/2 cup'),   -- waffles needs butter
(1, 6, '3/4 tsp'),   -- waffles needs salt
(2, 8, '1 box'), -- Mac and cheese needs elbow pasta
(2, 3, '1/2 cup'),   --  Mac and cheese needs milk
(2, 9, '2 cups'),  --  Mac and cheese needs cheese
(2, 5, '1/2 cup'),  --  Mac and cheese needs butter
(2, 6, '3 tsps'), -- Mac and cheese needs Salt
(3, 10, '8'),  --  quesadillas needs tortillas 
(3, 5, '1/2 cup'),  --  quesadillas needs butter 
(3, 9, '3 cup'); --  quesadillas needs cheese

-- list recipes w/ their ingredients 
SELECT r.recipe_name, i.ingredient_name, ri.quantity
FROM recipes r
JOIN recipe_ingredients ri ON r.recipe_id = ri.recipe_id
JOIN ingredients i ON ri.ingredient_id = i.ingredient_id;

-- finds all recipes that uses a specific ingredient
SELECT DISTINCT r.recipe_name
FROM recipes r
JOIN recipe_ingredients ri ON r.recipe_id = ri.recipe_id
JOIN ingredients i ON ri.ingredient_id = i.ingredient_id
WHERE i.ingredient_name = 'salt';

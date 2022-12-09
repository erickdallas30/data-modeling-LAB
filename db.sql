CREATE TABLE users(
  user_id SERIAL PRIMARY KEY,
  email VARCHAR(100),
  password VARCHAR(20),
  nickname VARCHAR(50)
);

CREATE TABLE recipes(
	recipe_id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL REFERENCES users(user_id),
  recipe_name VARCHAR(100),
  ingredients TEXT,
  instructions TEXT,
  recipe_type BOOLEAN  
);

CREATE TABLE ocassions(
	ocassions_id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL REFERENCES users(user_id),
  recipe_id INTEGER NOT NULL REFERENCES recipes(recipe_id),
  ocassions_name VARCHAR(100)
);

CREATE TABLE grocery_list(
	grocery_list_id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL REFERENCES users(user_id),
  grocery_list_name VARCHAR(100),
  grocery_list_ingredients TEXT
);

CREATE TABLE grocery_recipes(
    grocery_id_list INTEGER NOT NULL REFERENCES grocery_list(grocery_list_id),
    recipe_id INTEGER NOT NULL REFERENCES recipes(recipe_id)
);

-- INSERTING DATA IN TABLES

INSERT INTO users(email, password, nickname)
VALUES 
('chanchito@jvs.com', '987456', 'tlaloc'),
('paquito@jvs.com', '987456', 'quetzalcoatl'),
('pepito@jvs.com', '987456', 'Moctezuma'),
('chonita@jvs.com', '987456', 'Chitara'),
('pedrito@jvs.com', '987456', 'MazingerZ'),
('jacknickolson@jvs.com', '987456', 'tlaloc40');

INSERT INTO recipes(recipe_name, ingredients, instructions, recipe_type)
VALUES
('orange chicken', 'chicken, oranges, onions, rice', 'cook the chicken with all ingredientes', 'public'),
('orange duck', 'duck, oranges, onions, rice', 'cook the duck with all ingredientes', 'public'),
('orange rabbit', 'rabbit, oranges, onions, rice', 'cook the rabbit with all ingredientes', 'public'),
('cordon blue chicken', 'chicken, mozarella, onions, rice', 'cook the chicken with all ingredientes', 'public');

INSERT INTO ocassions(user_id, ocassions_name)
VALUES
('1', 'Birthday Party'),
('2', 'Thanksgiving Dinner'),
('3', 'Christmas Dinner'),
('4', 'Bachelor party')
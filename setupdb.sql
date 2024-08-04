DROP DATABASE pickypicker;
CREATE DATABASE pickypicker;

ALTER DATABASE pickypicker OWNER TO postgres;

\connect pickypicker;

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    email VARCHAR(254) NOT NULL,
    password VARCHAR(60) NOT NULL
);

INSERT INTO users(first_name,last_name,email,password)
VALUES 
('Sydney','Nadeau','sydnadeau00@gmail.com','Password'),
('Jack','Hengen','jackhengen@gmail.com','Password')
;

CREATE TABLE address (
    address_id SERIAL PRIMARY KEY,
    address VARCHAR(50) NOT NULL,
    address2 VARCHAR(50),
    district VARCHAR(50),
    city VARCHAR(50),
    postal_code VARCHAR(10) NOT NULL,
    phone VARCHAR(20)
);

-- New addresses, make sure the order of the addresses match those of the restaurants, I.E. the first restaurant in the restaurant table has the address of the first address in the address table, the second matches with the second and so on
INSERT INTO address(address,district,city,postal_code,phone)
VALUES
('215 Court Street','NY','Brooklyn','11201','718-222-3484'),
('260 Court Street','NY','Brooklyn','11201','718-488-8695'),
('508 Henry Street','NY','Brooklyn','11231','718-260-9095')
;


CREATE TABLE restaurant (
    restaurant_id SERIAL PRIMARY KEY,
    restaurant_name VARCHAR(100) NOT NULL,
    address_id INTEGER REFERENCES address(address_id)
);

-- New restaurants
INSERT INTO restaurant(restaurant_name) 
VALUES 
('Joya'),
('Buddy''s Burrito & Taco Bar'), -- and extra single quote "escapes" the first single quote, therefore writing a single single quote as text instead of ending the string
('Ling Ling Kitchen')
;

-- Linking Restaurants and addresses
-- In order for this to work, the restaurants and addresses need to have the same id, therefore they need to be insert into their respective tables in the same order
UPDATE restaurant SET address_id = restaurant_id;


CREATE TABLE food (
    food_id SERIAL PRIMARY KEY,
    food_name VARCHAR(50) NOT NULL
);

-- New food dishes, not variations, not flavors, not 'with cheese' or 'side of fries'
INSERT INTO food(food_name)
VALUES
('Burger'),
('Chicken Wings'),
('Sandwich'),
('French Fries'),
('Burrito'),
('Taco'),
('Toastado'),
('Fajita'),
('Chimichanga'),
('Tortilla Chips'),
('Nachos'),
('Burrito Bowl'),
('Veggie Bowl'),
('Torta'),
('Quesadilla'),
('Chili'),
('Southwestern Salad'),
('Caesar Salad'),
('Churros'),
('Paletas')
;

CREATE TABLE restaurant_food (
    restaurant_id INTEGER REFERENCES restaurant(restaurant_id),
    food_id INTEGER REFERENCES food(food_id),
    flavors VARCHAR(50) [],
    toppings VARCHAR(50) [],
    PRIMARY KEY (restaurant_id, food_id)
);

-- We select the food_id from the food table given the array of dishes we specify (the dishes of the restaurant)
-- If the food table doesn't have the dish there will be no entry to find a food id and this wont work
-- We also select the restaurant id given the name of the restaurant we want to add to's menu
-- We pair each unique food item in the menus id with the single restaurant_id whose menu we are adding to, and add each of those pairs to a row in the restaurant_food table
INSERT INTO restaurant_food (food_id, restaurant_id)
SELECT food_id, restaurant_id
FROM food JOIN restaurant r ON r.restaurant_name = 'Buddy''s Burrito & Taco Bar'
WHERE food_name IN (
    'Burger',
    'Chicken Wings',
    'Sandwich',
    'French Fries',
    'Burrito',
    'Taco',
    'Toastado',
    'Fajita',
    'Chimichanga',
    'Tortilla Chips',
    'Nachos',
    'Burrito Bowl',
    'Veggie Bowl',
    'Torta',
    'Quesadilla',
    'Chili',
    'Southwestern Salad',
    'Caesar Salad',
    'Churros',
    'Paletas'
);

CREATE TABLE user_food (
    user_id INTEGER REFERENCES users(user_id),
    food_id INTEGER REFERENCES food(food_id),
    PRIMARY KEY (user_id, food_id)
);

-- Updating a users "go-tos"
INSERT INTO user_food(food_id, user_id)
SELECT food_id, user_id
FROM food JOIN users u ON u.first_name = 'Sydney' AND u.last_name = 'Nadeau'
WHERE food_name IN(
    'Burrito',
    'French Fries'
);
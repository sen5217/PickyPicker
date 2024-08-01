CREATE DATABASE pickypicker;

ALTER DATABASE pickypicker OWNER TO postgres;

\connect pickypicker;

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    email VARCHAR(254) NOT NULL
);

CREATE TABLE address (
    address_id SERIAL PRIMARY KEY,
    address VARCHAR(50) NOT NULL,
    address2 VARCHAR(50),
    district VARCHAR(50),
    city VARCHAR(50),
    postal_code VARCHAR(10) NOT NULL,
    phone VARCHAR(20)
);

CREATE TABLE restaurant (
    restaurant_id SERIAL PRIMARY KEY,
    restaurant_name VARCHAR(100) NOT NULL,
    restaurant_address VARCHAR(100),
    address_id INTEGER REFERENCES address(address_id)
);

CREATE TABLE food (
    food_id SERIAL PRIMARY KEY,
    food_name VARCHAR(50) NOT NULL
);

CREATE TABLE restaurant_food (
    restaurant_id INTEGER REFERENCES restaurant(restaurant_id),
    food_id INTEGER REFERENCES food(food_id),
    PRIMARY KEY (restaurant_id, food_id)
);

CREATE TABLE user_food (
    user_id INTEGER REFERENCES users(user_id),
    food_id INTEGER REFERENCES food(food_id),
    PRIMARY KEY (user_id, food_id)
);

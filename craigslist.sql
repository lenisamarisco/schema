DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    text TEXT NOT NULL,
    location TEXT NOT NULL,
    user_id INT NOT NULL,
    region_id INT NOT NULL,
    category_id INT NOT NULL
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    encrypted_password VARCHAR(255) NOT NULL,
    preferred_region_id INT NOT NULL
);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

INSERT INTO regions (id, name)
VALUES
    ('1', 'Florida'),
    ('2', 'North Carolina'),
    ('3', 'New York'),
    ('4', 'Georgia');

INSERT INTO posts (id, title, text, location, 
user_id, region_id, category_id)
VALUES
    (
     '1', 'Floridays', 'beautiful house to accommodate up to 8 people',
        'Kissimmee', '1', '1', '1'),
    ('1', 'home conf', 'apartment to accommodate up to 4 people',
    'Kissimmee', '2', '2', '3'),
    ('2', 'Ballantine', 'comfortable apartment to accommodate up to 6 people',
    'Ballantine Providence', '2', '2', '1'),
    ('2', 'Providence Days', 'Townhouse to accommodate up to 8 people',
    'Providence Road','3', '2', '3'),
    ('3', 'Central Park', 'apartment to accommodate up to 6 people',
    'Fifth Ave', '4', '2', '3'),
    ('3', 'Broadway Days', 'Comfy studio to accommodate up to 3 people',
    'Third Ave','5', '2', '4'),
    ('4', 'beautiful Savannah', ' Beautiful House in front of the river to accommodate up to 8 people',
    'Front River Ave', '6', '1', '2'),
    ('4', 'Savannah Inn', 'Cozy townhouse in downtown, in front of the old Museum', 
    'Fourth Avenue', '7', '2', '4'
    );
INSERT INTO users (id, username, encrypted_password, preferred_region_id)
VALUES (
 '1', 'johndone', 'hashed_password_1', '3'
 );

 INSERT INTO categories (id, name)
 VALUES (
    '8', 'super Luxury'
 );
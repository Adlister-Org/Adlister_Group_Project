DROP DATABASE  IF EXISTS adlister_db;
CREATE DATABASE IF NOT EXISTS adlister_db;

USE adlister_db;

DROP TABLE IF EXISTS ads;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(240) NOT NULL,
    email VARCHAR(240) NOT NULL,
    password VARCHAR(255) NOT NULL,
    image VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE ads (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    title VARCHAR(240) NOT NULL,
    description TEXT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS categories;


CREATE TABLE categories (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS ads_categories;
CREATE  TABLE ads_categories (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    ad_id INT UNSIGNED NOT NULL,
    category_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (ad_id) REFERENCES ads(id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

DELETE FROM ads_categories WHERE ad_id = 16;

INSERT INTO categories(title) VALUES ('Other');
INSERT INTO categories(title) VALUES ('Cleaning');
INSERT INTO categories(title) VALUES ('Plumbing');
INSERT INTO categories(title) VALUES ('Handyman');
INSERT INTO categories(title) VALUES ('IT');

select * from ads join ads_categories ac on ads.id = ac.ad_id;

select * from users;

select image from users;

select * from ads;

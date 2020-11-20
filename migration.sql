
CREATE DATABASE IF NOT EXISTS adlister_db;

USE adlister_db;

-- DROP TABLE IF EXISTS ads;
-- DROP TABLE IF EXISTS users;
--
-- CREATE TABLE users (
--     id INT UNSIGNED NOT NULL AUTO_INCREMENT,
--     username VARCHAR(240) NOT NULL,
--     email VARCHAR(240) NOT NULL,
--     password VARCHAR(255) NOT NULL,
--     PRIMARY KEY (id)
-- );
--
-- CREATE TABLE ads (
--     id INT UNSIGNED NOT NULL AUTO_INCREMENT,
--     user_id INT UNSIGNED NOT NULL,
--     title VARCHAR(240) NOT NULL,
--     description TEXT NOT NULL,
--     PRIMARY KEY (id),
--     FOREIGN KEY (user_id) REFERENCES users(id)
--         ON DELETE CASCADE
-- );


CREATE TABLE categories (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

DROP TABLE categories;
DROP TABLE ads_categories;
CREATE  TABLE ads_categories (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    ad_id INT UNSIGNED NOT NULL,
    category_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (ad_id) REFERENCES ads(id),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

INSERT INTO categories(title) VALUES ('Cleaning');
INSERT INTO categories(title) VALUES ('Plumbing');
INSERT INTO categories(title) VALUES ('Handyman');
INSERT INTO categories(title) VALUES ('IT');




-- select * from users;
-- select * from categories where id = 4;
-- select * from categories join ad_category on categories.id = ad_category

-- UPDATE ads SET title = 'edit-sdfdfs', description = 'edit-fkjgbkfj' WHERE id = 4;

show tables;

desc ads;


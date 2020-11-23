DROP DATABASE  IF EXISTS adlister_db;
CREATE DATABASE IF NOT EXISTS adlister_db;

USE adlister_db;


DROP TABLE IF EXISTS users;
CREATE TABLE users (
        id INT UNSIGNED NOT NULL AUTO_INCREMENT,
        username VARCHAR(240) NOT NULL,
        email VARCHAR(240) NOT NULL,
        password VARCHAR(255) NOT NULL,
        image VARCHAR(255) NOT NULL,
         PRIMARY KEY (id)
);
DROP TABLE IF EXISTS ads;
CREATE TABLE ads (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    title VARCHAR(240) NOT NULL,
    description TEXT NOT NULL,
    img_url TEXT NOT NULL,
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



INSERT INTO categories(title) VALUES ('Cleaning');
INSERT INTO categories(title) VALUES ('Design');
INSERT INTO categories(title) VALUES ('Education');
INSERT INTO categories(title) VALUES ('Handyman');
INSERT INTO categories(title) VALUES ('IT');
INSERT INTO categories(title) VALUES ('Music');
INSERT INTO categories(title) VALUES ('Plumbing');
INSERT INTO categories(title) VALUES ('Other');

INSERT INTO users(username, email, password, image) VALUE ('Jason', 'jason@gmail.com', '123', 'https://movies-b26f.kxcdn.com/wp-content/uploads/2015/02/Jason-1024x1024.jpg');
INSERT INTO users(username, email, password, image) VALUE ('Cruz', 'cruz@gmail.com', '123', 'https://i2.wp.com/thegameofnerds.com/wp-content/uploads/2017/08/6-11.png?resize=852%2C473&ssl=1');
INSERT INTO users(username, email, password, image) VALUE ('Sahara', 'sahara@gmail.com', '123', 'https://i.pinimg.com/564x/9e/70/de/9e70def0f8a77f396af237b5377bda8a.jpg');
INSERT INTO users(username, email, password, image) VALUE ('Michael', 'michael@gmail.com', '123', 'https://files.slack.com/files-pri/T029BRGN0-F01FCJMPTNE/image.png');
INSERT INTO users(username, email, password, image) VALUE ('Austin', 'austin@gmail.com', '123', 'https://avatarfiles.alphacoders.com/192/192706.jpg');


# Jason
INSERT INTO ads(user_id, title, description, img_url) VALUES (1, 'Machete Sharpener', 'Need help sharpening my machete, will pay with shoutout on my instagram','https://www.bladehq.com/images/Knife%20Academy/Knife-Maintenance/How-to-Sharpen-a-Machete/5.jpg');
INSERT INTO ads(user_id, title, description, img_url) VALUES (1, 'Camp Counselors','Need immediate help, the previous counselors had to go','https://images-na.ssl-images-amazon.com/images/I/819AVeLuG9L._AC_SL1500_.jpg');
INSERT INTO ads(user_id, title, description, img_url) VALUES (1, 'Hockey Mask Repair','Need someone to repair my hockey mask','https://c1.neweggimages.com/ProductImage/A31T_130267977714752620mnbUHCIMfo.jpg');

# Cruz
INSERT INTO ads(user_id, title, description, img_url) VALUES (2, 'Surgeon','Need someone to mend me','https://st2.depositphotos.com/3889193/8319/i/600/depositphotos_83197346-stock-photo-medical-team.jpg');
INSERT INTO ads(user_id, title, description, img_url) VALUES (2, 'Homework Do-er','Need someone to do my homework (U.S. History)','https://images.theconversation.com/files/93575/original/image-20150901-13422-1053vm9.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=496&fit=clip');
INSERT INTO ads(user_id, title, description, img_url) VALUES (2, 'Gutter Cleaning','Need some to clean my gutters','https://static.wixstatic.com/media/0011736e9add475ba0b2cda114dc92f8.jpg/v1/crop/x_312,y_0,w_4992,h_3744/fill/w_551,h_413,al_c,q_80,usm_0.66_1.00_0.01/0011736e9add475ba0b2cda114dc92f8.webp');
INSERT INTO ads(user_id, title, description, img_url) VALUES (2, 'Walk my dog','Need someone to walk my dog','https://i.ibb.co/XjBKjvF/ezgif-com-gif-maker.gif');
INSERT INTO ads(user_id, title, description, img_url) VALUES (2, 'Feed my chickens','Need someone to feed my chickens','https://assets.2ser.com/wp-content/uploads/2017/07/11024531/chicken-011.jpg');

# Sahara
INSERT INTO ads(user_id, title, description, img_url)
VALUES (3, 'Private Investigator', 'Very discreet and professional. Stakeouts and data collecting are just few of the services I offer','https://grandslaminvestigations.com/wp-content/uploads/2018/03/private-investigator-myths.png'),
       (3, 'Guitar lesson', 'Intermediate-level guitar lesson for 1 hour.', 'https://i.pinimg.com/564x/3a/76/99/3a76992a920d5fd2384855d6824b787a.jpg'),
       (3, 'Baby Sitter', 'I am great with kids from ages 0 - 8, available on weekends', 'https://cdn.kinsights.com/cache/fb/2e/fb2e704046a36ff2cfb93f490df08037.jpg'),
       (3, 'Voice-actor', 'Great voicing for musicals and infomercials', 'https://elearningindustry.com/wp-content/uploads/2020/06/hiring-a-voice-actor-for-elearning-explainer-videos.jpg');

# Michael
INSERT INTO ads(user_id, title, description, img_url) VALUE (4, 'Tree House Builder','Need someone to build the Tree House of MY Dreams!','https://i.pinimg.com/originals/92/52/b8/9252b8c36f2e50c041cae3b3d18968e9.jpg');
INSERT INTO ads(user_id, title, description, img_url) VALUE (4, 'Culinary Teacher','I Need someone to teach me to cook for the fam','https://cdn.vox-cdn.com/thumbor/cB2R1GdApfvjsMiMoJzJfA4SM_c=/1400x1050/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/19858467/EatHome_Lede_CookbooksBeginners.jpg');
INSERT INTO ads(user_id, title, description, img_url) VALUE (4, 'Fast Talker','I need someone to read me stories super fast','https://media.tenor.com/images/d23d7e04a1bdf480d20bb52e83bf6471/tenor.gif');

# Austin
INSERT INTO ads(user_id, title, description, img_url) VALUES (5, 'Architect','Lead and develop projects from early concept through design development','https://d31u95r9ywbjex.cloudfront.net/sites/default/files/styles/width_320/public/iStock_000003701635XSmall.jpg?itok=hEZyhjgZ');
INSERT INTO ads(user_id, title, description, img_url) VALUE (5, 'Petroleum - Geologist','Study and examine variation in rock formations and mineral samples to identify new gas and oil deposits.','https://www.environmentalscience.org/wp-content/uploads/2017/02/Petroleum-Geologist-300x200.jpeg');


# Jason
INSERT INTO ads_categories(ad_id, category_id) VALUES (1, 1);
INSERT INTO ads_categories(ad_id, category_id) VALUES (1, 4);
INSERT INTO ads_categories(ad_id, category_id) VALUES (2, 1);
INSERT INTO ads_categories(ad_id, category_id) VALUES (2, 3);
INSERT INTO ads_categories(ad_id, category_id) VALUES (2, 8);
INSERT INTO ads_categories(ad_id, category_id) VALUES (3, 1);
INSERT INTO ads_categories(ad_id, category_id) VALUES (3, 4);

# Cruz
INSERT INTO ads_categories(ad_id, category_id) VALUES (4, 4);
INSERT INTO ads_categories(ad_id, category_id) VALUES (4, 8);
INSERT INTO ads_categories(ad_id, category_id) VALUES (5, 3);
INSERT INTO ads_categories(ad_id, category_id) VALUES (6, 4);
INSERT INTO ads_categories(ad_id, category_id) VALUES (6, 1);
INSERT INTO ads_categories(ad_id, category_id) VALUES (7, 8);
INSERT INTO ads_categories(ad_id, category_id) VALUES (8, 4);
INSERT INTO ads_categories(ad_id, category_id) VALUES (8, 8);

# Sahara
INSERT INTO ads_categories(ad_id, category_id) VALUES(9, 6), (9, 8);
INSERT INTO ads_categories(ad_id, category_id) VALUES(10, 6), (10, 3), (10, 3);
INSERT INTO ads_categories(ad_id, category_id) VALUES(11, 8),(11,1);
INSERT INTO ads_categories(ad_id, category_id) VALUES(12, 8), (12, 6);

# Michael
INSERT INTO ads_categories(ad_id, category_id) VALUES (13,8);
INSERT INTO ads_categories(ad_id, category_id) VALUES (14,4);
INSERT INTO ads_categories(ad_id, category_id) VALUES (15,8);

#Austin
INSERT INTO ads_categories(ad_id, category_id) VALUES (16,2);
INSERT INTO ads_categories(ad_id, category_id) VALUES (16,8);
INSERT INTO ads_categories(ad_id, category_id) VALUES (17,8);
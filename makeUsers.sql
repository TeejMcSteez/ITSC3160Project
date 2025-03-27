
-- Commented out database stuff if its already made.
-- CREATE database OAuthSystem;

-- DROP DATABASE IF EXISTS OAuthSystem;

USE OAuthSystem;

CREATE TABLE IF NOT EXISTS USERS (
    CLIENT_ID VARCHAR(255) PRIMARY KEY,
    ACCESS_TOKEN VARCHAR(255) NOT NULL,
    ROLE TEXT NOT NULL,
    EXPIRY TIMESTAMP NOT NULL,
    CREATED_AT TIMESTAMP DEFAULT NOW() NOT NULL, -- Default value for created timestamp is set to the current time

    ADMIN_ID INT NOT NULL, -- Foreign key to the ADMIN table
    FOREIGN KEY (ADMIN_ID) REFERENCES ADMIN(ID) ON DELETE CASCADE -- If the admin id is deleted then so will the client id.
);

/* With this setup users will remain logged in for one day and mods for one week*/
INSERT INTO USERS VALUES ("User1", "supersecrettoken1", "USER", TIMESTAMP(NOW() + INTERVAL 24 HOUR), NOW(), 1); -- Added created_at value to insert
INSERT INTO USERS VALUES ("Bill Gates", "supersecrettoken2", "PREMIUM_USER", TIMESTAMP(NOW() + INTERVAL 24 HOUR), NOW(), 2); -- Added created_at value to insert
INSERT INTO USERS VALUES ("Linus Torvald", "supersecrettoken3", "MODERATOR", TIMESTAMP(NOW() + INTERVAL 7 DAY), NOW(), 3); -- Added created_at value to insert

SELECT * FROM USERS;

/* Sample queries to test the table*/ 
-- switched from client id to admin id 
SELECT * FROM USERS WHERE ADMIN_ID = 1;
SELECT * FROM USERS WHERE ADMIN_ID = 2;
SELECT * FROM USERS WHERE ADMIN_ID = 3;

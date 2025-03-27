
CREATE database OAuthSystem;

DROP DATABASE IF EXISTS OAuthSystem;

USE OAuthSystem;

CREATE TABLE USERS IF NOT EXISTS (
    CLIENT_ID VARCHAR(255) PRIMARY KEY,
    ACCESS_TOKEN VARCHAR(255) NOT NULL,
    ROLE TEXT NOT NULL,
    EXPIRY TIMESTAMP NOT NULL,
    CREATED_AT TIMESTAMP DEFAULT NOW() NOT NULL, -- Default value for created timestamp is set to the current time

    ADMIN_ID INT NOT NULL, -- Foreign key to the ADMIN table
    FOREIGN KEY (ADMIN_ID) REFERENCES ADMIN(ID) ON DELETE CASCADE, -- If the admin id is deleted then so will the client id.
);

/* With this setup users will remain logged in for one day and mods for one week*/
INSERT INTO USERS VALUES ("User1", "supersecrettoken1", "USER", TIMESTAMP(NOW(), INTERVAL 24 HOUR),1);
INSERT INTO USERS VALUES ("Bill Gates", "supersecrettoken2", "PREMIUM_USER", TIMESTAMP(NOW(), INTERVAL 24 HOUR),2);
INSERT INTO USERS VALUES ("Linus Torvald", "supersecrettoken3", "MODERATOR", TIMESTAMP(NOW(), INTERVAL 7 DAY),3);

SELECT * FROM USERS;

/* Sample queries to test the table*/ 
-- switched from client id to admin id 
SELECT * FROM USERS WHERE ADMIN_ID = 1;
SELECT * FROM USERS WHERE ADMIN_ID = 2;
SELECT * FROM USERS WHERE ADMIN_ID = 3;

-- Commented out to avoid errors at all if already made
-- CREATE database OAuthSystem;            -- Switched the place of the IF EXISTS and CREATE statements to avoid errors if the database already exists. (For both tables)

-- DROP DATABASE IF EXISTS OAuthSystem;

USE OAuthSystem;

CREATE TABLE IF NOT EXISTS ADMIN  (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ENTITY_ID VARCHAR(255) NOT NULL UNIQUE,
    MASTER_TOKEN VARCHAR(255) NOT NULL UNIQUE
);

INSERT INTO ADMIN VALUES (1, "Entity1", "supersecrettoken1");
INSERT INTO ADMIN VALUES (2, "Entity2", "supersecrettoken2");
INSERT INTO ADMIN VALUES (3, "Entity3", "supersecrettoken3");

SELECT * FROM ADMIN;

/*  Sample queries to test the table */
SELECT * FROM ADMIN WHERE ID = 1;
SELECT * FROM ADMIN WHERE ID = 2;
SELECT * FROM ADMIN WHERE ID = 3;
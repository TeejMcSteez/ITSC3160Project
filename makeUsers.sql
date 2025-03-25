CREATE TABLE USERS IF NOT EXISTS (
    CLIENT_ID VARCHAR(255) PRIMARY KEY AUTO_INCREMENT,
    ACCESS_TOKEN VARCHAR(255) NOT NULL,
    ROLE TEXT NOT NULL,
    EXPIRY TIMESTAMP NOT NULL, /*
                        Not sure if we
    want to use timestamp or just the time in x reading as a number
                Read below for more info about the issue.
    */

    /*
    Currently timestamp can be accessed like this:
    SELECT EXPIRY FROM USERS WHERE TIMESTAMP(NOW()) > EXPIRY;

    This will return all the rows where the expiry time has passed.

    timestamp takes two arguments

    (YYYY-MM-DD)
    and
    (HR:MIN:SEC)

    so to set the expiry time to 1 hour from now, you can do this:
    INSERT INTO USERS VALUES (1, "supersecrettoken1", "USER", TIMESTAMP(NOW(), INTERVAL 1 HOUR));

    However this method has technical debt as you have to learn the timestamp
    syntax and it is not as readable as just using a number. But more flexible.
    */
    FOREIGN KEY (CLIENT_ID) REFERENCES ADMIN(MASTER_TOKEN),
);

/* With this setup users will remain logged in for one day and mods for one week*/
INSERT INTO USERS VALUES ("User1", "supersecrettoken1", "USER", TIMESTAMP(NOW(), INTERVAL 24 HOUR));
INSERT INTO USERS VALUES ("Bill Gates", "supersecrettoken2", "PREMIUM_USER", TIMESTAMP(NOW(), INTERVAL 24 HOUR));
INSERT INTO USERS VALUES ("Linus Torvald", "supersecrettoken3", "MODERATOR", TIMESTAMP(NOW(), INTERVAL 7 DAY));
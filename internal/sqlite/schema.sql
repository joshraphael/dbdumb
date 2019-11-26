PRAGMA foreign_keys = ON;

CREATE TABLE user (
    id          INTEGER NOT NULL CHECK(TYPEOF(id) = 'integer')          PRIMARY KEY AUTOINCREMENT,
    user_name   TEXT    NOT NULL CHECK(TYPEOF(user_name) = 'text'),
    first_name  TEXT    NOT NULL CHECK(TYPEOF(first_name) = 'text'),
    last_name   TEXT    NOT NULL CHECK(TYPEOF(last_name) = 'text'),
    UNIQUE(user_name COLLATE NOCASE)
);

INSERT INTO user (user_name, first_name, last_name) VALUES(LOWER("Admin"), "ADMIN", "ADMIN");
INSERT INTO user (user_name, first_name, last_name) VALUES(LOWER("test"), "TEST", "TEST");
DROP DATABASE IF EXISTS redirpydb;

CREATE DATABASE redirpydb
	CHARACTER SET utf8mb4
    COLLATE utf8mb4_general_ci;

USE redirpydb;

CREATE TABLE redir (
    id INT PRIMARY KEY AUTO_INCREMENT,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    name VARCHAR(127) NOT NULL,
    link TEXT NOT NULL,
    short VARCHAR(127) NOT NULL,
    expire DATETIME DEFAULT NULL,
    views INT DEFAULT '0'
);

DELIMITER //

CREATE TRIGGER set_expire_before_insert
BEFORE INSERT ON redir
FOR EACH ROW
BEGIN
    SET NEW.expire = DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 1 YEAR);
END;

//

DELIMITER ;






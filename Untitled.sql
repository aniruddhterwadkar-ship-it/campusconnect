CREATE DATABASE IF NOT EXISTS campusconnect_db;
use campusconnect_db;

SELECT DATABASE();

CREATE TABLE IF NOT EXISTS users(
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    emial VARCHAR(150) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('student','admin','organizer')
    NOT NULL DEFAULT 'student',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP



);



CREATE TABLE IF NOT EXISTS clubs(
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    created_by BIGINT UNSIGNED NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (created_by) REFERENCES users(id)

);



CREATE TABLE if NOT EXISTS club_members(
user_id BIGINT UNSIGNED NOT NULL,
club_id BIGINT UNSIGNED NOT NULL,
joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

PRIMARY KEY(user_id,club_id),
FOREIGN KEY (user_id) REFERENCES users(id),
FOREIGN KEY (club_id) REFERENCES clubs(id)


);



CREATE TABLE IF NOT EXISTS events (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    club_id BIGINT UNSIGNED NOT NULL,
    created_by BIGINT UNSIGNED NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    location VARCHAR(200),
    starts_at DATETIME NOT NULL,
    ends_at DATETIME NOT NULL,
    capacity INT UNSIGNED,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (club_id) REFERENCES clubs(id),
    FOREIGN KEY (created_by) REFERENCES users(id)
);




CREATE TABLE IF NOT EXISTS event_registrations (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,
    event_id BIGINT UNSIGNED NOT NULL,
    registered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    UNIQUE (user_id, event_id),

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (event_id) REFERENCES events(id)
);

SHOW TABLES;
DESCRIBE users;
DESCRIBE clubs;
DESCRIBE club_members;
DESCRIBE events;
DESCRIBE event_registrations;












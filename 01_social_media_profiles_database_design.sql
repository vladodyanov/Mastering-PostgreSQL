CREATE TABLE accounts (
    id SERIAL PRIMARY KEY,
    username VARCHAR(30) NOT NULL UNIQUE,
    password VARCHAR(30) NOT NULL,
    email VARCHAR(50) NOT NULL,
    gender CHAR(1) CHECK (gender IN ('M', 'F')) NOT NULL,
    age INTEGER NOT NULL,
    job_title VARCHAR(40) NOT NULL,
    ip VARCHAR(30) NOT NULL
);

CREATE TABLE addresses (
    id SERIAL PRIMARY KEY,
    street VARCHAR(30) NOT NULL,
    town VARCHAR(30) NOT NULL,
    country VARCHAR(30) NOT NULL,
    account_id INTEGER NOT NULL,
    FOREIGN KEY (account_id) REFERENCES accounts(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE photos (
    id SERIAL PRIMARY KEY,
    description TEXT,
    capture_date TIMESTAMP NOT NULL,
    views INTEGER DEFAULT 0 CHECK (views >= 0) NOT NULL
);

CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    content VARCHAR(255) NOT NULL,
    published_on TIMESTAMP NOT NULL,
    photo_id INTEGER NOT NULL,
    FOREIGN KEY (photo_id) REFERENCES photos(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE accounts_photos (
    account_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    PRIMARY KEY (account_id, photo_id),
    FOREIGN KEY (account_id) REFERENCES accounts(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (photo_id) REFERENCES photos(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE likes (
    id SERIAL PRIMARY KEY,
    photo_id INTEGER NOT NULL,
    account_id INTEGER NOT NULL,
    FOREIGN KEY (photo_id) REFERENCES photos(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (account_id) REFERENCES accounts(id) ON UPDATE CASCADE ON DELETE CASCADE
);
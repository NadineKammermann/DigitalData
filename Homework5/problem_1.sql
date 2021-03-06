DROP DATABASE IF EXISTS problem_1;
CREATE DATABASE problem_1;
USE problem_1;
CREATE TABLE books (
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL,
	author VARCHAR(50) NOT NULL,
	signature VARCHAR(10) NOT NULL
);

CREATE TABLE people (
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL,
	librarypin VARCHAR(10) NOT NULL
);

CREATE TABLE lent_books (
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	lent_to INTEGER NOT NULL,
	book INTEGER NOT NULL,
	return_date DATE NOT NULL,
	FOREIGN KEY (lent_to) REFERENCES people(id),
	FOREIGN KEY (book) REFERENCES books(id)
);


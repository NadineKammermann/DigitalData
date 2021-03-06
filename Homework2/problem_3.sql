DROP DATABASE IF EXISTS problem_3;
CREATE DATABASE problem_3;
USE problem_3;
CREATE TABLE pieces_of_music (
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(100) NOT NULL,
	date DATE NOT NULL,
	place VARCHAR(50) NOT NULL
);

CREATE TABLE people (
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL
);

CREATE TABLE reviews (
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	piece_of_music INTEGER NOT NULL,
	title VARCHAR(100) NOT NULL,
	author INTEGER NOT NULL,
	FOREIGN KEY (piece_of_music) REFERENCES pieces_of_music(id),
	FOREIGN KEY (author) REFERENCES people(id)
);

CREATE TABLE performers (
	title INTEGER NOT NULL,
	name INTEGER NOT NULL,
	FOREIGN KEY (title) REFERENCES pieces_of_music(id),
	FOREIGN KEY (name) REFERENCES people(id)
);


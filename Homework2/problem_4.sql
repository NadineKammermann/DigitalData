DROP DATABASE IF EXISTS problem_4;
CREATE DATABASE problem_4;
USE problem_4;
CREATE TABLE submitted_articles (
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(200) NOT NULL,
	publication BOOLEAN NOT NULL,
	issue DATE
);

CREATE TABLE people (
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(100) NOT NULL
);

CREATE TABLE authors (
	article INTEGER NOT NULL,
	person INTEGER NOT NULL,
	FOREIGN KEY (article) REFERENCES submitted_articles(id),
	FOREIGN KEY (person) REFERENCES people(id)
);

CREATE TABLE reviews (
	author INTEGER NOT NULL,
	article INTEGER NOT NULL,
	FOREIGN KEY (author) REFERENCES people(id),
	FOREIGN KEY (article) REFERENCES submitted_articles(id)
);


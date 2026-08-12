
DROP DATABASE IF EXISTS facultate;
CREATE DATABASE facultate;
CREATE TABLE facultate.student(
	idstudent INT PRIMARY KEY AUTO_INCREMENT,
    nume VARCHAR(255) NOT NULL,
    prenume VARCHAR(255) NOT NULL,
    grupa ENUM('I', 'II', 'III', 'IV'),
    email VARCHAR(60) UNIQUE,
    data_inscrierii DATETIME DEFAULT CURRENT_TIMESTAMP,
    statut ENUM('admis', 'respins', 'neevaluat') DEFAULT 'neevaluat',
    UNIQUE(nume, prenume)
);

INSERT INTO facultate.student SET nume = 'Andreescu', prenume = 'Andrei';
INSERT INTO facultate.student SET nume = 'Andreescu', prenume = 'Andreea';
INSERT INTO facultate.student SET nume = 'Ionescu', prenume = 'Andrei';

SELECT * FROM facultate.student;
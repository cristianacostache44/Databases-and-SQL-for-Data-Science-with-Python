
USE scoala;
CREATE TABLE teme (titlu VARCHAR(100), descriere VARCHAR(200));
SELECT * FROM teme;

# pentru a vedea o singura coloana

SELECT titlu FROM teme;

# pentru a insera valori in tabel

INSERT INTO teme VALUES("SQL", "Comenzile cele mai intalnite");
INSERT INTO teme SET titlu = "Python", descriere = "Primitive";
INSERT INTO teme SET titlu = "Html";

CREATE TABLE teme_cu_pk (id INT PRIMARY KEY AUTO_INCREMENT, titlu VARCHAR(100), descriere VARCHAR(200));
INSERT INTO teme_cu_pk VALUES(1, "SQL", "Comenzile cele mai intalnite");
INSERT INTO teme_cu_pk SET titlu = "Python", descriere = "Primitive";
INSERT INTO teme_cu_pk SET titlu = "Html";

SELECT * FROM teme_cu_pk;
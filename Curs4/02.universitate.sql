-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema universitate
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema universitate
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `universitate` DEFAULT CHARACTER SET utf8 ;
USE `universitate` ;

-- -----------------------------------------------------
-- Table `universitate`.`profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universitate`.`profesor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nume` VARCHAR(45) NOT NULL,
  `prenume` VARCHAR(45) NOT NULL,
  `adresa` VARCHAR(45) NULL,
  `data_nasterii` VARCHAR(45) NULL,
  `grad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nume_UNIQUE` (`nume` ASC) VISIBLE,
  UNIQUE INDEX `table1col_UNIQUE` (`prenume` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `universitate`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universitate`.`student` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nume` VARCHAR(45) NOT NULL,
  `prenume` VARCHAR(45) NOT NULL,
  `gen` ENUM('feminin', 'masculin') NOT NULL,
  `an` VARCHAR(45) NOT NULL,
  `grupa` VARCHAR(45) NOT NULL,
  `bursa` VARCHAR(45) NOT NULL,
  `statut` ENUM('restantier', 'bursier', 'admis') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nume_UNIQUE` (`nume` ASC) VISIBLE,
  UNIQUE INDEX `prenume_UNIQUE` (`prenume` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `universitate`.`curs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universitate`.`curs` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titlu` VARCHAR(45) NULL,
  `an` VARCHAR(45) NULL,
  `semestru` VARCHAR(45) NULL,
  `credite` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `universitate`.`nota`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universitate`.`nota` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `valoare_nota` VARCHAR(45) NULL,
  `student_id` INT NOT NULL,
  `curs_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_nota_student1_idx` (`student_id` ASC) VISIBLE,
  INDEX `fk_nota_curs1_idx` (`curs_id` ASC) VISIBLE,
  CONSTRAINT `fk_nota_student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `universitate`.`student` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_nota_curs1`
    FOREIGN KEY (`curs_id`)
    REFERENCES `universitate`.`curs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `universitate`.`predare`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universitate`.`predare` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `profesor_id` INT NOT NULL,
  `curs_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_predare_profesor1_idx` (`profesor_id` ASC) VISIBLE,
  INDEX `fk_predare_curs1_idx` (`curs_id` ASC) VISIBLE,
  CONSTRAINT `fk_predare_profesor1`
    FOREIGN KEY (`profesor_id`)
    REFERENCES `universitate`.`profesor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_predare_curs1`
    FOREIGN KEY (`curs_id`)
    REFERENCES `universitate`.`curs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- -----------------------------------------------------

INSERT INTO curs SET titlu = 'sql', an = '3', semestru = '1', credite = '5';
INSERT INTO curs SET titlu = 'oop', an = '1', semestru = '1', credite = '6';
INSERT INTO profesor SET nume = 'Mihai',prenume = 'Mihailescu', grad = 'III';
INSERT INTO studenmt SET nume = 'Andrei',prenume = 'Andreescu', gen = 'masculin', an = '3', grupa = '2', bursa = 'nu', statut = 'admis';
INSERT INTO studenmt SET nume = 'Ion',prenume = 'Popescu', gen = 'masculin', an = '1', grupa = '1', bursa = 'da', statut = 'bursier';

SELECT * FROM student;
SELECT * FROM curs;
SELECT * FROM profesor;

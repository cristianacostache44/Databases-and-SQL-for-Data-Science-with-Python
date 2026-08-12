-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sport` DEFAULT CHARACTER SET utf8 ;
USE `sport` ;

-- -----------------------------------------------------
-- Table `mydb`.`echipa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sport`.`echipa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nume` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`jucator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sport`.`jucator` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nume` VARCHAR(45) NULL,
  `echipa_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_jucator_echipa_idx` (`echipa_id` ASC) VISIBLE,
  CONSTRAINT `fk_jucator_echipa`
    FOREIGN KEY (`echipa_id`)
    REFERENCES `sport`.`echipa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

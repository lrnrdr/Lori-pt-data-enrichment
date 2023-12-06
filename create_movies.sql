-- MySQL Script generated by MySQL Workbench
-- Wed Dec  6 02:06:11 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema movies
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `movies` ;

-- -----------------------------------------------------
-- Schema movies
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `movies` DEFAULT CHARACTER SET utf8 ;
USE `movies` ;

-- -----------------------------------------------------
-- Table `movies`.`title_basics`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movies`.`title_basics` ;

CREATE TABLE IF NOT EXISTS `movies`.`title_basics` (
  `tconst` CHAR(12) NOT NULL,
  `primary_title` LONGTEXT NULL,
  `start_year` DATETIME NULL,
  `runtime` INT NULL,
  PRIMARY KEY (`tconst`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movies`.`ratings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movies`.`ratings` ;

CREATE TABLE IF NOT EXISTS `movies`.`ratings` (
  `tconst` CHAR(12) NOT NULL,
  `average_rating` FLOAT NULL,
  `number_of_votes` INT NULL,
  PRIMARY KEY (`tconst`),
  CONSTRAINT `fk_ratings_title_basics1`
    FOREIGN KEY (`tconst`)
    REFERENCES `movies`.`title_basics` (`tconst`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movies`.`genres`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movies`.`genres` ;

CREATE TABLE IF NOT EXISTS `movies`.`genres` (
  `genre_id` INT NOT NULL AUTO_INCREMENT,
  `genre_name` VARCHAR(45) NULL,
  PRIMARY KEY (`genre_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movies`.`title_genres`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movies`.`title_genres` ;

CREATE TABLE IF NOT EXISTS `movies`.`title_genres` (
  `tconst` CHAR(12) NOT NULL,
  `genre_id` INT NOT NULL,
  PRIMARY KEY (`tconst`, `genre_id`),
  INDEX `fk_title_basics_has_genres_genres1_idx` (`genre_id` ASC) VISIBLE,
  INDEX `fk_title_basics_has_genres_title_basics1_idx` (`tconst` ASC) VISIBLE,
  CONSTRAINT `fk_title_basics_has_genres_title_basics1`
    FOREIGN KEY (`tconst`)
    REFERENCES `movies`.`title_basics` (`tconst`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_title_basics_has_genres_genres1`
    FOREIGN KEY (`genre_id`)
    REFERENCES `movies`.`genres` (`genre_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

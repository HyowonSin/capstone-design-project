-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema 
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema data
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema data
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `data` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
-- -----------------------------------------------------
-- Schema information
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema information
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `information` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `data` ;

-- -----------------------------------------------------
-- Table `data`.`equipment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data`.`equipment` (
  `id` INT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `price` INT(10) UNSIGNED NOT NULL,
  `shipping charge` VARCHAR(15) NULL DEFAULT 'Free',
  `seller` VARCHAR(30) NULL DEFAULT NULL,
  `URL` VARCHAR(300) NOT NULL,
  `training_purpose` VARCHAR(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `training_purpose_UNIQUE` (`training_purpose` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `data`.`meal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data`.`meal` (
  `id` INT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `serving size` INT(5) UNSIGNED NULL,
  `calory` INT(5) UNSIGNED NULL DEFAULT NULL,
  `carbohydrate` INT(5) UNSIGNED NULL DEFAULT NULL,
  `protein` INT(5) UNSIGNED NULL DEFAULT NULL,
  `fat` INT(5) UNSIGNED NULL DEFAULT NULL,
  `training_purpose` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `data`.`vedio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data`.`vedio` (
  `id` INT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `title` VARCHAR(100) NULL DEFAULT NULL,
  `uploader` VARCHAR(30) NULL DEFAULT NULL,
  `URL` VARCHAR(300) NOT NULL,
  `training_purpose` VARCHAR(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `information` ;

-- -----------------------------------------------------
-- Table `information`.`member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `information`.`member` (
  `id` INT(5) UNSIGNED NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `password` VARCHAR(30) NOT NULL,
  `name` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `email_local_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `information`.`challenge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `information`.`challenge` (
  `id` INT(5) UNSIGNED NOT NULL,
  `member_id` INT(5) UNSIGNED NOT NULL,
  `training purpose` VARCHAR(1) NOT NULL,
  `challenge goal` VARCHAR(100) NULL DEFAULT NULL,
  `training to do` VARCHAR(100) NULL DEFAULT NULL,
  `start date` DATE NULL DEFAULT NULL,
  `end date` DATE NULL DEFAULT NULL,
  `certification day` VARCHAR(7) BINARY NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `member_id_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_challenge_member`
    FOREIGN KEY (`member_id`)
    REFERENCES `information`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `information`.`record`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `information`.`record` (
  `id` INT(5) UNSIGNED NOT NULL,
  `challenge_id` INT(5) UNSIGNED NOT NULL,
  `date` DATE NOT NULL,
  `result` VARCHAR(1) NOT NULL,
  `journal` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_record_challenge1_idx` (`challenge_id` ASC) VISIBLE,
  CONSTRAINT `fk_record_challenge1`
    FOREIGN KEY (`challenge_id`)
    REFERENCES `information`.`challenge` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

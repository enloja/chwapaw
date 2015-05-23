SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `chwapaw` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `chwapaw` ;

-- -----------------------------------------------------
-- Table `chwapaw`.`image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chwapaw`.`image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `path` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `chwapaw`.`person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chwapaw`.`person` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(45) NULL,
  `lastname` VARCHAR(45) NULL,
  `gender` VARCHAR(2) NULL,
  `uuid` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `chwapaw`.`groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chwapaw`.`groups` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(200) NULL,
  `code` VARCHAR(45) NOT NULL,
  `default_page` VARCHAR(200) NULL,
  `pass_exp_limit` INT(3) NULL,
  `uuid` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `chwapaw`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chwapaw`.`users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `person_id` INT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `language` VARCHAR(2) NULL,
  `image` INT NOT NULL,
  `groups_id` INT NOT NULL,
  `date` DATETIME NOT NULL,
  `status` TINYINT(3) NOT NULL,
  `authentificationtime` DATETIME NOT NULL,
  `userkey` VARCHAR(45) NOT NULL,
  `ip` VARCHAR(45) NOT NULL,
  `port` INT(11) NOT NULL,
  `created_by` INT NULL,
  `created_date` DATETIME NULL,
  `uuid` VARCHAR(38) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  INDEX `fk_users_image1_idx` (`image` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  INDEX `fk_users_person1_idx` (`person_id` ASC),
  INDEX `fk_users_groups1_idx` (`groups_id` ASC),
  CONSTRAINT `fk_users_image1`
    FOREIGN KEY (`image`)
    REFERENCES `chwapaw`.`image` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_person1`
    FOREIGN KEY (`person_id`)
    REFERENCES `chwapaw`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_groups1`
    FOREIGN KEY (`groups_id`)
    REFERENCES `chwapaw`.`groups` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `chwapaw`.`friend`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chwapaw`.`friend` (
  `id` INT(11) NOT NULL,
  `providerId` INT(11) NOT NULL,
  `requestId` INT(11) NOT NULL,
  `status` BINARY(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_friend_users_idx` (`providerId` ASC),
  INDEX `fk_friend_users1_idx` (`requestId` ASC),
  CONSTRAINT `fk_friend_users`
    FOREIGN KEY (`providerId`)
    REFERENCES `chwapaw`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_friend_users1`
    FOREIGN KEY (`requestId`)
    REFERENCES `chwapaw`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `chwapaw`.`message`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chwapaw`.`message` (
  `id` INT(255) NOT NULL,
  `messagetext` LONGTEXT NOT NULL,
  `fromuid` INT(11) NOT NULL,
  `touid` INT(11) NOT NULL,
  `sentdate` DATETIME NOT NULL,
  `read` TINYINT(1) NOT NULL,
  `readdate` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_message_users1_idx` (`fromuid` ASC),
  INDEX `fk_message_users2_idx` (`touid` ASC),
  CONSTRAINT `fk_message_users1`
    FOREIGN KEY (`fromuid`)
    REFERENCES `chwapaw`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_message_users2`
    FOREIGN KEY (`touid`)
    REFERENCES `chwapaw`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `chwapaw`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chwapaw`.`categories` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(200) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `chwapaw`.`sondage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chwapaw`.`sondage` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `question` VARCHAR(45) NULL,
  `categories_id` INT(11) NOT NULL,
  `users_id` INT(11) NOT NULL,
  `createddate` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_sondage_users1_idx` (`users_id` ASC),
  INDEX `fk_sondage_categories1_idx` (`categories_id` ASC),
  CONSTRAINT `fk_sondage_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `chwapaw`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sondage_categories1`
    FOREIGN KEY (`categories_id`)
    REFERENCES `chwapaw`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `chwapaw`.`answer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chwapaw`.`answer` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(45) NULL,
  `percent` VARCHAR(45) NULL,
  `createddate` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `chwapaw`.`vote`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chwapaw`.`vote` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `sondage_id` INT(11) NOT NULL,
  `answer_id` INT(11) NOT NULL,
  `users_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_vote_answer1_idx` (`answer_id` ASC),
  INDEX `fk_vote_users1_idx` (`users_id` ASC),
  INDEX `fk_vote_sondage1_idx` (`sondage_id` ASC),
  CONSTRAINT `fk_vote_answer1`
    FOREIGN KEY (`answer_id`)
    REFERENCES `chwapaw`.`answer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vote_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `chwapaw`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vote_sondage1`
    FOREIGN KEY (`sondage_id`)
    REFERENCES `chwapaw`.`sondage` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `chwapaw`.`sondage_answer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chwapaw`.`sondage_answer` (
  `id` INT(11) NOT NULL,
  `sondage` INT(11) NOT NULL,
  `answer` INT(11) NOT NULL,
  PRIMARY KEY (`sondage`, `answer`),
  INDEX `fk_sondage_has_answer_answer1_idx` (`answer` ASC),
  INDEX `fk_sondage_has_answer_sondage1_idx` (`sondage` ASC),
  CONSTRAINT `fk_sondage_has_answer_sondage1`
    FOREIGN KEY (`sondage`)
    REFERENCES `chwapaw`.`sondage` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sondage_has_answer_answer1`
    FOREIGN KEY (`answer`)
    REFERENCES `chwapaw`.`answer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `chwapaw`.`sondage_image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chwapaw`.`sondage_image` (
  `sondage_id` INT(11) NOT NULL,
  `image_id` INT NOT NULL,
  PRIMARY KEY (`sondage_id`, `image_id`),
  INDEX `fk_sondage_has_image_image1_idx` (`image_id` ASC),
  INDEX `fk_sondage_has_image_sondage1_idx` (`sondage_id` ASC),
  CONSTRAINT `fk_sondage_has_image_sondage1`
    FOREIGN KEY (`sondage_id`)
    REFERENCES `chwapaw`.`sondage` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sondage_has_image_image1`
    FOREIGN KEY (`image_id`)
    REFERENCES `chwapaw`.`image` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `chwapaw`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chwapaw`.`menu` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(100) NOT NULL,
  `position` INT(5) NOT NULL,
  `url` VARCHAR(200) NULL,
  `path` VARCHAR(100) NULL,
  `parent_id` INT NULL,
  `uuid` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `chwapaw`.`group_menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chwapaw`.`group_menu` (
  `group_id` INT NOT NULL,
  `menu_id` INT NOT NULL,
  PRIMARY KEY (`group_id`, `menu_id`),
  INDEX `fk_groups_has_menu_menu1_idx` (`menu_id` ASC),
  INDEX `fk_groups_has_menu_groups1_idx` (`group_id` ASC),
  CONSTRAINT `fk_groups_has_menu_groups1`
    FOREIGN KEY (`group_id`)
    REFERENCES `chwapaw`.`groups` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_groups_has_menu_menu1`
    FOREIGN KEY (`menu_id`)
    REFERENCES `chwapaw`.`menu` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

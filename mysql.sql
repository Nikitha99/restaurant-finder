

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema restaurant_locator
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema restaurant_locator
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `restaurant_locator` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `restaurant_locator` ;

-- -----------------------------------------------------
-- Table `restaurant_locator`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_locator`.`users` (
  `id` INT NOT NULL COMMENT '',
  `email` VARCHAR(100) NULL COMMENT '',
  `password` VARCHAR(100) NULL COMMENT '',
  `first_name` VARCHAR(45) NULL COMMENT '',
  `last_name` VARCHAR(45) NULL COMMENT '',
  `phone` INT NULL COMMENT '',
  `type` ENUM('user', 'restaurant_owner', 'admin') NULL COMMENT '',
  `status` INT NULL COMMENT '',
  `created_at` TIMESTAMP NULL COMMENT '',
  `updated_at` TIMESTAMP NULL COMMENT '',
  `deleted_at` TIMESTAMP NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  UNIQUE INDEX `email_UNIQUE` (`email` ASC)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_locator`.`users_meta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_locator`.`users_meta` (
  `id` INT NOT NULL COMMENT '',
  `user_id` INT NULL COMMENT '',
  `value` VARCHAR(45) NULL COMMENT '',
  `option` VARCHAR(100) NULL COMMENT '',
  `created_at` TIMESTAMP NULL COMMENT '',
  `updated_at` TIMESTAMP NULL COMMENT '',
  `deleted_at` TIMESTAMP NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `user_id_idx` (`user_id` ASC)  COMMENT '',
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `restaurant_locator`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_locator`.`restaurant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_locator`.`restaurant` (
  `id` INT NOT NULL COMMENT '',
  `owner_id` INT NULL COMMENT '',
  `name` VARCHAR(100) NULL COMMENT '',
  `address1` VARCHAR(45) NULL COMMENT '',
  `address2` VARCHAR(45) NULL COMMENT '',
  `city` VARCHAR(45) NULL COMMENT '',
  `state` VARCHAR(45) NULL COMMENT '',
  `zipcode` INT NULL COMMENT '',
  `phone` INT(12) NULL COMMENT '',
  `image` VARCHAR(100) NULL COMMENT '',
  `open_time` TIME NULL COMMENT '',
  `close_time` TIME NULL COMMENT '',
  `pos_lat` VARCHAR(45) NULL COMMENT '',
  `pos_lon` VARCHAR(45) NULL COMMENT '',
  `rating` INT NULL COMMENT '',
  `status` INT NULL COMMENT '',
  `created_at` TIMESTAMP NULL COMMENT '',
  `updated_at` TIMESTAMP NULL COMMENT '',
  `deleted_at` TIMESTAMP NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `owner_id_idx` (`owner_id` ASC)  COMMENT '',
  CONSTRAINT `owner_id`
    FOREIGN KEY (`owner_id`)
    REFERENCES `restaurant_locator`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_locator`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_locator`.`menu` (
  `id` INT NOT NULL COMMENT '',
  `restaurant_id` INT NULL COMMENT '',
  `item` VARCHAR(45) NULL COMMENT '',
  `detail` VARCHAR(100) NULL COMMENT '',
  `image` VARCHAR(100) NULL COMMENT '',
  `price` DOUBLE NULL COMMENT '',
  `created_at` TIMESTAMP NULL COMMENT '',
  `updated_at` TIMESTAMP NULL COMMENT '',
  `deleted_at` TIMESTAMP NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `restaurant_id_idx` (`restaurant_id` ASC)  COMMENT '',
  CONSTRAINT `restaurant_id`
    FOREIGN KEY (`restaurant_id`)
    REFERENCES `restaurant_locator`.`restaurant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_locator`.`credit_cards`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_locator`.`credit_cards` (
  `id` INT NOT NULL COMMENT '',
  `user_id` INT NULL COMMENT '',
  `label` VARCHAR(45) NULL COMMENT '',
  `cardnumber` INT(16) NULL COMMENT '',
  `expiry_date` DATE NULL COMMENT '',
  `cvv` INT NULL COMMENT '',
  `name_on_the_card` VARCHAR(100) NULL COMMENT '',
  `created_at` TIMESTAMP NULL COMMENT '',
  `updated_at` TIMESTAMP NULL COMMENT '',
  `deleted_at` TIMESTAMP NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `user_id_idx` (`user_id` ASC)  COMMENT '',
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `restaurant_locator`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_locator`.`delivery_address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_locator`.`delivery_address` (
  `id` INT NOT NULL COMMENT '',
  `user_id` INT NULL COMMENT '',
  `line1` VARCHAR(45) NULL COMMENT '',
  `line2` VARCHAR(45) NULL COMMENT '',
  `city` VARCHAR(45) NULL COMMENT '',
  `state` VARCHAR(45) NULL COMMENT '',
  `zipcode` INT NULL COMMENT '',
  `phone` INT(12) NULL COMMENT '',
  `status` INT NULL COMMENT '',
  `created_at` TIMESTAMP NULL COMMENT '',
  `updated_at` TIMESTAMP NULL COMMENT '',
  `deleted_at` TIMESTAMP NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `user_id_idx` (`user_id` ASC)  COMMENT '',
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `restaurant_locator`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_locator`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_locator`.`order` (
  `id` INT NOT NULL COMMENT '',
  `user_id` INT NULL COMMENT '',
  `restaurant_id` INT NULL COMMENT '',
  `total` DOUBLE NULL COMMENT '',
  `card_id` INT NULL COMMENT '',
  `created_at` TIMESTAMP NULL COMMENT '',
  `status` INT NULL COMMENT '',
  `created_at_copy1` TIMESTAMP NULL COMMENT '',
  `updated_at` TIMESTAMP NULL COMMENT '',
  `deleted_at` TIMESTAMP NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `user_id_idx` (`user_id` ASC)  COMMENT '',
  INDEX `restaurant_id_idx` (`restaurant_id` ASC)  COMMENT '',
  INDEX `card_id_idx` (`card_id` ASC)  COMMENT '',
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `restaurant_locator`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `restaurant_id`
    FOREIGN KEY (`restaurant_id`)
    REFERENCES `restaurant_locator`.`restaurant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `card_id`
    FOREIGN KEY (`card_id`)
    REFERENCES `restaurant_locator`.`credit_cards` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_locator`.`order_menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_locator`.`order_menu` (
  `id` INT NOT NULL COMMENT '',
  `order_id` INT NULL COMMENT '',
  `menu_id` INT NULL COMMENT '',
  `quantity` INT NULL COMMENT '',
  `price` INT NULL COMMENT '',
  `created_at` TIMESTAMP NULL COMMENT '',
  `updated_at` TIMESTAMP NULL COMMENT '',
  `deleted_at` TIMESTAMP NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `order_id_idx` (`order_id` ASC)  COMMENT '',
  INDEX `menu_id_idx` (`menu_id` ASC)  COMMENT '',
  CONSTRAINT `order_id`
    FOREIGN KEY (`order_id`)
    REFERENCES `restaurant_locator`.`order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `menu_id`
    FOREIGN KEY (`menu_id`)
    REFERENCES `restaurant_locator`.`menu` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_locator`.`review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_locator`.`review` (
  `id` INT NOT NULL COMMENT '',
  `user_id` INT NULL COMMENT '',
  `restaurant_id` INT NULL COMMENT '',
  `content` TEXT NULL COMMENT '',
  `rating` INT NULL COMMENT '',
  `created_at` TIMESTAMP NULL COMMENT '',
  `updated_at` TIMESTAMP NULL COMMENT '',
  `deleted_at` TIMESTAMP NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `user_id_idx` (`user_id` ASC)  COMMENT '',
  INDEX `restaurant_id_idx` (`restaurant_id` ASC)  COMMENT '',
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `restaurant_locator`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `restaurant_id`
    FOREIGN KEY (`restaurant_id`)
    REFERENCES `restaurant_locator`.`restaurant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_locator`.`table name`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_locator`.`table name` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

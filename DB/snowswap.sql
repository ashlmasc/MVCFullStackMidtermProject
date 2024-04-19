-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema snowswapdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `snowswapdb` ;

-- -----------------------------------------------------
-- Schema snowswapdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `snowswapdb` DEFAULT CHARACTER SET utf8 ;
USE `snowswapdb` ;

-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(200) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `postal_code` INT(5) NULL,
  `phone_number` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `enabled` TINYINT NULL,
  `role` VARCHAR(45) NULL,
  `created_at` DATETIME NULL,
  `update_at` DATETIME NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `bio` VARCHAR(1000) NULL,
  `image_url` VARCHAR(2000) NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  INDEX `fk_user_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_user_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `resort`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `resort` ;

CREATE TABLE IF NOT EXISTS `resort` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address_id` INT NOT NULL,
  `website` VARCHAR(1000) NULL,
  `name` VARCHAR(200) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_resort_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_resort_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `ride`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ride` ;

CREATE TABLE IF NOT EXISTS `ride` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sponsor_id` INT NOT NULL,
  `departure_address_id` INT NOT NULL,
  `departure` DATETIME NOT NULL,
  `created_at` DATETIME NULL,
  `resort_id` INT NOT NULL,
  `active` TINYINT NULL,
  `detail` VARCHAR(1000) NULL,
  `vehicle_capacity` INT(2) NULL,
  `vehicle_make` VARCHAR(45) NULL,
  `vehicle_model` VARCHAR(45) NULL,
  `arrival_address_id` INT NULL,
  `updated_at` DATETIME NULL,
  `image_url` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ride_user1_idx` (`sponsor_id` ASC),
  INDEX `fk_ride_address1_idx` (`departure_address_id` ASC),
  INDEX `fk_ride_resort1_idx` (`resort_id` ASC),
  INDEX `fk_ride_address2_idx` (`arrival_address_id` ASC),
  CONSTRAINT `fk_ride_user1`
    FOREIGN KEY (`sponsor_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ride_address1`
    FOREIGN KEY (`departure_address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ride_resort1`
    FOREIGN KEY (`resort_id`)
    REFERENCES `resort` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ride_address2`
    FOREIGN KEY (`arrival_address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `event_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_type` ;

CREATE TABLE IF NOT EXISTS `event_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(100) NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event` ;

CREATE TABLE IF NOT EXISTS `event` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `event_start` DATETIME NOT NULL,
  `description` TEXT NULL,
  `created_at` DATETIME NULL,
  `event_type_id` INT NOT NULL,
  `active` TINYINT NOT NULL,
  `updated_at` DATETIME NULL,
  `address_id` INT NOT NULL,
  `location_description` TEXT NULL,
  `name` TEXT NULL,
  `event_end` DATETIME NULL,
  `image_url` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_event_user1_idx` (`user_id` ASC),
  INDEX `fk_event_event_type1_idx` (`event_type_id` ASC),
  INDEX `fk_event_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_event_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_event_type1`
    FOREIGN KEY (`event_type_id`)
    REFERENCES `event_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `trail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trail` ;

CREATE TABLE IF NOT EXISTS `trail` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `difficulty` VARCHAR(45) NULL,
  `resort_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_trail_resort1_idx` (`resort_id` ASC),
  CONSTRAINT `fk_trail_resort1`
    FOREIGN KEY (`resort_id`)
    REFERENCES `resort` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `lift_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lift_type` ;

CREATE TABLE IF NOT EXISTS `lift_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `lift`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lift` ;

CREATE TABLE IF NOT EXISTS `lift` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NULL,
  `lift_type_id` INT NOT NULL,
  `resort_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_lift_lift_type1_idx` (`lift_type_id` ASC),
  INDEX `fk_lift_resort1_idx` (`resort_id` ASC),
  CONSTRAINT `fk_lift_lift_type1`
    FOREIGN KEY (`lift_type_id`)
    REFERENCES `lift_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lift_resort1`
    FOREIGN KEY (`resort_id`)
    REFERENCES `resort` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `event_attendee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_attendee` ;

CREATE TABLE IF NOT EXISTS `event_attendee` (
  `user_id` INT NOT NULL,
  `event_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `event_id`),
  INDEX `fk_user_has_event_event1_idx` (`event_id` ASC),
  INDEX `fk_user_has_event_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_event_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_event_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `lift_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lift_status` ;

CREATE TABLE IF NOT EXISTS `lift_status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `occurrence_date` DATETIME NULL,
  `status` VARCHAR(50) NULL,
  `lift_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_lift_status_lift1_idx` (`lift_id` ASC),
  CONSTRAINT `fk_lift_status_lift1`
    FOREIGN KEY (`lift_id`)
    REFERENCES `lift` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `traill_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `traill_status` ;

CREATE TABLE IF NOT EXISTS `traill_status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `occurrence_date` DATETIME NULL,
  `status` VARCHAR(50) NULL,
  `trail_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_traill_status_trail1_idx` (`trail_id` ASC),
  CONSTRAINT `fk_traill_status_trail1`
    FOREIGN KEY (`trail_id`)
    REFERENCES `trail` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comment` ;

CREATE TABLE IF NOT EXISTS `comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comment_content` TEXT NULL,
  `created_date` DATETIME NULL,
  `user_id` INT NOT NULL,
  `event_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comment_user1_idx` (`user_id` ASC),
  INDEX `fk_comment_event1_idx` (`event_id` ASC),
  CONSTRAINT `fk_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

SET SQL_MODE = '';
DROP USER IF EXISTS genuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'genuser'@'localhost' IDENTIFIED BY 'genuser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'genuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `snowswapdb`;
INSERT INTO `address` (`id`, `street`, `city`, `state`, `postal_code`, `phone_number`) VALUES (1, '509 Copper Rd', 'Frisco', 'Colorado', 80443, '866-841-2549');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `postal_code`, `phone_number`) VALUES (2, '6701 W Alameda Ave', 'Lakewood', 'Colorado', 80226, '235-324-5324');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `snowswapdb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `created_at`, `update_at`, `first_name`, `last_name`, `bio`, `image_url`, `address_id`) VALUES (1, 'admin', 'sspass', 1, 'standard', '2024-03-13', '2024-03-20', 'Kim', 'Possible', 'A high school cheerleader moonlighting as a teenage crime fighter, special agent, and spy.', 'https://static.wikia.nocookie.net/theunitedorganizationtoonsheroes/images/b/b3/Kim_Possible_portrait.jpg/revision/latest?cb=20170430000636', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `resort`
-- -----------------------------------------------------
START TRANSACTION;
USE `snowswapdb`;
INSERT INTO `resort` (`id`, `address_id`, `website`, `name`) VALUES (1, 1, 'https://www.coppercolorado.com/', 'Copper Mountain');

COMMIT;


-- -----------------------------------------------------
-- Data for table `ride`
-- -----------------------------------------------------
START TRANSACTION;
USE `snowswapdb`;
INSERT INTO `ride` (`id`, `sponsor_id`, `departure_address_id`, `departure`, `created_at`, `resort_id`, `active`, `detail`, `vehicle_capacity`, `vehicle_make`, `vehicle_model`, `arrival_address_id`, `updated_at`, `image_url`) VALUES (1, 1, 2, '2024-11-12 08:00', '2024-04-12 13:00', 1, 1, 'Meet up infrom of home depot', 6, 'Kia', 'Rondo', 1, '2024-04-20 13:00', 'https://corporate.homedepot.com/sites/default/files/image_gallery/Company_Home%20Depot_Storefront.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `event_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `snowswapdb`;
INSERT INTO `event_type` (`id`, `type`) VALUES (1, 'Meetup');
INSERT INTO `event_type` (`id`, `type`) VALUES (2, 'Board Waxing');

COMMIT;


-- -----------------------------------------------------
-- Data for table `event`
-- -----------------------------------------------------
START TRANSACTION;
USE `snowswapdb`;
INSERT INTO `event` (`id`, `user_id`, `event_start`, `description`, `created_at`, `event_type_id`, `active`, `updated_at`, `address_id`, `location_description`, `name`, `event_end`, `image_url`) VALUES (1, 1, '2024-05-14 09:00', 'Lets enjou the slopes together.', '2024-04-14 09:00', 1, 1, '2024-04-14 10:00', 1, 'In the lobby of Copper Mountain', 'Group get together', '2024-04-14 17:00', 'https://cdn.ski/seq5OnNnD6LfpXu0.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `trail`
-- -----------------------------------------------------
START TRANSACTION;
USE `snowswapdb`;
INSERT INTO `trail` (`id`, `name`, `difficulty`, `resort_id`) VALUES (1, '17 Glade', 'Most Difficult', 1);
INSERT INTO `trail` (`id`, `name`, `difficulty`, `resort_id`) VALUES (2, 'American Flyer', 'More Difficult', 1);
INSERT INTO `trail` (`id`, `name`, `difficulty`, `resort_id`) VALUES (3, 'Bridgeway', 'Easiest', 1);
INSERT INTO `trail` (`id`, `name`, `difficulty`, `resort_id`) VALUES (4, 'Carefree (L)', 'More Difficult', 1);
INSERT INTO `trail` (`id`, `name`, `difficulty`, `resort_id`) VALUES (5, 'Lower Enchanted Forest', 'Extreme Terrain', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `lift_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `snowswapdb`;
INSERT INTO `lift_type` (`id`, `type`) VALUES (1, 'Telemix');
INSERT INTO `lift_type` (`id`, `type`) VALUES (2, 'Double');
INSERT INTO `lift_type` (`id`, `type`) VALUES (3, 'Triple');
INSERT INTO `lift_type` (`id`, `type`) VALUES (4, 'Quad');
INSERT INTO `lift_type` (`id`, `type`) VALUES (5, '6-Person');
INSERT INTO `lift_type` (`id`, `type`) VALUES (6, 'Carpet');
INSERT INTO `lift_type` (`id`, `type`) VALUES (7, 'Surface');

COMMIT;


-- -----------------------------------------------------
-- Data for table `lift`
-- -----------------------------------------------------
START TRANSACTION;
USE `snowswapdb`;
INSERT INTO `lift` (`id`, `name`, `lift_type_id`, `resort_id`) VALUES (1, 'American Eagle', 1, 1);
INSERT INTO `lift` (`id`, `name`, `lift_type_id`, `resort_id`) VALUES (2, 'American Flyer', 5, 1);
INSERT INTO `lift` (`id`, `name`, `lift_type_id`, `resort_id`) VALUES (3, 'Excelerator', 4, 1);
INSERT INTO `lift` (`id`, `name`, `lift_type_id`, `resort_id`) VALUES (4, 'Kokomo Express', 4, 1);
INSERT INTO `lift` (`id`, `name`, `lift_type_id`, `resort_id`) VALUES (5, 'Lumberjack', 3, 1);
INSERT INTO `lift` (`id`, `name`, `lift_type_id`, `resort_id`) VALUES (6, 'Rugrat', 6, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `event_attendee`
-- -----------------------------------------------------
START TRANSACTION;
USE `snowswapdb`;
INSERT INTO `event_attendee` (`user_id`, `event_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `lift_status`
-- -----------------------------------------------------
START TRANSACTION;
USE `snowswapdb`;
INSERT INTO `lift_status` (`id`, `occurrence_date`, `status`, `lift_id`) VALUES (1, '2024-04-19 08:00', 'Open', 1);
INSERT INTO `lift_status` (`id`, `occurrence_date`, `status`, `lift_id`) VALUES (2, '2024-04-19 08:00', 'Closed', 3);
INSERT INTO `lift_status` (`id`, `occurrence_date`, `status`, `lift_id`) VALUES (3, '2024-04-19 08:00', 'On Hold', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `traill_status`
-- -----------------------------------------------------
START TRANSACTION;
USE `snowswapdb`;
INSERT INTO `traill_status` (`id`, `occurrence_date`, `status`, `trail_id`) VALUES (1, '2024-04-19 08:00', 'Open', 1);
INSERT INTO `traill_status` (`id`, `occurrence_date`, `status`, `trail_id`) VALUES (2, '2024-04-19 08:00', 'Closed', 3);
INSERT INTO `traill_status` (`id`, `occurrence_date`, `status`, `trail_id`) VALUES (3, '2024-04-19 08:00', 'Open', 4);
INSERT INTO `traill_status` (`id`, `occurrence_date`, `status`, `trail_id`) VALUES (4, '2024-04-19 08:00', 'On Hold', 2);

COMMIT;


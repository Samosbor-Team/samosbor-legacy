CREATE TABLE `honorsystem` (
    `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `byond` VARCHAR(64) NOT NULL,
    `honor` INT(11) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `byond` (`byond`)
)
ENGINE=InnoDB
AUTO_INCREMENT=1
;